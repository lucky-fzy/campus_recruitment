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
    <link rel="stylesheet" type="text/css" href="style/css/yanzhi.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/yanzhi1.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/yanzhi3.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
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
                <li><a href="yanzhi">言职</a></li>
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
    <div class="banner" id="banner">
        <h2>言职</h2>
        <h3>更真实的公司点评社区</h3>
    </div>
    <div class="container clearfix" id="container" style="margin-left: 15%">
        <div class="content fl">
            <div class="news" id="news">
                <div class="news_tab" id="newsTab">
                    <ul>
                        <li class="current">${questionType}</li>
                    </ul>
                </div>
                <div class="news_list news_recommended  current">
                    <ul class="list">
                        <c:forEach items="${questions.list}" var="question">
                            <li class="">
                                <div class="news_answer item">
                                    <div class="item_header">
                                        <div class="answerer_avatar">
                                            <a class="anonymous"><img src="${question.resume.photo}" width="44"
                                                                      height="44" alt="${question.emp.empName}"></a>
                                        </div>
                                        <strong class="answerer_name user_card_float_wrap">
                                            <a class="anonymous" href="javascript:;">${question.emp.empName}</a>
                                        </strong>
                                        <span class="fr">${question.questionDate}</span>
                                    </div>
                                    <h4 class="item_question question_name" style="overflow-wrap: break-word;">
                                        <a>${question.questionName}</a>
                                    </h4>
                                    <div class="item_content clearfix">
                                        <p class="answer_summary" style="overflow-wrap: break-word;">
                                                ${question.questionContent}
                                        </p>
                                        <div class="item_status status_bar">
                                            <span class="status_item"><a
                                                    onclick="status_item(this,${question.questionId},${question.comments.size()})">${question.comments.size()}条评论</a></span>
                                        </div>
                                        <input id="content_num" type="hidden" value="${question.comments.size()}条评论">

                                    </div>
                                    <div class="comment-list" questionId="${question.questionId}" style="display:none">
                                        <span class="top-arrow-out"></span>
                                        <span class="top-arrow-in"></span>

                                        <ul class="c-list">
                                            <c:forEach items="${question.comments}" var="comment">
                                                <li class="c-item">
                                                    <div class="comment-info">
                                                        <a><img class="portrait" src="${comment.resume.photo}"
                                                                width="46" height="46" alt="用户头像"></a>
                                                        <p class="title">
                                                            <a>${comment.emp.empName}</a>
                                                            <span class="reply-text">回复</span>
                                                            作者

                                                            <span class="publish-date fr">${comment.commentDate}</span>
                                                        </p>

                                                        <div>${comment.commentContent}</div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                        <c:if test="${sessionScope.emp != null}">
                                            <div class="reply-answer" data-id="13180467">
                                                <form class="reply-answer-form">
                                            <textarea class="comment" name="replyAnswerText" maxlength="200"
                                                      placeholder="写下您的评论..."></textarea>
                                                    <p class="c-reply-infos">
                                                        <a rel="nofollow"
                                                           onclick="add_comment(this,${question.questionId},${sessionScope.emp.empId})"
                                                           class="c-reply-submit c-reply-btn btn btn_disable">提交</a>
                                                    </p>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                    <c:if test="${questionType != '我的话题'}">
                        <div class="Pagination myself">
                            <a href="yanzhi?pn=1" title="1">首页</a>
                            <c:if test="${questions.hasPreviousPage}">
                                <a href="yanzhi?pn=${questions.pageNum-1}">上一页</a>
                            </c:if>
                            <c:forEach items="${questions.navigatepageNums}" var="page_Num">
                                <c:if test="${page_Num == questions.pageNum}">
                                    <a href="#" class="current" title="${page_Num}">${page_Num}</a>
                                </c:if>
                                <c:if test="${page_Num != questions.pageNum}">
                                    <a href="yanzhi?pn=${page_Num}" title="${page_Num}">${page_Num}</a>
                                </c:if>
                            </c:forEach>
                            <c:if test="${questions.hasNextPage}">
                                <a href="yanzhi?pn=${questions.pageNum+1}" title="${questions.pageNum+1}">下一页 </a>
                            </c:if>
                            <a href="yanzhi?pn=${questions.pages}" title="${questions.pages}">尾页</a>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>
        <div class="side fl">
            <div class="user_card">
                <c:if test="${sessionScope.emp == null}">
                    <div class="user_card_login" id="userCardLogin">
                        <div class="user_card_login_box">
                            <div class="avatar">
                                <a rel="nofollow" class="passport_login_pop" href="javascript:;" data-lg-tj-id="1gz0"
                                   data-lg-tj-no="idnull" data-lg-tj-cid="idnull">
                                    <img src="style/images/avatar_default.png" width="96" height="96">
                                </a>
                            </div>
                            <p class="title">
                                Hi,<span>您好</span>
                            </p>
                            <p class="subtitle">
                                登录后可以blablabla~
                            </p>
                            <div class="toolbar">
                                <a rel="nofollow" style="margin-right: 10px" class="btn1 login_btn passport_login_pop"
                                   href="login">登录</a><a style="margin-left: 10px" rel="nofollow"
                                                         class="btn1 btn_invert register_btn" href="register">注册</a>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.emp != null}">
                    <div class="user_card_normal" id="userCardNormal">
                        <div class="user_card_normal_box">
                            <div class="userinfo_base clearfix" style="width:234px;margin: 0 auto">
                                <div class="avatar">
                                    <a>
                                        <img src="${sessionScope.resume.photo}" width="96"
                                             height="96" alt="${sessionScope.emp.empName}">
                                    </a>
                                </div>
                                <div class="username">
                                    <a>
                                        <span>${sessionScope.emp.empName}</span>
                                        <c:if test="${sessionScope.emp.gender == '1'}">
                                            <i class="boy">男</i>
                                        </c:if>
                                        <c:if test="${sessionScope.emp.gender == '0'}">
                                            <i class="girl">女</i>
                                        </c:if>
                                    </a>
                                </div>
                            </div>
                            <div class="user_status">
                                <ul class="clearfix" style="margin-left: 40px">
                                    <li><em>${ask_num}</em>提问</li>
                                    <li><em>${answer_num}</em>回答</li>
                                </ul>
                            </div>
                            <a class="inline ask_btn btn1 new_question" title="提个问题"
                               href="#newQuestionPopupBox">提个问题</a>
                        </div>
                    </div>
                    <a class="more_topic_link btn1 btn_invert" id="myQuestion"
                       href="javascript:post('myQuestion',{empId:${sessionScope.emp.empId}})">我的问题</a>
                    <a class="more_topic_link btn1 btn_invert" id="moreQuestion" href="yanzhi">热议话题</a>
                    <div class="slider" id="multiAdSite">
                        <div class="slider_nav"></div>
                    </div>
                </c:if>

            </div>

        </div>


        <!-------------------------------------弹窗lightbox  ----------------------------------------->
        <div style="display:none;">
            <!-- 发布话题框 -->
            <div class="new_question_popup_box" id="newQuestionPopupBox">
                <form id="newQuestionForm" action="askNew" method="post">
                    <div>
                        <label><i style="color: #ff1608"> * </i>问题</label>
                        <input name="questionName" type="text" required
                               style="margin-left:30px;font-size: 14px;width: 70%;line-height: 24px;height: 24px;color: #555;"
                               placeholder="请一句话描述问题，并以问号结束">
                    </div>
                    <div style="margin-top: 20px">
                        <label style="vertical-align:middle;display:inline-block;">问题补充</label>
                        <textarea name="questionContent"
                                  style="margin-left:12px;vertical-align:middle;font-size: 14px;width: 75%;color: #555;"
                                  placeholder="请详细介绍问题，认真的提问才能带来专业的回答哦"></textarea>
                    </div>

                    <div class="new_question_toolbar">
                        <input type="hidden" name="empId" value="${sessionScope.emp.empId}">
                        <input type="submit" class="btn1 new_question_submit" style="margin-top: 20px;margin-left: 20%"
                               value="发布问题">
                    </div>
                </form>
            </div>

        </div>
        <!------------------------------------- end ----------------------------------------->

        <script type="text/javascript" src="style/js/count.js"></script>

        <script>

            function add_comment(data, questionId, empId) {
                var str = $(data).parents("form").find("textarea").val();
                var str1 = str.replace(/\s+/g, "");
                if (str1 != "") {
                    $.ajax({
                        url: "add_comment",
                        data: {"commentContent": str, "questionId": questionId, "empId": empId},
                        type: "POST",
                        success: function () {
                            location.reload()
                        }
                    })
                }
            }

            $(".comment").on("input propertychange", function () {
                if ($(this).val() == "") {
                    $(".c-reply-submit").addClass("btn_disable");
                } else {
                    $(".c-reply-submit").removeClass("btn_disable");
                }
            })

            function status_item(data, questionId, questionNum) {
                if (data.text == "收起评论") {
                    $(".comment-list[questionId=" + questionId + "]").attr("style", "display:none");
                    $(data).text(questionNum + "条评论")
                } else {
                    $(".comment-list[questionId=" + questionId + "]").attr("style", "display:block");
                    $(data).text("收起评论")
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

        <div class="clear"></div>
        <input type="hidden" id="resubmitToken" value="6e1925fdbe7142468f154abd1d33f5a8"/>
        <a id="backtop" title="回到顶部" rel="nofollow"></a>
    </div>
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