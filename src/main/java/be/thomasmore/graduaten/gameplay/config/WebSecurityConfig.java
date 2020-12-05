package be.thomasmore.graduaten.gameplay.config;

import be.thomasmore.graduaten.gameplay.service.UserDetailsServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/h2-console/**");
    }

    @Bean
    public  UserDetailsService userDetailsService(){ return new UserDetailsServiceImpl(); }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());

        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                //AUTHENTICATION
                .authorizeRequests()
                .antMatchers("/products/buy","/products/rent").authenticated()
                .antMatchers("/admin", "/admin/**").hasAnyAuthority("ADMIN")
                .antMatchers("/publishers","/logout").hasAnyAuthority("USER","ADMIN")

                .antMatchers("/","/index","/contact","/genres/**","/products/**","/search","/users/**","/users/registration/*","/orders/**","/orderproducts/**","/error/**").permitAll()



                .antMatchers("/css/**", "/js/**", "/images/**","/icons/**").permitAll()
                .antMatchers(HttpMethod.POST,"/products/do-create").permitAll()
                .antMatchers("/login").anonymous()
                .anyRequest().authenticated()
                .and()


                //LOG IN
                .formLogin().permitAll()
                .loginPage("/login")
                .failureUrl("/login?error=true")
                //.loginProcessingUrl("/perform_login")
                //.defaultSuccessUrl("/publishers", true)
                //.failureHandler(authenticationFailureHandler())

                .and()

                //LOGOUT
                .logout().permitAll()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")

                .and()

                .exceptionHandling().accessDeniedPage("/403");
        http.csrf().disable();
    }

}



