<#include "../common/layout.ftlh">
<@layout title="APK 文件解析">
    <div class="box">
        <div class="box-body">

            <div>
                <div><label>文件上传</label></div>
                <div>
                    <div id="btn-upload" class="btn btn-primary fileinput-button">
                        <i class="fa fa-upload"></i> 选择文件
                        <input type="file" name="file">
                    </div>
                </div>
                <div id="upload-progress-container" style="display: none;">
                    <div style="padding-top: 10px;"><label>上传进度</label></div>
                    <div class="progress progress-sm active">
                        <div id="upload-progress" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                    </div>
                </div>
            </div>

            <div id="apk-result" style="margin-top: 10px;" class="text-muted well well-sm no-shadow">
                <dl class="dl-horizontal" style="margin-top: 20px; margin-bottom: 20px;">
                    <dt>文件大小（字节）</dt>
                    <dd id="apk-size"></dd>
                    <dt>MD5</dt>
                    <dd id="apk-md5"></dd>
                    <dt>包名</dt>
                    <dd id="apk-packageName"></dd>
                    <dt>版本号</dt>
                    <dd id="apk-versionCode"></dd>
                    <dt>版本名</dt>
                    <dd id="apk-versionName"></dd>
                    <dt>compileSdkVersion</dt>
                    <dd id="apk-compileSdkVersion"></dd>
                    <dt>minSdkVersion</dt>
                    <dd id="apk-minSdkVersion"></dd>
                    <dt>maxSdkVersion</dt>
                    <dd id="apk-maxSdkVersion"></dd>
                    <dt>targetSdkVersion</dt>
                    <dd id="apk-targetSdkVersion"></dd>
                </dl>
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
        $('#btn-upload').fileupload({
            autoUpload: true,
            dataType: 'json',
            url: 'uploadAndParse',
            add: function (e, data) {
                disableUpload();
                $("#apk-result").hide();
                data.submit();
            },
            done: function(e, data) {
                for (key in data.result) {
                    $("#apk-" + key).text(data.result[key]);
                }
                $('#upload-progress-container').hide();
                $("#upload-progress").css("width", '0%');
                enableUpload();
                $("#apk-result").show();
            },
            progress: function (e, data) {
                $('#upload-progress-container').show();
                let progress = parseInt(data.loaded / data.total * 100, 10);
                $("#upload-progress").css("width", progress + '%');
            },
            fail: function() {
                alert("文件上传异常");
                $('#upload-progress-container').hide();
                $("#upload-progress").css("width", '0%');
                enableUpload()
            }
        });
    </script>
</@layout>