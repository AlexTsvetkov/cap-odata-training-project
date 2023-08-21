package com.sap.cap.bookstore.configuration;

import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.web.util.matcher.AntPathRequestMatcher.antMatcher;

@Configuration
@ConditionalOnWebApplication
@EnableWebSecurity
@Order(1)
public class WebSecurityConfig {

    @Bean
    public SecurityFilterChain configure(HttpSecurity http) throws Exception {
        return http.securityMatchers(s -> s.requestMatchers(antMatcher("/actuator/health"), antMatcher("/swagger/**"))) //
                .csrf(AbstractHttpConfigurer::disable)
				.authorizeHttpRequests(a -> a.anyRequest().permitAll())
                .build();
    }
}
