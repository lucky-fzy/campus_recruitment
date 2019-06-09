<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>公司页面</title>
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
                <li><a rel="nofollow" href="create">招聘管理</a></li>
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
        <div class="clearfix">

            <div class="content_l">
                <div class="c_detail">
                    <div class="c_logo" style="background-color:#fff;">
                        <div id="logoShow">
                            <img src="${sessionScope.company.companyLogo}" width="190" height="190" alt="公司logo" />
                            <span>更换公司图片<br />190px*190px 小于5M</span>
                        </div>
                        <input onchange="img_check(this,'companyLogoUpload',${sessionScope.company.companyId},'logo');" type="file" id="logo" name="logo" title="支持jpg、jpeg、gif、png格式，文件小于5M" />

                    </div>
                    <span class="error" id="logo_error" style="display:none;"></span>

                    <div class="c_box companyName">
                        <h2 title="${sessionScope.company.companyName}">${sessionScope.company.companyName}</h2>

                        <c:if test="${sessionScope.company.isAuthentication == 0}">

                            <em class="unvalid"></em>
                            <span class="va dn">未认证企业</span>
                            <c:if test="${isAuth}">
                                <a target="_blank" class="applyC" href="auth">申请认证</a>
                            </c:if>
                            <c:if test="${!isAuth}">
                                <a class="applyC">正在认证中</a>
                            </c:if>
                        </c:if>
                        <c:if test="${sessionScope.company.isAuthentication == 1}">
                            <em class="valid"></em>
                            <span class="va dn">认证企业</span>
                        </c:if>
                        <div class="clear"></div>

                        <h1 title="${sessionScope.company.allname}"
                            class="fullname">${sessionScope.company.allname}</h1>

                        <form class="clear editDetail dn" id="editDetailForm" action="updateCompanyInfo" method="post">
                            <input type="text" placeholder="请输入公司简称" maxlength="15"
                                   value="${sessionScope.company.companyName}"
                                   name="companyName" id="companyShortName">
                            <input type="text" placeholder="一句话描述公司优势，核心价值，限50字" maxlength="50"
                                   value="${sessionScope.company.companyDescribe}"
                                   name="companyDescribe" id="companyFeatures">
                            <input type="hidden" value="${sessionScope.company.companyId}" id="companyId"
                                   name="companyId">
                            <input type="submit" value="保存" id="saveDetail" class="btn_small">
                            <a id="cancelDetail" class="btn_cancel_s">取消</a>
                        </form>

                        <div class="clear oneword"><img width="17" height="15" src="style/images/quote_l.png">&nbsp;
                            <span>${sessionScope.company.companyDescribe}</span> &nbsp;<img width="17" height="15"
                                                                                            src="style/images/quote_r.png">
                        </div>
                        <h3 class="dn">已选择标签</h3>
                        <ul style="overflow:auto" id="hasLabels" class="reset clearfix">
                            <c:set value="${fn:split(sessionScope.company.tag, '-')}" var="tags"/>
                            <c:forEach var="tag" items="${tags}">
                                <li>${tag}</li>
                            </c:forEach>
                            <li class="link">编辑</li>
                        </ul>
                        <div class="dn" id="addLabels">
                            <input type="hidden" value="1" id="labelPageNo">
                            <input type="submit" value="贴上" class="fr" id="add_label">
                            <input type="text" placeholder="添加自定义标签" name="label" id="label" class="label_form fl">
                            <div class="clear"></div>
                            <ul class="reset clearfix"></ul>
                            <a id="saveLabels" class="btn_small">保存</a>
                            <a id="cancelLabels" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                        </div>
                    </div>
                    <a title="编辑基本信息" class="c_edit" id="editCompanyDetail" href="javascript:void(0);"></a>
                    <div class="clear"></div>
                </div>

                <div class="c_breakline"></div>

                <c:if test="${positions.size() == 0}">
                    <!--无招聘职位-->
                    <dl id="noJobs" class="c_section">
                        <dt>
                            <h2><em></em>在招职位</h2>
                        </dt>
                        <dd>
                            <h1 align="center">暂无职位</h1>
                        </dd>

                    </dl>
                </c:if>

                <c:if test="${positions.size() != 0}">
                    <dl id="haveJobs" class="c_section">
                        <dt>
                            <h2><em></em>在招职位</h2>
                        </dt>
                        <dd>
                            <ul class="reset my_jobs">
                                <c:forEach items="${positions}" var="position">
                                    <li>
                                        <h3 style="float: left">
                                            <a title="${position.positionName}"
                                               href="javascript:post('jobdetail',{positionId:${position.positionId}})">${position.positionName}</a>
                                            <span>[${position.jobCity}]</span>
                                        </h3>
                                        <div style="margin-left: 80%;color: #ff6329">
                                            <h3>
                                                    ${position.minSalary}k-${position.maxSalary}k
                                            </h3>
                                        </div>
                                        <div>${position.jobType}
                                            / ${position.jobExperience} / ${position.degree}
                                        </div>
                                        <div class="c9" style="float: right;margin-top: -4%">发布时间： ${position.releaseTime}</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </dd>
                    </dl>
                </c:if>


                <input type="hidden" value="" name="hasNextPage" id="hasNextPage">
                <input type="hidden" value="" name="pageNo" id="pageNo">
                <input type="hidden" value="" name="pageSize" id="pageSize">
                <div id="flag"></div>
            </div>    <!-- end .content_l -->

            <div class="content_r">
                <div id="Tags">
                    <div id="c_tags_show" class="c_tags solveWrap">
                        <table>
                            <tbody>
                            <tr>
                                <td width="45">地点</td>
                                <td>${sessionScope.company.companyCity}</td>
                            </tr>
                            <tr>
                                <td>领域</td><!-- 支持多选 -->
                                <td title="${sessionScope.company.field}">${sessionScope.company.field}</td>
                            </tr>
                            <tr>
                                <td>规模</td>
                                <td>${sessionScope.company.scale}</td>
                            </tr>
                            <tr>
                                <td>主页</td>
                                <td>
                                    <a rel="nofollow" title="${sessionScope.company.companyWebsite}" target="_blank"
                                       href="http://${sessionScope.company.companyWebsite}">${sessionScope.company.companyWebsite}</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <a id="editTags" class="c_edit" href="javascript:void(0)"></a>
                    </div>
                    <div id="c_tags_edit" class="c_tags editTags dn">
                        <form id="tagForms" action="updateCompanyInfo" method="post">
                            <table>
                                <tbody>
                                <tr>
                                    <td>地点</td>
                                    <td>
                                        <input type="text" placeholder="请输入地点"
                                               value="${sessionScope.company.companyCity}" name="companyCity" id="city">
                                    </td>
                                </tr>
                                <tr>
                                    <td>领域</td><!-- 支持多选 -->
                                    <td>
                                        <input type="hidden" value="${sessionScope.company.field}" id="industryField"
                                               name="field">
                                        <input type="button"
                                               style="background:none;cursor:default;border:none !important;"
                                               disable="disable" value="${sessionScope.company.field}" id="select_ind"
                                               class="select_tags">
                                    </td>
                                </tr>
                                <tr>
                                    <td>规模</td>
                                    <td>
                                        <input type="hidden" value="${sessionScope.company.scale}" id="companySize"
                                               name="scale">
                                        <input type="button" value="${sessionScope.company.scale}" id="select_sca"
                                               class="select_tags">
                                        <div class="selectBox dn" id="box_sca" style="display: none;">
                                            <ul class="reset">
                                                <li>少于15人</li>
                                                <li>15-50人</li>
                                                <li>50-150人</li>
                                                <li>150-500人</li>
                                                <li>500-2000人</li>
                                                <li>2000人以上</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>主页</td>
                                    <td>
                                        <input type="text" placeholder="请输入网址"
                                               value="http://${sessionScope.company.companyWebsite}"
                                               name="companyWebsite" id="companyUrl">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="hidden" id="comId" name="companyId" value="${sessionScope.company.companyId}">
                            <input type="hidden" id="comCity" value="${sessionScope.company.companyCity}">
                            <input type="hidden" id="comInd" value="${sessionScope.company.field}">
                            <input type="hidden" id="comSize" value="${sessionScope.company.scale}">
                            <input type="hidden" id="comUrl" value="http://${sessionScope.company.companyWebsite}">
                            <input type="submit" value="保存" id="submitFeatures" class="btn_small">
                            <a id="cancelFeatures" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                            <div class="clear"></div>
                        </form>
                    </div>
                </div><!-- end #Tags -->

                <dl class="c_section c_stages">
                    <dt>
                        <h2><em></em>融资阶段</h2>
                        <a title="编辑融资阶段" class="c_edit" href="javascript:void(0)"></a>
                    </dt>
                    <dd>
                        <ul class="reset stageshow">
                            <li>目前阶段：<span class="c5">${sessionScope.company.stage}</span></li>
                        </ul>
                        <form class="dn" id="stageform" action="updateCompanyInfo" method="post">
                            <div class="stageSelect">
                                <label>目前阶段</label>
                                <input type="hidden" value="${sessionScope.company.stage}" id="financeStage"
                                       name="stage">
                                <input type="button" value="${sessionScope.company.stage}" id="select_fin"
                                       class="select_tags_short fl">
                                <div class="selectBoxShort dn" id="box_fin" style="display: none;">
                                    <ul class="reset">

                                        <li>未融资</li>


                                        <li>天使轮</li>


                                        <li>A轮</li>


                                        <li>B轮</li>


                                        <li>C轮</li>


                                        <li>D轮及以上</li>


                                        <li>已上市</li>

                                    </ul>
                                </div>
                            </div>
                            <input type="hidden" name="companyId" value="${sessionScope.company.companyId}">
                            <input type="submit" value="保存" class="btn_small">
                            <a id="cancelStages" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                            <div class="clear"></div>
                        </form>
                    </dd>
                </dl><!-- end .c_stages -->

                <h3 class="c_tags">具体地址:&nbsp&nbsp&nbsp${sessionScope.company.companyPosition}</h3>
                <div id="smallmap"></div>
                <a href="javascript:;" id="mapPreview">查看完整地图</a>

            </div>
        </div>

        <!-------------------------------------弹窗lightbox  ----------------------------------------->
        <div style="display:none;">
            <!--地图弹窗-->
            <div id="baiduMap" class="popup">
                <div id="allmap"></div>
            </div><!--/#baiduMap-->
        </div>


        <script type="text/javascript"
                src="http://api.map.baidu.com/api?v=2.0&ak=3d6a9f4b807441569414b01eecc20959"></script>
        <script type="text/javascript">
            //百度地图API功能
            var sMap = new BMap.Map("smallmap");
            sMap.enableScrollWheelZoom(true);

            if ($('#positionLat').val() && $('#positionLng').val()) {
                var sPoint = new BMap.Point($('#positionLng').val(), $('#positionLat').val());
                sMap.centerAndZoom(sPoint, 12);
                sMap.addOverlay(new BMap.Marker(sPoint));              // 将标注添加到地图中

            } else {
                // 创建地址解析器实例
                var sMyGeo = new BMap.Geocoder();
                // 将地址解析结果显示在地图上,并调整地图视野
                sMyGeo.getPoint("${sessionScope.company.companyPosition}", function (sPoint) {
                    if (sPoint) {
                        sMap.centerAndZoom(sPoint, 16);
                        sMap.addOverlay(new BMap.Marker(sPoint));
                    }
                }, "${sessionScope.company.companyCity}");
            }

            /*弹窗大地图*/
            var map = new BMap.Map("allmap");
            map.addControl(new BMap.NavigationControl());
            map.addControl(new BMap.MapTypeControl());
            map.addControl(new BMap.OverviewMapControl());
            map.enableScrollWheelZoom(true);
            // 创建地址解析器实例
            var gc = new BMap.Geocoder();
            $(function () {
                $('#mapPreview').bind('click', function () {
                    $.colorbox({inline: true, href: "#baiduMap", title: "公司地址"});
                    var address = "${sessionScope.company.companyPosition}";
                    var city = "${sessionScope.company.companyCity}";
                    var lat = $('#positionLat').val();
                    var lng = $('#positionLng').val();
                    map.setCurrentCity(city);
                    map.setZoom(12);
                    if (lat && lng) {
                        var p = new BMap.Point(lng, lat);
                        var marker = new BMap.Marker(p);  // 创建标注
                        map.addOverlay(marker);              // 将标注添加到地图中
                        setTimeout(function () {
                            map.centerAndZoom(p, 15);
                        }, 1000);
                        map.setCenter(p);
                        map.setZoom(15);
                        var sContent =
                            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + city + "</h4>" +
                            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + address + "</p>" +
                            "</div>";
                        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                        //图片加载完毕重绘infowindow
                        marker.openInfoWindow(infoWindow);
                    } else {
                        gc.getPoint(address, function (point) {
                            if (point) {
                                var p = new BMap.Point(point.lng, point.lat);
                                var marker = new BMap.Marker(p);  // 创建标注
                                map.addOverlay(marker);              // 将标注添加到地图中
                                setTimeout(function () {
                                    map.centerAndZoom(p, 15);
                                }, 1000);
                                map.setZoom(14);
                                var sContent =
                                    "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + city + "</h4>" +
                                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + address + "</p>" +
                                    "</div>";
                                var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                                //图片加载完毕重绘infowindow
                                marker.openInfoWindow(infoWindow);
                            }
                        }, city);
                    }


                });

            });
        </script>

        <!------------------------------------- end ----------------------------------------->

        <script src="style/js/company.min.js" type="text/javascript"></script>
        <script>
            var avatar = {};
            avatar.uploadComplate = function (data) {
                var result = eval('(' + data + ')');
                if (result.success) {
                    jQuery('#logoShow img').attr("src", ctx + '/' + result.content);
                    jQuery.colorbox.close();
                }
            };
        </script>
        <div class="clear"></div>
        <input type="hidden" value="d1035b6caa514d869727cff29a1c2e0c" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: inline;"></a>
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

<script>
    $("#saveLabels").click(function () {
        var labels = "";
        $("#hasLabels").find("li").each(function () {
            labels += $(this).text();
        })
        labels = labels.replace(/x/g, "-");
        labels = labels.substring(0, labels.length - 1);
        $.ajax({
            url: "${APP_PATH}/updateCompanyInfos",
            data: "tag=" + labels + "&companyId=" +${sessionScope.company.companyId},
            type: "POST",
            success: function () {
                location.reload();
            }
        })
    })

    /**
     * 功能：post方式提交
     * 参数列表：url：提交的地址；params：参数列表
     */
    function post(url, params) {
        var temp = document.createElement("form"); //创建form表单
        temp.action = url;
        temp.method = "post";
        temp.style.display = "none";//表单样式为隐藏
        for (var item in params) {//初始化表单内部的控件
            //根据实际情况创建不同的标签元素
            var opt = document.createElement("input");  //添加input标签
            opt.type = "text";   //类型为text
            opt.id = item;      //设置id属性
            opt.name = item;    //设置name属性
            opt.value = params[item];   //设置value属性
            temp.appendChild(opt);
        }

        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
</script>

</body>
</html>