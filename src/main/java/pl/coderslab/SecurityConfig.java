package pl.coderslab;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/").permitAll()
                        .requestMatchers("/WEB-INF/views/*.jsp").permitAll()
                        .requestMatchers("/WEB-INF/views/reservation/*.jsp").permitAll()
                        .requestMatchers("/WEB-INF/views/reservation/newReservationDetails.jsp").permitAll()
                        .requestMatchers("/reservation/saveDate").permitAll()
                        .requestMatchers("/reservation/finalPage").permitAll()
                        .requestMatchers(
                                "/reservation/newReservation",
                                "/reservation/saveFinalReservation",
                                "/reservation/",
                                "/contact",
                                "/css/**",
                                "/js/**",
                                "/images/**").permitAll()
                        .requestMatchers("/user/**").hasAuthority("ROLE_USER")
                        .requestMatchers("/admin/main").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/confirmReservations").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/allReservations").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/clientOutOfParking").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/outParking").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/confirmed").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/denied").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/edit").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/editConfirm").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/admin/markEnter").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/WEB-INF/views/admin/adminMenu.jsp").hasAuthority("ROLE_ADMIN")
                        .anyRequest().authenticated()
                )
                .formLogin(formLogin -> formLogin
                                .loginProcessingUrl("/perform_login")
                                .permitAll()
//                        .successHandler(new SavedRequestAwareAuthenticationSuccessHandler())
                                .defaultSuccessUrl("/admin/main", true) // Można odkomentować, jeśli jest potrzebne
                                .failureUrl("/login?error=true")
                )
                .logout(logout -> logout
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
                        .logoutSuccessUrl("/?logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .clearAuthentication(true)
                        .permitAll()
                );
        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}