# Springboot CAP ODATA project

### Prerequisites
 * You have an SAP BTP Trial account [Get a Free Account on SAP BTP Trial](https://developers.sap.com/tutorials/hcp-create-trial-account.html)
 * Java 17 
 * Node v20.5.0 or higher

### Tutorials used for creating an application in the Cloud Foundry Environment:

* [Build a Business Application Using CAP for Java](https://developers.sap.com/mission.cap-java-app.html)
* [CAPire official documentation](https://cap.cloud.sap/docs/get-started/jumpstart)
* [Start Using SAP HANA Cloud Trial in SAP BTP Cockpit](https://developers.sap.com/tutorials/hana-cloud-mission-trial-2.html)

### Useful commands

Get space guid

```
cf space <space_name> --guid
```

Create application skeleton:

```
mvn -B archetype:generate -DarchetypeArtifactId=cds-services-archetype -DarchetypeGroupId=com.sap.cds \
-DarchetypeVersion=RELEASE -DjdkVersion=17 \
-DgroupId=com.sap.cap -DartifactId=products-service -Dpackage=com.sap.cap.productsservice
```

Generate mta file for project:

```
cds add mta
```
Terminal hotkeys:

clean word: `Command` + `Control` + `W`\
Delete the line: `Command` + `Control` + `U`

### How to configure multitenancy support

1. Add xsuaa and approuter to your project:  run `cds add approuter`. \
   This will create `app` directory in your project root with approuter application and `xs-security.json` file with
   configuration for auth,\
   also in `.cdsrc.json` will be added xsuaa configuration, the whole json will look like this:

```json
{
  "build": {
    "target": "."
  },
  "hana": {
    "deploy-format": "hdbtable"
  },
  "requires": {
    "auth": "xsuaa"
  }
}
```

2. Add `mtx sidecar` node.js module to your project and update your `.cdsrc.json`: run `cds add multitenancy`. \
   mtx directory will be added to the project's root, your `.cdsrc.json` will be updated with some configurations for
   multitenancy and will look like this:

```json
{
  "build": {
    "target": "."
  },
  "hana": {
    "deploy-format": "hdbtable"
  },
  "requires": {
    "auth": "xsuaa",
    "multitenancy": true
  },
  "profiles": [
    "with-mtx-sidecar",
    "java"
  ]
}
```

`xs-security` file will be also updated and will look like:

```json
{
  "scopes": [
    {
      "name": "$XSAPPNAME.mtcallback",
      "description": "Subscription via SaaS Registry",
      "grant-as-authority-to-apps": [
        "$XSAPPNAME(application,sap-provisioning,tenant-onboarding)"
      ]
    }
  ],
  "attributes": [],
  "role-templates": []
}

```

3. Now we need to generate `mta.yaml` deployment file that will include all previously configured modules,
   run `cds add mta`
4. In the generated `mta.yaml` we need to modify several modules:
- In module xsuaa add `oauth2-configuration for redirect uris` and add `dependency to your approuter`, xsuaa module should look like this:
```yaml
  - name: bookstore-xsuaa-service
    type: org.cloudfoundry.managed-service
    parameters:
      service: xsuaa
      service-plan: application
      path: ./xs-security.json
      config:
        xsappname: bookstore-${org}-${space}
        tenant-mode: shared
        oauth2-configuration:
          redirect-uris:
            - https://*.~{approuter-app-api/domain}/**
    requires:
      - name: approuter-app-api
```      
- In `MTX` module delete dependency for `approuter` in `requires` section
```yaml
#this part should be deleted:
      - name: approuter-api
        properties:
          SUBSCRIPTION_URL: ~{app-protocol}://\${tenant_subdomain}-~{app-uri}
```

### Deploy Multitenant Application:

- Run `mbt build`
- Run `cf login`
- Run `cf deploy mta_archives/bookstore_1.0.0-SNAPSHOT.mtar`
- Go to another subaccount in your global account, under subscriptions and subscribe to the application you deployed.
- Run `cf map-route bookstore-approuter <YOUR DOMAIN> --hostname <SUBSCRIBER TENANT>-<ORG>-<SPACE>-bookstore-approuter`
  or create and bind the route manually.\
  Example: `cf map-route bookstore-approuter cfapps.us10-001.hana.ondemand.com --hostname tenant2-wm0m8hbo-c3fbaed9trial-dev-bookstore-approuter`

