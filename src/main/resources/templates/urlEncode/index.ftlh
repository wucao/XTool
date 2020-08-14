<#include "../common/layout.ftlh">
<@layout title="URL 编解码">
    <div class="box">
        <div class="box-body">

            <style scoped>
                textarea {
                    resize: none;
                }
                #text-result {
                    word-break: break-all;
                }
            </style>

            <div class="form-group">
                <textarea id="text-content" class="form-control" rows="5"></textarea>
            </div>

            <div class="form-group">
                <div id="text-result" style="min-height: 120px;" class="text-muted well well-sm no-shadow"></div>
            </div>
        </div>
        <div class="box-footer">
            <button id="btn-encode" type="button" class="btn btn-primary">编码</button>
            <button id="btn-decode" type="button" class="btn btn-primary">解码</button>
        </div>
    </div>

    <script>
        $("#btn-encode").click(function () {
            let text = $("#text-content").val();
            if (!text) {
                alert("请填写内容");
                return;
            }
            $("#text-result").text(encodeURIComponent(text));
        });
        $("#btn-decode").click(function () {
            let text = $("#text-content").val();
            if (!text) {
                alert("请填写内容");
                return;
            }
            $("#text-result").text(decodeURIComponent(text));
        });
    </script>
</@layout>