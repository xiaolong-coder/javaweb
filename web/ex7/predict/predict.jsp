<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>昆虫预测</title>
    <%--    <link rel="stylesheet" href="salary.css"/>--%>
    <script src="../../js/jquery-3.6.1.js"></script>
    <script>
        // 取消重新提交提示
        window.history.replaceState(null, null, window.location.href);

        function check() {
            let formData = $("input[type=text]");
            let num = /^(\d+\.?\d*)$/;
            let submit = true;
            // 遍历检查表单元素
            formData.each(function (idx, ele) {
                // 数据可空，但不空时必须为数字
                if (ele.value !== "" && !num.test(ele.value)) {
                    ele.focus();
                    alert("数据有误");
                    submit = false;
                    // 终止遍历
                    return false;
                }
            });
            return submit;
        }
    </script>
    <%request.setCharacterEncoding("utf-8");%>
    <jsp:useBean id="insect" class="com.edu.nefu.bean.Insect"/>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    boolean submit = false;
    if (request.getParameter("rain8") != null) {
        submit = true;
%>
<jsp:setProperty name="insect" property="*"/>
<%
        insect.setNumInsect();
    }
    request.setAttribute("numInsect", submit ? insect.getNumInsect() : 0.0);
%>
<div class="box">
    <%--提交给当前页面处理，做好首次加载的特殊情况处理--%>
    <%--重置时重新加载页面，配合 JS 刷新 request，重置计算--%>
    <form action="predict.jsp" method="post" name="form" id="form" onsubmit="return check();"
          onreset="location.reload();">
        <h2>昆虫预测</h2>
        <div class="item">
            <label class="label" for="rain8">8月降水量</label>
            <input class="information" type="text" name="rain8" id="rain8">
        </div>
        <div class="item">
            <label class="label" for="wet8">8月相对湿度</label>
            <input class="information" type="text" name="wet8" id="wet8">
        </div>
        <div class="item">
            <label class="label" for="maxTemp1">1月极高温度</label>
            <input class="information" type="text" name="maxTemp1" id="maxTemp1">
        </div>
        <div class="item">
            <label class="label" for="minTemp1">1月极低温度</label>
            <input class="information" type="text" name="minTemp1" id="minTemp1">
        </div>
        <div class="item">
            <label class="label" for="minTemp8">8月极低温度</label>
            <input class="information" type="text" name="minTemp8" id="minTemp8">
        </div>
        <div class="item">
            <label class="label" for="argTemp7">7月平均温度</label>
            <input class="information" type="text" name="argTemp7" id="argTemp7">
        </div>
        <div class="item">
            <span class="label">落叶松毛虫发生量：</span>
            <span class="information">
                <%=request.getAttribute("numInsect")%>
            </span>
        </div>
        <div class="item div-button">
            <input type="reset" id="button-reset">
            <input type="submit" id="button-submit">
        </div>
    </form>
</div>
</body>
</html>