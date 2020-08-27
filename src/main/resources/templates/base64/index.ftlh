<#include "../common/layout.ftlh">
<@layout title="Base46 编解码">
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
            <button type="button" class="btn btn-primary btn-code" data-url="encode">编码</button>
            <button type="button" class="btn btn-primary btn-code" data-url="decode">解码</button>
        </div>
    </div>

    <script>
        $(".btn-code").click(function () {
            let url = $(this).attr("data-url");
            let text = $("#text-content").val();
            if (!text) {
                alert("请填写内容");
                return;
            }
            $.ajax({
                url: url,
                method: "POST",
                data: {
                    text: text
                },
                success: function(data) {
                    $("#text-result").text(data);
                },
                error: function() {
                    alert("服务器异常，操作失败");
                }
            });
        });
    </script>
</@layout>