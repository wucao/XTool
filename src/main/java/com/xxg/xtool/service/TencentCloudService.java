package com.xxg.xtool.service;

import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.tts.v20190823.TtsClient;
import com.tencentcloudapi.tts.v20190823.models.TextToVoiceRequest;
import com.tencentcloudapi.tts.v20190823.models.TextToVoiceResponse;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class TencentCloudService {

    @Autowired
    private Credential credential;

    /**
     * 腾讯云 语音合成 TTS
     * 产品首页： https://cloud.tencent.com/product/tts
     * 控制台： https://console.cloud.tencent.com/tts
     * API 文档: https://cloud.tencent.com/document/api/1073/37995
     */
    public String tts(String text, int voiceType) throws TencentCloudSDKException {

        TtsClient client = new TtsClient(credential, "ap-shanghai");

        JSONObject params = new JSONObject();
        params.put("Text", text);
        params.put("SessionId", UUID.randomUUID().toString());
        params.put("ModelType", 1);
        params.put("VoiceType", voiceType);
        params.put("Codec", "mp3");

        TextToVoiceRequest req = TextToVoiceRequest.fromJsonString(params.toString(), TextToVoiceRequest.class);
        TextToVoiceResponse resp = client.TextToVoice(req);
        JSONObject responseJson = new JSONObject(TextToVoiceResponse.toJsonString(resp));
        return responseJson.getString("Audio");
    }

}
