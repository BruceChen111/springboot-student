<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生管理系统</title>
    <link rel="stylesheet" href="/css/bootstrap.min.3.3.5.css">
    <script src="/js/jquery-1.10.2.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jqPaginator.js"></script>
</head>
<body>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>地址</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr><button type="button" class="btn btn-primary"  onclick="addStudent(${student.id})" id="addBtn">新增</button>
        </tr>

        <c:forEach var="student" items="${pageInfo.list}">

            <tr>
                <td>${student.id}</td>
                <td>${student.sname}</td>
                <td>${student.age}</td>
                <td>${student.gender}</td>
                <td>${student.address}</td>
                <td>
                    <button type="button" class="btn btn-primary"  onclick="updateStudent(${student.id})">修改</button>
                    <button type="button" class="btn btn-danger" onclick="deleteStudent(${student.id})">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 修改模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
                <form role="form" id="addForm" method="post">
                    <div class="form-group">
                        <label for="name">姓名</label>
                        <input type="text" class="form-control" id="name" placeholder="姓名" name="name">
                    </div>
                    <div class="form-group">
                        <label for="age">年龄</label>
                        <input type="text" class="form-control" id="age" placeholder="年龄" name="age">
                    </div>
                    <div class="form-group">
                        <label for="school">学校</label>
                        <input type="text" class="form-control" id="school" placeholder="学校" name="school">
                    </div>
                    <div class="form-group">
                        <label for="sex">性别</label>
                        <input type="text" class="form-control" id="sex" placeholder="性别" name="sex">
                    </div>

                    <button type="submit" class="btn btn-default" id="submit" onclick="addStudent()">提交</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!-- 分页的导航栏 -->
<div class="pagination-layout">

    <div class="pagination">
        <ul class="pagination">

        </ul>


    </div>
</div>


</div>

<script>

    window.onload = function() {
        var if_fistime = true;
        $(".pagination")
            .jqPaginator(
                {
                    totalPages : ${pageInfo.pages},
                    visiblePages : 3,
                    currentPage : ${pageInfo.pageNum},
                    first : '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
                    prev : '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                    next : '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                    last : '<li class="last"><a href="javascript:void(0);">最后一页</a></li>',
                    page : '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',

                    onPageChange : function(num) {

                        /* alert(num); */
                        if (if_fistime) {
                            if_fistime = false;
                        } else {
                            changePage(num);
                        }

                    }

                })

    }

    function changePage(num) {

        window.location.href = "getStusByPage?pageNum=" + num;
    }



</script>


</body>
<script>
    $(function () {
        $("#addBtn").click(function () {
            $('#myModal').modal({
                keyboard: true
            })
        })
    })
    function addStudent() {
        $("#addForm").attr("action","/addStudent")
        $("#addForm").submit();
    }
    function deleteStudent(studentId) {
        location.href = "/delete/" + studentId;
    }

</script>
</html>