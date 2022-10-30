<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>工资</title>
    <link rel="stylesheet" href="salary.css"/>
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
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    double salary = 0;
    double final_salary = 0;

    // 取出所有 name 为 add 的控件值，组成数组
    String[] str = request.getParameterValues("add");
    // 防止初值异常
    if (str != null) {
        for (String s : str) {
            if (!s.equals("")) {
                salary += Double.parseDouble(s);
            }
        }
    }

    str = request.getParameterValues("sub");
    if (str != null) {
        for (String s : str) {
            if (!s.equals("")) {
                salary -= Double.parseDouble(s);
            }
        }
    }

    session.setAttribute("salary", salary);

    final_salary = salary;
    if (salary > 5000)
        final_salary -= salary * 0.05;

    session.setAttribute("final_salary", final_salary);
%>
<div class="box">
    <%--提交给当前页面处理，做好首次加载的特殊情况处理--%>
    <%--重置时重新加载页面，配合 JS 刷新 request，重置计算--%>
    <form action="salary.jsp" method="post" name="form" id="form" onsubmit="return check();"
          onreset="location.reload();">
        <h2>应发项目</h2>
        <div class="item">
            <label class="label" for="post-salary">岗位工资</label>
            <input class="information" type="text" name="add" id="post-salary">
        </div>
        <div class="item">
            <label class="label" for="rank-salary">薪级工资</label>
            <input class="information" type="text" name="add" id="rank-salary">
        </div>
        <div class="item">
            <label class="label" for="allowance">工作津贴</label>
            <input class="information" type="text" name="add" id="allowance">
        </div>
        <div class="item">
            <label class="label" for="house">房补</label>
            <input class="information" type="text" name="add" id="house">
        </div>
        <div class="item">
            <label class="label" for="accumulation">公积金补贴</label>
            <input class="information" type="text" name="add" id="accumulation">
        </div>
        <div class="item">
            <label class="label" for="lunch">午餐费</label>
            <input class="information" type="text" name="add" id="lunch">
        </div>
        <h2>扣款项目</h2>
        <div class="item">
            <label class="label" for="medical">医疗保险扣款</label>
            <input class="information" type="text" name="sub" id="medical">
        </div>
        <div class="item">
            <label class="label" for="endowment">养老保险扣款</label>
            <input class="information" type="text" name="sub" id="endowment">
        </div>
        <div class="item">
            <label class="label" for="accumulation-sub">公积金扣款</label>
            <input class="information" type="text" name="sub" id="accumulation-sub">
        </div>
        <div class="item">
            <span class="label">应发工资：</span>
            <span class="information">
                <%=session.getAttribute("salary")%>
            </span>
        </div>
        <div class="item">
            <span class="label">实发工资：</span>
            <span class="information">
                <%=session.getAttribute("final_salary")%>
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