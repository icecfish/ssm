package com.zcb.crud.test;

import com.zcb.crud.bean.Department;
import com.zcb.crud.bean.Employee;
import com.zcb.crud.dao.DepartmentMapper;
import com.zcb.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.aspectj.apache.bcel.util.ClassPath;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @auther zcb
 * @create 2021-09-06 20:00
 *
 * @ContextConfiguration指定spring文件的位置
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applycationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void test1(){
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applycationContext.xml");
//        DepartmentMapper departmentMapper = ioc.getBean(DepartmentMapper.class);
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

//        employeeMapper.insertSelective(new Employee(null,"张存宝","男","zcb@qq.com",1));
//        批量插入
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<200;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,uid,"W",uid+"@gmail.com",2));
        }
        System.out.println("over");
    }
}
