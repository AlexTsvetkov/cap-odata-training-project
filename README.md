# Springboot CAP ODATA project 

### Tutorials used for creating an application in the Cloud Foundry Environment:

* [Build a Business Application Using CAP for Java](https://developers.sap.com/mission.cap-java-app.html)
* [CAPire official documentation](https://cap.cloud.sap/docs/get-started/jumpstart)
* [Start Using SAP HANA Cloud Trial in SAP BTP Cockpit](https://developers.sap.com/tutorials/hana-cloud-mission-trial-2.html)

cf space <space_name> --guid

### Useful commands
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
