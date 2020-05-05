package com.yayo;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@Import(MapperConfig.class)
@EnableAspectJAutoProxy
public class MyConfiguration implements WebMvcConfigurer {

}
