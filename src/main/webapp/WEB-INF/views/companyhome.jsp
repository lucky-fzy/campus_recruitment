<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <c:if test="${sessionScope.emp != null}">
                    <li><a href="jianli" rel="nofollow">我的简历</a></li>
                </c:if>
                <c:if test="${sessionScope.company != null}">
                    <li><a href="create" rel="nofollow">发布职位</a></li>
                </c:if>
            </ul>
            <dl class="collapsible_menu">
                <%--若登录用户是求职者--%>
                <c:if test="${sessionScope.emp != null}">
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
                    <dd><a href="accountBind">帐号设置</a></dd>
                    <dd class="logout"><a rel="nofollow" href="quit">退出</a></dd>
                </c:if>
                <%--公司用户--%>
                <c:if test="${sessionScope.company != null}">
                    <dt>
                        <span>个人中心&nbsp;</span>
                        <span class="red dn" id="noticeDot-1"></span>
                        <i></i>
                    </dt>
                    <dd><a href="javascript:post('positions',{isOnline:1})">我发布的职位</a></dd>
                    <dd><a href="javascript:post('select_Resumes',{type:0})">我收到的简历</a></dd>
                    <dd class="btm"><a href="myhome">我的公司主页</a></dd>
                    <dd><a href="accountBind">帐号设置</a></dd>
                    <dd class="logout"><a rel="nofollow" href="quit">退出</a></dd>
                </c:if>
            </dl>
        </div>
    </div><!-- end #header -->
    <div id="container">
        <!-- <script src="style/js/swfobject_modified.js" type="text/javascript"></script> -->
        <div class="clearfix">

            <div class="content_l">
                <div class="c_detail">
                    <div style="background-color:#fff;" class="c_logo">
                        <c:if test="${company_detail.companyLogo == ''}">
                            <img src="style/images/logo_default.png" width="190" height="190"
                                 alt=${company.companyName}/>
                        </c:if>
                        <c:if test="${company_detail.companyLogo != ''}">
                            <img src="${company_detail.companyLogo}" width="190" height="190"
                                 alt=${company.companyName}/>
                        </c:if>
                    </div>


                    <div class="c_box companyName">
                        <h2 title="${company_detail.companyName}">${company_detail.companyName}</h2>

                        <c:if test="${company_detail.isAuthentication == 1}">
                            <em class="valid"></em>
                            <span class="va dn">认证企业</span>
                        </c:if>
                        <c:if test="${company_detail.isAuthentication == 0}">
                            <em class="unvalid"></em>
                            <span class="va dn">未认证企业</span>
                            <a target="_blank" class="applyC" href="auth">申请认证</a>
                        </c:if>

                        <div class="clear"></div>

                        <h1 title="${company_detail.allname}" class="fullname">${company_detail.allname}</h1>


                        <div class="clear oneword"><img width="17" height="15" src="style/images/quote_l.png">&nbsp;
                            <span>${company_detail.companyDescribe}</span> &nbsp;<img width="17" height="15"
                                                                                      src="style/images/quote_r.png">
                        </div>
                        <ul style="overflow:auto" id="hasLabels" class="reset clearfix">
                            <c:set value="${fn:split(company_detail.tag, '-')}" var="tags"/>
                            <c:forEach var="tag" items="${tags}">
                                <li>${tag}</li>
                            </c:forEach>
                        </ul>

                    </div>
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
                                            <a title="${position.positionName}" href="javascript:post('jobdetail',{positionId:${position.positionId}})">${position.positionName}</a>
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
                                <td>${company_detail.companyCity}</td>
                            </tr>
                            <tr>
                                <td>领域</td>
                                <td title="移动互联网">${company_detail.field}</td>
                            </tr>
                            <tr>
                                <td>规模</td>
                                <td>${company_detail.scale}</td>
                            </tr>
                            <tr>
                                <td>主页</td>
                                <td>
                                    <a rel="nofollow" title="${company_detail.companyWebsite}" target="_blank"
                                       href="http://${company_detail.companyWebsite}">${company_detail.companyWebsite}</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <dl class="c_section c_stages">
                        <dt>
                            <h2><em></em>融资阶段</h2>
                        </dt>
                        <dd>
                            <ul class="reset stageshow">
                                <li>目前阶段：<span class="c5">${company_detail.stage}</span></li>
                            </ul>
                        </dd>
                    </dl><!-- end .c_stages -->

                    <h3>具体地址:&nbsp&nbsp&nbsp${company_detail.companyPosition}</h3>
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
                    sMyGeo.getPoint("${company_detail.companyPosition}", function (sPoint) {
                        if (sPoint) {
                            sMap.centerAndZoom(sPoint, 16);
                            sMap.addOverlay(new BMap.Marker(sPoint));
                        }
                    }, "${company_detail.companyCity}");
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
                        var address = "${company_detail.companyPosition}";
                        var city = "${company_detail.companyCity}";
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
            <a rel="nofollow" title="回到顶部" id="backtop" style="display: inline;"></a>
        </div><!-- end #container -->
    </div><!-- end #body -->
    <div id="footer">
        <div class="wrapper">
            <a>联系我们</a>
            <a>互联网公司导航</a>
        </div>
    </div>

    <script src="style/js/core.min.js" type="text/javascript"></script>
    <script src="style/js/popup.min.js" type="text/javascript"></script>
    <script>
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
</div>
</body>
</html>