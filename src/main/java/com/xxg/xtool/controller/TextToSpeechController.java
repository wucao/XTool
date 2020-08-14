package com.xxg.xtool.controller;

import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.xxg.xtool.service.TencentCloudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Base64;

@Controller
@RequestMapping("/textToSpeech")
public class TextToSpeechController {

    @Autowired
    private TencentCloudService tencentCloudService;

    @GetMapping("/index")
    public String index() {
        return "textToSpeech/index";
    }

    /**
     * 腾讯云 语音合成 TTS
     * 产品首页： https://cloud.tencent.com/product/tts
     * 控制台： https://console.cloud.tencent.com/tts
     * API 文档: https://cloud.tencent.com/document/api/1073/37995
     */
    @GetMapping("/tencentCloudTts")
    public ResponseEntity<Resource> tencentCloudTts(String text, int voiceType) throws TencentCloudSDKException {
        String base64 = tencentCloudService.tts(text, voiceType);
        byte[] mp3Data = Base64.getDecoder().decode(base64);
        ByteArrayResource resource = new ByteArrayResource(mp3Data);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=TextToSpeech.mp3")
                .contentLength(mp3Data.length)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
}
