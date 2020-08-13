package com.xxg.xtool.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "tencentcloud")
public class TencentCloudProperties {

    private String secretId;
    private String secretKey;
}
