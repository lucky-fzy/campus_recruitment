<!DOCTYPE HTML>
<html>
<head>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>申请认证-招聘服务</title>
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
    <script src="style/js/additional-methods.js" type="text/javascript"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo" href="home">
                <img width="229" height="43" alt="校园招-专注大学生实习招聘" src="style/images/logo.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="home">首页</a></li>
                <li class="current"><a href="companylist">公司</a></li>
                <li><a target="_blank" href="yanzhi">言职</a></li>
                <li>
                    <a rel="nofollow" href="create">招聘管理</a>
                </li>
            </ul>
            <dl class="collapsible_menu">
                <dt>
                    <span>个人中心&nbsp;</span>
                    <i></i>
                </dt>
                <dd style="display: none;"><a href="javascript:post('positions',{isOnline:1})">我发布的职位</a></dd>
                <dd style="display: none;"><a href="javascript:post('select_Resumes',{type:0})">我收到的简历</a></dd>
                <dd class="btm" style="display: none;"><a href="myhome">我的公司主页</a></dd>
                <dd style="display: none;"><a href="accountBind">帐号设置</a></dd>
                <dd class="logout" style="display: none;"><a rel="nofollow" href="quit">退出</a></dd>
            </dl>
        </div>
    </div><!-- end #header -->
    <div id="container">
        <div class="content_mid">
            <dl class="c_section c_section_mid">
                <dt>
                    <h2><em></em>申请公司认证</h2>
                </dt>
                <dd class="c_certify">
                    <h4>申请公司认证的标准</h4>
                    <ul class="c_certify_list">
                        <li class="list1">公司主页<span>[ 网站处于正常运行状态，且必须具有备案号 ]</span></li>
                        <li class="list2">公司名称<span>[ 简称应为企业/产品简称，不可使用简易修饰性词语 ]</span></li>
                        <li class="list3">公司logo<span>[ 必须真实有效的体现公司形象 ]</span></li>
                        <li class="list4">
                            公司的营业执照
                            <div class="list4_child">
                                <span>*</span>
                                <div>
                                    4.1请提供有效年检期内的《企业法人营业执照》副本<br>
                                    4.2为保证信息安全，审核执照不提供预览功能，请谅解<br>
                                    4.3该营业执照只用作公司认证使用，请放心上传
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="business_license">
                        <div class="license_upload">
                            <div style="background-color: rgb(147, 183, 187);">
                                <span>上传公司营业执照副本</span>
                                <br>
                                支持jpg、png、gif、pdf格式，文件不超过10M
                            </div>
                        </div>
                        <input type="file" name="businessLicenes" id="businessLicenes"
                               onchange="file_check(this,'uploadLicense',${sessionScope.company.companyId},'businessLicenes');">
                        <input type="hidden" value="0" name="type" id="type">
                    </div>
                </dd>
            </dl>
        </div>

        <script src="style/js/certification.min.js" type="text/javascript"></script>
        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="about.html">联系我们</a>
        <a target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
    </div>
</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

</body>
</html>