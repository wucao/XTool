package com.xxg.xtool.service;

import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.ocr.v20181119.OcrClient;
import com.tencentcloudapi.ocr.v20181119.models.GeneralBasicOCRRequest;
import com.tencentcloudapi.ocr.v20181119.models.GeneralBasicOCRResponse;
import com.tencentcloudapi.tts.v20190823.TtsClient;
import com.tencentcloudapi.tts.v20190823.models.TextToVoiceRequest;
import com.tencentcloudapi.tts.v20190823.models.TextToVoiceResponse;
import com.xxg.xtool.enums.TencentCloudOcrDataType;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
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

    /**
     * 腾讯云 文字识别 OCR
     * 产品首页： https://cloud.tencent.com/product/ocr-catalog
     * 控制台： https://console.cloud.tencent.com/ocr/general
     * API 文档： https://cloud.tencent.com/document/product/866/33526
     */
    public List<String> ocr(String data, TencentCloudOcrDataType dataType) throws TencentCloudSDKException {
        OcrClient client = new OcrClient(credential, "ap-shanghai");

        JSONObject params = new JSONObject();
        if (dataType == TencentCloudOcrDataType.BASE64) {
            params.put("ImageBase64", data);
        } else if (dataType == TencentCloudOcrDataType.URL) {
            params.put("ImageUrl", data);
        } else {
            throw new NullPointerException("dataType 参数不能为空");
        }

        GeneralBasicOCRRequest req = GeneralBasicOCRRequest.fromJsonString(params.toString(), GeneralBasicOCRRequest.class);
        GeneralBasicOCRResponse resp = client.GeneralBasicOCR(req);
        JSONObject responseJson = new JSONObject(GeneralBasicOCRResponse.toJsonString(resp));

        List<String> textList = new ArrayList<>();
        JSONArray array = responseJson.getJSONArray("TextDetections");
        for (int i = 0; i < array.length(); i++) {
            String text = array.getJSONObject(i).getString("DetectedText");
            textList.add(text);
        }
        return textList;
    }

}
