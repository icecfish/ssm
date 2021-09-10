package com.zcb.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zcb.crud.bean.Employee;
import com.zcb.crud.bean.Msg;
import com.zcb.crud.service.EmployeeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @auther zcb
 * @create 2021-09-06 20:53
 * 处理员工
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    //查询邮箱是否已被使用
    @RequestMapping(value = "/checkemail", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmail(@RequestParam("email") String email) {
        String regx = "^([\\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.[a-zA-Z0-9_-])+";
        if (email.matches(regx)) {
            return Msg.fail().add("errorMsg", "邮箱格式非法");
        }
        boolean b = employeeService.checkEmail(email);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("errorMsg", "该邮箱已被使用");
        }
    }
    //应对修改时会出现没改邮箱报邮箱已被使用而专门写的邮箱验证
    @RequestMapping(value = "/checkemail/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmailById(@RequestParam("email") String email,@PathVariable("id") Integer id) {
        String regx = "^([\\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.[a-zA-Z0-9_-])+";
        if (email.matches(regx)) {
            return Msg.fail().add("errorMsg", "邮箱格式非法");
        }
        boolean b = employeeService.checkEmailById(email,id);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("errorMsg", "该邮箱已被使用");
        }
    }

    //获取全部员工
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 10);
        List<Employee> employees = employeeService.getAll();
        PageInfo page = new PageInfo(employees, 5);
        return Msg.success().add("pageInfo", page);
    }

    //保存员工信息
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println(fieldError.getField() + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }
    //查询员工信息
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee=employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }
    //修改时保存员工
    //此处value中使用empId是因为使用bean获取传来的参数时，bean中属性必须和url中的属性名一致，否则无法赋值。
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg getEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }
    //删除员工
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids") String ids){
//        批量删除
        if(ids.contains("-")){
            List<Integer> del_ids= new ArrayList();
            String[] str_ids = ids.split("-");
            for (String str_id : str_ids) {
                del_ids.add(Integer.parseInt(str_id));
            }
            employeeService.deleteBatch(del_ids);
        }else {
//            单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }
    //    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        PageHelper.startPage(pn,5);
//        List<Employee> employees= employeeService.getAll();
//        PageInfo page = new PageInfo(employees,5);
//        model.addAttribute("pageInfo",page);
//        return "list";
//    }
}
