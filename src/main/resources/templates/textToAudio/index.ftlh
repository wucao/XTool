<#include "../common/layout.ftlh">
<@layout title="文字转语音">
    <div class="box">
        <div class="box-body">

            <style scoped>
                textarea {
                    resize: none;
                }
                .radio label {
                    padding-right: 10px;
                }
            </style>

            <div class="form-group">
                <label>内容</label>
                <textarea id="text-content" class="form-control" rows="3" placeholder="输入需要转语音的文字"></textarea>
            </div>

            <div class="form-group">
                <label>音色</label>
                <div class="radio">
                    <label>
                        <input type="radio" name="voiceType" value="0">
                        云小宁，亲和女声(默认)
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1">
                        云小奇，亲和男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="2">
                        云小晚，成熟男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="4">
                        云小叶，温暖女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="5">
                        云小欣，情感女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="6">
                        云小龙，情感男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="7">
                        云小曼，客服女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1000">
                        智侠，情感男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1001">
                        智瑜，情感女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1002">
                        智聆，通用女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1003">
                        智美，客服女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1050">
                        WeJack，英文男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="1051">
                        WeRose，英文女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101000">
                        智侠，情感男声（精品）
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101001">
                        智瑜，情感女声（精品）
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101002">
                        智聆，通用女声（精品）
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101003">
                        智美，客服女声（精品）
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101004">
                        智云，通用男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101005">
                        智莉，通用女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101006">
                        智言，助手女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101007">
                        智娜，客服女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101008">
                        智琪，客服女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101009">
                        智芸，知性女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101010">
                        智华，通用男声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101050">
                        WeJack，英文男声（精品）
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="101051">
                        WeRose，英文女声（精品）
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="102000">
                        贝蕾，客服女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="102001">
                        贝果，客服女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="102002">
                        贝紫，粤语女声
                    </label>
                    <label>
                        <input type="radio" name="voiceType" value="102003">
                        贝雪，新闻女声
                    </label>
                </div>
            </div>

        </div>
        <div class="box-footer">
            <button type="button" id="btn-play" class="btn btn-primary"><i class="fa fa-play"></i> 试听</button>
            <button type="button" id="btn-stop" class="btn btn-primary"><i class="fa fa-pause"></i> 暂停试听</button>
            <button type="button" id="btn-download" class="btn btn-primary"><i class="fa fa-download"></i> 下载</button>
        </div>
    </div>

    <script>
        let audio = new Audio();
        function createUrl() {
            let textContent = $.trim($("#text-content").val());
            let voiceType = $("input[name=voiceType]:checked").val();
            if (!textContent) {
                alert("请填写内容");
                throw "请填写内容";
            }
            if (!voiceType) {
                alert("请选择音色");
                throw "请选择音色";
            }
            let url = "tencentCloudGenerate?text=" + encodeURIComponent(textContent) + "&voiceType=" + voiceType;
            return url;
        }
        $("#btn-play").click(function () {
            let url = createUrl();
            audio.src = url;
            audio.play();
        });
        $("#btn-stop").click(function () {
            audio.pause();
        });
        $("#btn-download").click(function () {
            let url = createUrl();
            location.href = url;
        });
    </script>
</@layout>