<#include "../common/layout.ftlh">
<@layout title="图片文字识别">
    <div class="box">
        <div class="box-body">

            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="false">图片上传</a></li>
                    <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="true">图片地址</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_1">
                        <div id="btn-upload" class="btn btn-primary btn-lg fileinput-button">
                            <i class="fa fa-upload"></i> 选择图片
                            <input type="file" name="file">
                        </div>
                    </div>
                    <!-- /.tab-pane -->
                    <div class="tab-pane" id="tab_2">
                        <div class="input-group input-group-lg">
                            <input id="url-input" type="text" class="form-control">
                            <span class="input-group-btn">
                                <button id="url-submit" type="button" class="btn btn-primary btn-flat">开始识别</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div id="result" style="margin-top: 10px; display: none;" class="text-muted well well-sm no-shadow">
            </div>
        </div>
    </div>

    <link href="https://cdn.bootcdn.net/ajax/libs/blueimp-file-upload/10.31.0/css/jquery.fileupload.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/blueimp-file-upload/10.31.0/js/vendor/jquery.ui.widget.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/blueimp-file-upload/10.31.0/js/jquery.iframe-transport.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/blueimp-file-upload/10.31.0/js/jquery.fileupload.min.js"></script>
    <script>
        function disableUpload() {
            $('#btn-upload input').attr("disabled", "true");
            $('#btn-upload').attr("disabled", "true");
        }
        function enableUpload() {
            $('#btn-upload input').removeAttr("disabled");
            $('#btn-upload').removeAttr("disabled");
        }
        function displayText(testArray) {
            let $table = $("<table></table>");
            for(let item of testArray){
                let $tr = $("<tr></tr>");
                let $td = $("<td></td>");
                $td.text(item);
                $tr.append($td);
                $table.append($tr);
            }

            $("#result").html($table);
            $("#result").show();
        }
        $('#btn-upload').fileupload({
            autoUpload: true,
            dataType: 'json',
            url: 'tencentCloudOcrByFile',
            add: function (e, data) {
                disableUpload();
                $("#result").hide();
                data.submit();
            },
            done: function(e, data) {
                enableUpload();
                displayText(data.result);
                $("#result").show();
            },
            fail: function() {
                alert("文件上传异常");
                $('#upload-progress-container').hide();
                enableUpload()
            }
        });

        $("#url-submit").click(function () {
            let url = $("#url-input").val();
            $.ajax({
                url: "tencentCloudOcrByUrl",
                method: "POST",
                data: {
                    url: url
                },
                success: function(data) {
                    displayText(data);
                },
                error: function() {
                    alert("服务器异常，操作失败");
                }
            });
        });
    </script>
</@layout>