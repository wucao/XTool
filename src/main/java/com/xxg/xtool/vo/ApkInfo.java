package com.xxg.xtool.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ApkInfo {

    private long size;
    private String md5;
    private String packageName;
    private Long versionCode;
    private String versionName;
    private String compileSdkVersion;
    private String minSdkVersion;
    private String maxSdkVersion;
    private String targetSdkVersion;
}
