<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>

    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>

    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>账号设置-修改密码</title>

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
            <a class="logo" href="h/">
                <img width="229" height="43" alt="校园招-专注大学生实习招聘" src="style/images/logo.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a target="_blank" href="yanzhi">言职</a></li>
                <c:if test="${sessionScope.emp != null}">
                    <li><a href="jianli" rel="nofollow">我的简历</a></li>
                </c:if>
                <c:if test="${sessionScope.company != null}">
                    <li><a href="create" rel="nofollow">招聘管理</a></li>
                </c:if>
            </ul>
            <c:if test="${sessionScope.company != null}">
                <dl class="collapsible_menu">
                    <dt>
                        <span>个人中心&nbsp;</span>
                        <i></i>
                    </dt>
                    <dd style="display: none;"><a href="javascript:post('positions',{isOnline:1})">我发布的职位</a></dd>
                    <dd style="display: none;"><a href="javascript:post('select_Resumes',{type:0})">我收到的简历</a></dd>
                    <dd class="btm" style="display: none;"><a href="myhome">我的公司主页</a></dd>
                    <dd style="display: none;"><a href="updatePwd">帐号设置</a></dd>
                    <dd class="logout" style="display: none;"><a rel="nofollow" href="quit">退出</a></dd>
                </dl>
            </c:if>
            <c:if test="${sessionScope.emp != null}">
                <dl class="collapsible_menu">
                    <dt>
                        <c:if test="${sessionScope.emp.empName == ''}">
                            <span>${sessionScope.emp.email}&nbsp;</span>
                        </c:if>
                        <span>${sessionScope.emp.empName}&nbsp;</span>
                        <span class="red dn" id="noticeDot-0"></span>
                        <i></i>
                    </dt>
                    <dd><a rel="nofollow" href="jianli">我的简历</a></dd>
                    <dd><a href="collections">我收藏的职位</a></dd>
                    <dd><a href="updatePwd">帐号设置</a></dd>
                    <dd class="logout"><a rel="nofollow" href="quit">退出</a></dd>
                </dl>
            </c:if>
        </div>
    </div><!-- end #header -->
    <div id="container">
        <div class="user_bindSidebar">
            <dl id="user_sideBarmenu" class="user_sideBarmenu">
                <dt><h3>帐号设置</h3></dt>
                <dd><a class="hover" href="updatePwd">修改密码</a></dd>
            </dl>
        </div>
        <input type="hidden" id="hasSidebar" value="1">
        <div class="content user_modifyContent">
            <dl class="c_section">
                <dt>
                    <h2><em></em>修改密码</h2>
                </dt>
                <dd>
                    <form id="updatePswForm">
                        <table class="savePassword">
                            <tbody>
                            <tr>
                                <td>登录邮箱</td>
                                <c:if test="${sessionScope.emp != null}">
                                    <td class="c7">${sessionScope.emp.email}</td>
                                </c:if>
                                <c:if test="${sessionScope.company != null}">
                                    <td class="c7">${sessionScope.company.companyEmail}</td>
                                </c:if>
                            </tr>
                            <tr>
                                <td class="label">当前密码</td>
                                <td>
                                    <input type="password" maxlength="16" id="oldpassword" name="oldpassword">
                                    <span id="updatePwd_beError" style="display:none;" class="error">
            				</span></td>
                            </tr>
                            <tr>
                                <td class="label">新密码</td>
                                <td><input type="password" maxlength="16" id="newpassword" name="newpassword">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">确认密码</td>
                                <td><input type="password" maxlength="16" id="comfirmpassword" name="comfirmpassword">
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><input type="submit" value="保 存"></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </dd>
            </dl>
        </div>
        <!------------------------------------- 弹窗lightbox ----------------------------------------->
        <div style="display:none;">

            <!-- 修改密码 -->
            <div style="overflow:hidden" class="popup" id="updatePassword">
                <h3>修改密码成功，请重新登录</h3>
                <h4><span>5</span>秒后将自动退出</h4>
                <a class="btn" href="quit">直接退出</a>
            </div>


        </div>
        <!------------------------------------- end ----------------------------------------->
        <script src="style/js/setting.js"></script>
        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="h/about.html">联系我们</a>
        <a target="_blank" href="h/af/zhaopin.html">互联网公司导航</a>
        <a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
        <a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
        <div class="copyright">&copy;2013-2014 Lagou <a
                href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
                target="_blank">京ICP备14023790号-2</a></div>
    </div>
</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->


<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
    <div id="cboxWrapper">
        <div>
            <div id="cboxTopLeft" style="float: left;"></div>
            <div id="cboxTopCenter" style="float: left;"></div>
            <div id="cboxTopRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxMiddleLeft" style="float: left;"></div>
            <div id="cboxContent" style="float: left;">
                <div id="cboxTitle" style="float: left;"></div>
                <div id="cboxCurrent" style="float: left;"></div>
                <button type="button" id="cboxPrevious"></button>
                <button type="button" id="cboxNext"></button>
                <button id="cboxSlideshow"></button>
                <div id="cboxLoadingOverlay" style="float: left;"></div>
                <div id="cboxLoadingGraphic" style="float: left;"></div>
            </div>
            <div id="cboxMiddleRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxBottomLeft" style="float: left;"></div>
            <div id="cboxBottomCenter" style="float: left;"></div>
            <div id="cboxBottomRight" style="float: left;"></div>
        </div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
</body>
</html>