<#macro layout title>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="/components/bootstrap-3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/components/Font-Awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/components/ionicons-2.0.0/css/ionicons.min.css" rel="stylesheet">
    <link href="/components/AdminLTE-2.4.17/css/AdminLTE.min.css" rel="stylesheet">
    <link href="/components/AdminLTE-2.4.17/css/skins/skin-purple.min.css" rel="stylesheet">
    <script src="/components/jquery-3.4.1/jquery.min.js"></script>
    <script src="/components/bootstrap-3.4.1/js/bootstrap.min.js"></script>
    <script src="/components/AdminLTE-2.4.17/js/adminlte.min.js"></script>
    <title>XTool - ${title}</title>
</head>
<body class="skin-purple layout-top-nav">
<div class="wrapper" style="height: auto; min-height: 100%;">

    <header class="main-header">
        <nav class="navbar navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <span class="navbar-brand">XTool</span>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">图片/音视频 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/textToSpeech/index">文字转语音</a></li>
                                <li><a href="/ocr/index">图片文字识别</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">文件 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/apkParser/index">APK 文件解析</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">编解码 <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/base64/index">Base64 编解码</a></li>
                                <li><a href="/characterEntity/index">HTML 字符实体编解码</a></li>
                                <li><a href="/urlEncode/index">URL 编解码</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
    </header>

    <div class="content-wrapper">

        <div class="container">
            <section class="content-header">
                <h1>
                    ${title}
                </h1>
            </section>
            <section class="content">
                <#nested>
            </section>
        </div>
    </div>

    <footer class="main-footer">
        <div class="container">
            <strong>Copyright © 2019-2020 <a target="_blank" href="https://github.com/wucao/XTool">XTool</a>.</strong> All rights reserved.
        </div>
    </footer>

</div>
</body>
</html>
</#macro>