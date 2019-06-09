<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>简历预览-我的简历</title>

    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/colorbox.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>

    <script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("body").on("click", "a.btn_s", function () {
                $.colorbox.close();
                parent.jQuery.colorbox.close();
            });
            $(".inline").colorbox({
                inline: true
            });
        });
    </script>
    <script src="style/js/ajaxCross.json" charset="UTF-8"></script>
</head>

<body>
<div id="previewWrapper">
    <div class="preview_header">
        <c:if test="${sessionScope.emp.empName == ''}">
            <h1>我的简历</h1>
        </c:if>
        <c:if test="${sessionScope.emp.empName != ''}">
            <h1>${sessionScope.emp.empName}的简历</h1>
        </c:if>
    </div><!--end .preview_header-->

    <div class="preview_content">
        <div class="profile_box" id="basicInfo">
            <h2>基本信息</h2>
            <div class="basicShow">
                   <span>${sessionScope.emp.empName} |  <c:if test="${sessionScope.emp.gender == 1}">男</c:if> <c:if test="${sessionScope.emp.gender == 0}">女</c:if> |
                       ${sessionScope.resume.degree} |  ${sessionScope.emp.school} | ${sessionScope.resume.major}<br>
            			${sessionScope.resume.phone} | ${sessionScope.emp.email}<br>
            			
            		</span>
                <div class="m_portrait">
                    <div></div>
                    <img width="120" height="120" alt="jason" src="${sessionScope.resume.photo}">
                </div>
            </div><!--end .basicShow-->
        </div><!--end #basicInfo-->

        <div class="profile_box" id="expectJob">
            <h2>期望工作</h2>
            <div class="expectShow">
                ${sessionScope.resume.city}，${sessionScope.resume.jobtype}，月薪${sessionScope.resume.salary}，${sessionScope.resume.position}
            </div><!--end .expectShow-->
        </div><!--end #expectJob-->

        <div class="profile_box" id="projectExperience">
            <h2>项目经验</h2>
            <div class="projectShow">
                <ul class="plist clearfix">
                    <li class="noborder">
                        <div class="projectList">
                            <div class="f16 mb10">${sessionScope.resume.project}，${sessionScope.resume.post}
                                <span class="c9">
		            									            								（${fn:substring(sessionScope.resume.starttime, 0, 4)}.${fn:substring(sessionScope.resume.starttime, 4, 6)}-${fn:substring(sessionScope.resume.endtime, 0, 4)}.${fn:substring(sessionScope.resume.endtime, 4, 6)}）
		            									            						</span>
                            </div>
                            <div class="dl1"></div>
                        </div>
                    </li>
                </ul>
            </div><!--end .projectShow-->
        </div><!--end #projectExperience-->

        <div class="profile_box" id="educationalBackground">
            <h2>教育背景</h2>
            <div class="educationalShow">
                <ul class="elist clearfix">
                    <li class="clear">学校：${sessionScope.emp.school}&nbsp;&nbsp;<span class="c9">${sessionScope.resume.startStu}-${sessionScope.resume.endStu}</span><br>
                                        学历：${sessionScope.resume.degree}<br>
                                        专业：${sessionScope.resume.major}<br>
                    </li>
                </ul>
            </div><!--end .educationalShow-->
        </div><!--end #educationalBackground-->

        <div class="profile_box" id="selfDescription">
            <h2>自我描述</h2>
            <div class="descriptionShow">
                ${sessionScope.resume.selfdescribe}
            </div><!--end .descriptionShow-->
        </div><!--end #selfDescription-->
    </div><!--end .preview_content-->
</div><!--end #previewWrapper-->

<!-------------------------------------弹窗lightbox ----------------------------------------->
<div style="display:none;">
    <!-- 下载简历 -->
    <div class="popup" id="downloadOnlineResume">
        <table width="100%">
            <tbody>
            <tr>
                <td class="c5 f18">请选择下载简历格式：</td>
            </tr>
            <tr>
                <td>
                    <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=1">word格式</a>
                    <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=2">html格式</a>
                    <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=3">pdf格式</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div><!--/#downloadOnlineResume-->
</div>
<!------------------------------------- end ----------------------------------------->


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