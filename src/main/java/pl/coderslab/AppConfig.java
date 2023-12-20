package pl.coderslab;

import jakarta.validation.Validator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
//@EnableWebMvc
//@ComponentScan(basePackages = "pl.coderslab")
//@EnableTransactionManagement
public class AppConfig implements WebMvcConfigurer {
    /*@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }*/
//    @Bean
//    public Validator validator() {
//        return new LocalValidatorFactoryBean();
//    }

//    @Override
//    public void configureViewResolvers(ViewResolverRegistry registry) {
//        registry.jsp("/WEB-INF/views/", ".jsp");
//    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/static/js/");
//        registry.addResourceHandler("/resources/**")
//                .addResourceLocations("/resources/");
    }

}
