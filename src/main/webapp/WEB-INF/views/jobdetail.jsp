<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
    <script src="style/js/jquery-hbzx.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a href="home" class="logo">
                <img src="style/images/logo.png" width="229" height="43" alt="校园招-专注大学生实习招聘"/>
            </a>
            <ul class="reset" id="navheader">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a href="yanzhi" target="_blank">论坛</a></li>
                <c:if test="${sessionScope.emp != null}">
                    <li><a href="jianli" rel="nofollow">我的简历</a></li>
                </c:if>
                <c:if test="${sessionScope.company != null}">
                    <li><a href="create" rel="nofollow">发布职位</a></li>
                </c:if>
            </ul>
            <ul class="loginTop">
                <c:if test="${sessionScope.emp == null && sessionScope.company == null}">
                    <li><a href="login" rel="nofollow">登录</a></li>
                </c:if>
                <c:if test="${sessionScope.emp != null || sessionScope.company != null}">
                    <li><a href="quit" rel="nofollow">退出</a></li>
                </c:if>
                <li>|</li>
                <li><a href="register" rel="nofollow">注册</a></li>
            </ul>
        </div>
    </div><!-- end #header -->
    <div id="container">
        <div class="clearfix">
            <div class="content_l">
                <dl class="job_detail">
                    <dt>
                        <h1>
                            <em></em>
                            <div>${position.company.companyName}${position.department}招聘</div>
                            ${position.positionName}
                        </h1>

                        <c:if test="${sessionScope.emp == null}">
                            <a class="inline jd_collection" href="#loginPop" title="登录">
                        </c:if>
                        <c:if test="${sessionScope.emp != null}">
                            <c:if test="${collect != null}">
                                <a title="取消收藏" class="jd_collection collected" onclick="updateCollection(this,${position.positionId},${sessionScope.emp.empId})"></a>
                            </c:if>
                            <c:if test="${collect == null}">
                                <a title="收藏职位" class="jd_collection" onclick="updateCollection(this,${position.positionId},${sessionScope.emp.empId})"></a>
                            </c:if>
                        </c:if>
                        </a>
                    </dt>
                    <dd class="job_request">
                        <span class="red">${position.minSalary}k-${position.maxSalary}k</span>
                        <span>${position.jobCity}</span>
                        <span>${position.jobExperience}</span>
                        <span> ${position.degree}及以上</span>
                        <span>${position.jobType}</span><br/>
                        职位诱惑 : ${position.positionTemptation}
                        <div>发布时间：${position.releaseTime}</div>
                    </dd>
                    <dd class="job_bt">
                        <h3 class="description">职位描述</h3>
                        <p>岗位职责： <br/>${position.positionDescribe}
                        </p>
                        <p>&nbsp;岗位要求： <br/>${position.positionRequirement}
                        </p>
                    </dd>

                    <dd>
                        <c:if test="${sessionScope.emp == null}">
                            <a href="#loginPop" title="登录" class="inline btn fr btn_apply">投个简历</a>
                        </c:if>
                        <c:if test="${sessionScope.emp != null}">
                            <a title="投个简历" class="btn fr btn_apply inline cboxElement" href="#setResumeApply">投个简历</a>
                        </c:if>
                    </dd>
                </dl>
            </div>
            <div class="content_r">
                <dl class="job_company">
                    <dt>
                        <a href="companyhome?companyId=${position.company.companyId}" target="_blank">
                            <img class="b2" src="${position.company.companyLogo}" width="80"
                                 height="80" alt="${position.company.companyName}"/>
                            <div>
                                <h2 class="fl">
                                    ${position.company.companyName}

                                    <c:if test="${position.company.isAuthentication == 1}">
                                        <img src="style/images/valid.png" width="15" height="19" alt="认证企业"/>
                                        <span class="dn">认证企业</span>
                                    </c:if>
                                </h2>
                            </div>
                        </a>
                    </dt>
                    <dd>
                        <ul class="c_feature reset">
                            <li><span>领域</span>
                                <c:set value="${fn:split(position.company.field, '-')}" var="tags"/>
                                <c:forEach var="tag" items="${tags}">
                                    ${tag}&nbsp;
                                </c:forEach>
                            </li>
                            <li><span>规模</span> ${position.company.scale}</li>
                            <li>
                                <span>主页</span>
                                <a href="http://${position.company.companyWebsite}" target="_blank" title="${position.company.companyWebsite}" rel="nofollow">http://${position.company.companyWebsite}</a>
                            </li>
                        </ul>

                        <h4>发展阶段</h4>
                        <ul class="c_feature reset">
                            <li><span>目前阶段</span>${position.company.stage}</li>
                        </ul>

                        <h4>工作地址</h4>
                        <div>${position.jobAddr}</div>
                        <div id="smallmap"></div>
                        <a href="javascript:;" id="mapPreview">查看完整地图</a>
                    </dd>
                </dl>
                <a href="javascript:void(0)" target="_blank"
                   class="eventAd">
                    <img src="style/images/zhouyou.jpg" width="280" height="135"/>
                </a>
            </div>
        </div>

        <!-------------------------------------弹窗lightbox  ----------------------------------------->
        <div style="display:none;">

            <!-- 投递简历-->
            <div style="height:200px;" class="popup" id="setResumeApply">
                <table width="100%">
                    <tbody>
                    <tr>
                        <td class="f18 c5">请选择你要投出去的简历：</td>
                    </tr>
                    <tr>
                        <td>
                            <form class="resumeSetForm" id="resumeSendForm" action="resumeSend" method="post">
                                <label class="radio">
                                    <input type="radio" value="0" class="resume0" name="resumeName">
                                    在线简历：
                                    <span title="${sessionScope.emp.empName}的简历">${sessionScope.emp.empName}的简历</span>
                                </label>
                                <div class="setBtns">
                                    <a target="_blank" href="preview">预览</a> |
                                    <a target="_blank" href="jianli">修改</a>
                                </div>
                                <div class="clear"></div>

                                <div class="clear"></div>
                                <label class="bgPink" style="background: #FFFFFF"></label>
                                <span class="setTip error"></span>
                                <input type="hidden" value="${position.positionId}" name="positionId">
                                <input type="hidden" value="${sessionScope.resume.resumeId}" name="resumeId">
                                <input type="submit" value="确认投递简历" class="btn_profile_save btn_s">
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div><!--/#setResumeApply-->


            <!-- 登录框 -->
            <div id="loginPop" class="popup" style="height:240px;">
                <form id="loginForm" action="loginValidate" method="post">
                    <input type="text" id="email" name="email" value="" tabindex="1" placeholder="请输入登录邮箱地址" />
                    <c:if test="${msg == '该账号尚未注册，请先注册！'}">
                        <span for="email" generated="true" class="error">${msg}</span>
                    </c:if>
                    <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" />
                    <c:if test="${msg == '密码不正确！'}">
                        <span for="email" generated="true" class="error">${msg}</span>
                    </c:if>
                    <input type="hidden" id="login_val" name="type" value="0"/>
                    <span class="error" style="display:none;" id="beError"></span>

                    <input type="submit" id="login_btn" class="submitLogin" value="登 &nbsp; &nbsp; 录" />
                    <a href="home"  style="float: left;margin-left: 50px"><input type="button" class="submitLogin" value="取 &nbsp; &nbsp; 消" /></a>
                </form>
                <div class="login_right">
                    <div>还没有帐号？</div>
                    <a  href="register"  class="registor_now">立即注册</a>
                    <div>
                        <a  class="registor_now" style="font-size: 25px;margin-top: 50px" id="login_type">公司登录</a>
                    </div>
                </div>
            </div><!--/#loginPop-->

            <!--地图弹窗-->
            <div id="baiduMap" class="popup">
                <div id="allmap"></div>
            </div><!--/#baiduMap-->
        </div>
        <!------------------------------------- end ----------------------------------------->

        <script type="text/javascript" src="style/js/job_detail.js"></script>
        <script type="text/javascript" src="style/js/count.js"></script>

        <script>
            function updateCollection(data,positionId,empId) {
                if ($(data).hasClass("collected")) {
                    $.ajax({
                        url:"updateCollection",
                        data:{"positionId":positionId,"empId":empId,"type":0},
                        type:"POST",
                        success:function () {
                            $(data).removeClass("collected");
                        }
                    })
                }else {
                    $.ajax({
                        url:"updateCollection",
                        data:{"positionId":positionId,"empId":empId,"type":1},
                        type:"POST",
                        success:function () {
                            $(data).addClass("collected");
                        }
                    })
                }
            }

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
                    var opt =document.createElement("input");  //添加input标签
                    opt.type="text";   //类型为text
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
                sMyGeo.getPoint("${position.jobAddr}", function (sPoint) {
                    if (sPoint) {
                        sMap.centerAndZoom(sPoint, 16);
                        sMap.addOverlay(new BMap.Marker(sPoint));
                    }
                }, "${position.jobCity}");
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
                    var address = "${position.jobAddr}";
                    var city = "${position.jobCity}";
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
        <div class="clear"></div>
        <input type="hidden" id="resubmitToken" value="6e1925fdbe7142468f154abd1d33f5a8"/>
        <a id="backtop" title="回到顶部" rel="nofollow"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a href="h/about.html" target="_blank" rel="nofollow">联系我们</a>
        <a href="h/af/zhaopin.html" target="_blank">互联网公司导航</a>
    </div>
</div>

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

<!--  -->

</body>
</html>