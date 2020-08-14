package com.xxg.xtool.controller;

import com.xxg.xtool.vo.ApkInfo;
import net.dongliu.apk.parser.ApkFile;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequestMapping("/apkParser")
public class ApkParserController {

    @GetMapping("/index")
    public String index() {
        return "apkParser/index";
    }

    @ResponseBody
    @PostMapping("/uploadAndParse")
    public ApkInfo uploadAndParse(MultipartFile file) throws IOException {
        String localFile = UUID.randomUUID().toString() + ".apk";

        InputStream inputStream = file.getInputStream();
        FileUtils.copyInputStreamToFile(inputStream, new File(localFile));

        String md5;
        try (InputStream fileInput = new FileInputStream(localFile)) {
            md5 = DigestUtils.md5DigestAsHex(fileInput);
        }

        try (ApkFile apkFile = new ApkFile(localFile)) {
            return ApkInfo.builder().size(file.getSize()).md5(md5)
                    .packageName(apkFile.getApkMeta().getPackageName())
                    .versionCode(apkFile.getApkMeta().getVersionCode())
                    .versionName(apkFile.getApkMeta().getVersionName())
                    .compileSdkVersion(apkFile.getApkMeta().getCompileSdkVersion())
                    .minSdkVersion(apkFile.getApkMeta().getMinSdkVersion())
                    .maxSdkVersion(apkFile.getApkMeta().getMaxSdkVersion())
                    .targetSdkVersion(apkFile.getApkMeta().getTargetSdkVersion())
                    .build();
        } finally {
            FileUtils.deleteQuietly(new File(localFile));
        }
    }
}
