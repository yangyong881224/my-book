package com.yayo.sys.conf;

import com.yayo.sys.shiro.CustomRealm;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {


    @Bean(name="shiroFilter")
    public ShiroFilterFactoryBean shiroFilter(SecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        shiroFilterFactoryBean.setLoginUrl("/");
        shiroFilterFactoryBean.setUnauthorizedUrl("/");
        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<>();
        /*authc:所有url都必须认证通过才可以访问；anon：所有url都可以匿名访问*/
        filterChainDefinitionMap.put("/assets/**","anon");
        filterChainDefinitionMap.put("/api/admin/login","anon");
        filterChainDefinitionMap.put("/","anon");
        filterChainDefinitionMap.put("/api/user/**","anon");

        filterChainDefinitionMap.put("/api/admin/**","authc");

        //主要这行代码必须放在所有选线设置的所有，不然会导致所有url都被拦截，剩余的都需要认证

        filterChainDefinitionMap.put("/**","authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        defaultWebSecurityManager.setRealm(customRealm());
        return defaultWebSecurityManager;
    }

    @Bean
    public CustomRealm customRealm(){
        CustomRealm customRealm = new CustomRealm();
        return customRealm;
    }
}
