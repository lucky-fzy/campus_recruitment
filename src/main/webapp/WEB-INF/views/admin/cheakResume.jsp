<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>查看用户简历</title>

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
        <h1>${resume.emp.empName}的简历</h1>
    </div><!--end .preview_header-->

    <div class="preview_content">
        <div class="profile_box" id="basicInfo">
            <h2>基本信息</h2>
            <div class="basicShow">
                   <span>${resume.emp.empName} |  <c:if test="${resume.emp.gender == 1}">男</c:if> <c:if test="${resume.emp.gender == 0}">女</c:if> |
                       ${resume.degree} |  ${resume.emp.school} | ${resume.major}<br>
            			${resume.phone} | ${resume.emp.email}<br>
            		</span>
                <div class="m_portrait">
                    <div></div>
                    <img width="120" height="120" alt="jason" src="${resume.photo}">
                </div>
            </div><!--end .basicShow-->
        </div><!--end #basicInfo-->

        <div class="profile_box" id="expectJob">
            <h2>期望工作</h2>
            <div class="expectShow">
                ${resume.city}，${resume.jobtype}，月薪${resume.salary}，${resume.position}
            </div><!--end .expectShow-->
        </div><!--end #expectJob-->

        <div class="profile_box" id="projectExperience">
            <h2>项目经验</h2>
            <div class="projectShow">
                <ul class="plist clearfix">
                    <li class="noborder">
                        <div class="projectList">
                            <div class="f16 mb10">${resume.project}，${resume.post}
                                <span class="c9">
		            									            								（${fn:substring(resume.starttime, 0, 4)}.${fn:substring(resume.starttime, 4, 6)}-${fn:substring(resume.endtime, 0, 4)}.${fn:substring(resume.endtime, 4, 6)}）
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
                    <li class="clear">学校：${resume.emp.school}&nbsp;&nbsp;<span class="c9">${resume.startStu}-${resume.endStu}</span><br>
                        学历：${resume.degree}<br>
                        专业：${resume.major}<br>
                    </li>
                </ul>
            </div><!--end .educationalShow-->
        </div><!--end #educationalBackground-->

        <div class="profile_box" id="selfDescription">
            <h2>自我描述</h2>
            <div class="descriptionShow">
                ${resume.selfdescribe}
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

</body>
</html>
