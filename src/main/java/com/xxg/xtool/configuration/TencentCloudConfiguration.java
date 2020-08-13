package com.xxg.xtool.configuration;

import com.tencentcloudapi.common.Credential;
import com.xxg.xtool.properties.TencentCloudProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TencentCloudConfiguration {

    @Autowired
    private TencentCloudProperties tencentCloudProperties;

    @Bean
    public Credential credential() {
        return new Credential(tencentCloudProperties.getSecretId(), tencentCloudProperties.getSecretKey());
    }
}
