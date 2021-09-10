<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/9/6
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%@include file="/header.jsp" %>
</head>
<body>
<%--员工修改弹窗--%>
<div class="modal fade" id="empEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_edit_p"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_edit_input"
                                   placeholder="请输入邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_edit_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_edit_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属部门</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_edit_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<!--员工添加弹窗-->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="请输入员工名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="请输入邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属部门</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>




<%--员工页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>员工管理</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-success" id="emp_add_model_btn">新增</button>
            <button type="button" class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>职工号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页数据--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-4" id="page_info">
        </div>
    </div>
    <%--显示分页条--%>
    <div class="row">
        <div class="col-md-8 col-md-offset-3" id="page_nav">

        </div>
    </div>
</div>

<%--ajax获取员工管理页面信息--%>
<script type="text/javascript">
    var lastPagem,currentPage;
    $(function () {
        to_page(1);
    })

    function to_page(pn) {
        $.ajax({
            url: "emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                $("#check_all").prop("checked",false);
                buid_emp_table(result);
                buid_page_info(result);
                buid_page_nav(result);
            }
        })
    }

    //获取当前员工列表
    function buid_emp_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td >");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").attr("id","edit_btn").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //添加一个属性为修改时获取员工信息提供id
            editBtn.attr("edit_id",item.empId);
            var deleteBtn = $("<button></button>").attr("id","delete_btn").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            deleteBtn.attr("del_id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        })
    }

    //解析显示分页信息
    function buid_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append("当前第" + result.extend.pageInfo.pageNum + "页，总共"
            + result.extend.pageInfo.pages + "页，总共"
            + result.extend.pageInfo.total + "条记录")
        lastPage = result.extend.pageInfo.pages + 1;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //解析显示分页条
    function buid_page_nav(result) {
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1)
            })
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)
            })
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("末页"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1)
            })
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages)
            })
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").attr("href", "#").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item)
            })
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav");
    }
    //添加模块===========================================================================================================
    //添加员工按钮
    $("#emp_add_model_btn").click(function () {
        //清除信息
        reset_form("#empAddModal form");
        //查数据库部门信息
        getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop: "static"
        });
    })

    //重置弹出框信息
    function reset_form(ele) {
        //清除表单框信息
        $(ele)[0].reset();
        //清除提示信息
        $(ele).find(".help-block").text("");
        //清除边框样式
        $(ele).find("*").removeClass("has-success has-error");
    }

    //查询所有部门
    function getDepts(ele) {
        //清空下拉列表的值
        $(ele).empty();
        $.ajax({
            url: "depts",
            type: "GET",
            success(result) {
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    //保存按钮
    $("#emp_save_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        if (!check_email_input("#email_add_input")) {
            return false;
        }
        $.ajax({
            url: "emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                // alert(result.msg);
                if(result.code==100){
                    $("#empAddModal").modal("hide");
                    to_page(lastPage);
                }else{
                    if(undefined!=result.extend.errorFields.empName){
                        show_valiate_msg("#empName_add_input", "error", "用户名必须是2-5位中文或是3-17位英文和数字组合")
                    }else if(undefined!=result.extend.errorFields.email){
                        show_valiate_msg("#email_add_input", "error", "邮箱格式非法！");
                    }
                }
            }
        })
    });

    //校验表单数据
    function validate_add_form() {
        if (validate_empName_add_input()) {
            return true;
        } else {
            return false;
        }
        ;
        if (validate_email_add_input("#email_add_input")) {
            return true;
        } else {
            return false;
        }
        ;
        return true;
    }

    //姓名校验
    function validate_empName_add_input() {
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{3,17}$)|(^[\u4E00-\u9FA5]{2,5})/
        if (!regName.test(empName)) {
            show_valiate_msg("#empName_add_input", "error", "用户名必须是2-5位中文或是3-17位英文和数字组合")
            return false;
        } else {
            show_valiate_msg("#empName_add_input", "success", "用户名可用")
            return true;
        }
    }

    //邮箱校验
    function  validate_email_add_input(ele) {
        var email = $(ele).val();
        var regEmail = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (!regEmail.test(email)) {
            show_valiate_msg(ele, "error", "邮箱格式非法！");
            return false;
        } else {
            show_valiate_msg(ele, "success", "邮箱可用")
            return true;
        }
    }

    //表单校验显示信息
    function show_valiate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error")
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //名称失去焦点
    $("#empName_add_input").change(function () {
        validate_empName_add_input();
    })
    //邮箱失去焦点
    $("#email_add_input").change(function () {

        if (!validate_email_add_input("#email_add_input")) {
            return false;
        };
        check_email_input("#email_add_input");
    })
    //邮箱是否存在验证
    function check_email_input(ele) {
        var email = $(ele).val();
        //知识点：ajax请求中的return只会跳出ajax方法，应该定义一个全局变量在大方法里返回该变量。
        var isOver = true;
        $.ajax({
            url: "checkemail",
            data: "email=" + email,
            type: "POST",
            async: false,
            success(result) {
                if (result.code == 100) {
                    show_valiate_msg(ele, "success", "邮箱可用");
                } else {
                    show_valiate_msg(ele, "error", result.extend.errorMsg);
                    isOver = false;
                    return isOver;
                };
            }
        });
        return isOver;
    };
//修改模块===============================================================================================================
//给修改绑定单击事件
//知识点：因为修改按钮是页面加载完毕后通过ajax请求获得的，直接绑定click方法不行。需要使用on方法 $(父标签)（事件，选择器（选哪一个后代标签）,function）
    $(document).on("click","#edit_btn",function (){
        //清除信息
        reset_form("#empEditModal form")
        //查询员工信息
        getEmp($(this).attr("edit_id"))
        //查数据库部门信息
        getDepts("#empEditModal select");
        //弹出模态框
        $("#emp_edit_btn").attr("edit_id",$(this).attr("edit_id"));
        $("#empEditModal").modal({
            backdrop: "static"
        });
    });
    //利用id获取员工信息
    function getEmp(id){
        $.ajax({
            url:"emp/"+id,
            type:"GET",
            success(result){
                var emp=result.extend.emp;
                $("#empName_edit_p").text(emp.empName);
                $("#email_edit_input").val(emp.email);
                $("#empEditModal input[name='gender']").val([emp.gender]);
                $("#empEditModal select[name='dId']").val([emp.dId]);
            }
        })
    }
    //邮箱改变事件
    $("#email_edit_input").change(function () {

        if (!validate_email_add_input("#email_edit_input")) {
            return false;
        };
        check_email_input_id("#email_edit_input",$("#emp_edit_btn").attr("edit_id"));
    })
    //修改按钮点击事件
    $("#emp_edit_btn").click(function (){
        if(!validate_email_add_input("#email_edit_input")){
            return false;
        };
        if(!check_email_input_id("#email_edit_input",$(this).attr("edit_id"))){
            return false;
        };
        //知识，此处可以选择type为post，在data中传入一个_method=put来使用put请求。
        //使用type=put请求需要加入一个过滤器，否则tomcat在获取请求方式，拿不到method=post时，会用自己的map代替request域中的map，并不会将data中数据放入该map中，导致controller层拿不到数据
        $.ajax({
            url:"emp/"+$(this).attr("edit_id"),
            type:"PUT",
            data:$("#empEditModal form").serialize(),
            success(result){
                $("#empEditModal").modal("hide");
                to_page(currentPage);
            }
        })
    })
    //应对修改时会出现没改邮箱报邮箱已被使用而专门写的邮箱验证
    function check_email_input_id(ele,id) {
        var email = $(ele).val();
        //知识点：ajax请求中的return只会跳出ajax方法，应该定义一个全局变量在大方法里返回该变量并且异步改为同步。
        var isOver = true;
        $.ajax({
            url: "checkemail/"+id,
            data: "email=" + email,
            type: "POST",
            async: false,
            success(result) {
                if (result.code == 100) {
                    show_valiate_msg(ele, "success", "邮箱可用");
                } else {
                    show_valiate_msg(ele, "error", result.extend.errorMsg);
                    isOver = false;
                    return isOver;
                };
            }
        });
        return isOver;
    };
//删除模块===============================================================================================================
    //单个删除
    $(document).on("click","#delete_btn",function (){
        var empId = $(this).attr("del_id");
        var empName=$(this).parents("tr").find("td:eq(2)").text()
        if(confirm("确认删除【"+empName+"】吗?")){
            $.ajax({
                url : "emp/"+empId,
                type:"DELETE",
                success(result){
                    to_page(currentPage);
                }
            })
        }
    })
//全选按钮单击事件
    $("#check_all").click(function (){
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    //单选满足全选后改变全选按钮状态
    $(document).on("click",".check_item",function (){
         var flag=$(".check_item:checked").length==$(".check_item").length;
         $("#check_all").prop("checked",flag);
    })
//    点击全部删除按钮批量删除
    $("#emp_delete_all_btn").click(function (){
        var empNames="";
        var empIds="";
        $.each($(".check_item:checked"),function (){
           empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
           empIds+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        if(""==empIds){
            return false;
        }
        empNames=empNames.substring(0,empNames.length-1);
        if(confirm("确认删除【"+empNames+"】吗")){
            $.ajax({
                url:"emp/"+empIds,
                type:"DELETE",
                success(result){
                    to_page(currentPage);
                }
            })
        }
    })
</script>
</body>
</html>
