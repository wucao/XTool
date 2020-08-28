package com.xxg.xtool.controller;

import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.xxg.xtool.enums.TencentCloudOcrDataType;
import com.xxg.xtool.service.TencentCloudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/ocr")
public class OcrController {

    @Autowired
    private TencentCloudService tencentCloudService;

    @GetMapping("/index")
    public String index() {
        return "ocr/index";
    }

    @ResponseBody
    @PostMapping("/tencentCloudOcrByUrl")
    public List<String> tencentCloudOcrByUrl(String url) throws TencentCloudSDKException {
        List<String> textList = tencentCloudService.ocr(url, TencentCloudOcrDataType.URL);
        return textList;
    }

    @ResponseBody
    @PostMapping("/tencentCloudOcrByFile")
    public List<String> tencentCloudOcrByFile(MultipartFile file) throws TencentCloudSDKException, IOException {
        byte[] date = file.getBytes();
        String base64 = Base64.getEncoder().encodeToString(date);
        List<String> textList = tencentCloudService.ocr(base64, TencentCloudOcrDataType.BASE64);
        return textList;
    }
}
