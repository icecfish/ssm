package com.zcb.crud.controller;

import com.zcb.crud.bean.Department;
import com.zcb.crud.bean.Msg;
import com.zcb.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @auther zcb
 * @create 2021-09-07 21:36
 * 处理部门
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> departments = departmentService.getDepts();
        return Msg.success().add("depts",departments);
    }

}
