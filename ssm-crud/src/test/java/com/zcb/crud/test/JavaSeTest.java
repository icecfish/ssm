package com.zcb.crud.test;

import com.zcb.crud.bean.Employee;
import com.zcb.crud.dao.EmployeeMapper;
import org.junit.Test;

import java.lang.reflect.Method;

/**
 * @auther zcb
 * @create 2021-09-09 12:01
 */
public class JavaSeTest {
    @Test
    public void test() throws NoSuchMethodException {
        System.out.println("just test git");
        System.out.println("hellow git-fix-hot");
        System.out.println("hello master 3th！");
        System.out.println("hello git-fix-hot 2th");
        System.out.println("test push");
        System.out.println("不会有人再githhub上面直接改代码吧。不会吧");
        Method met = EmployeeMapper.class.getDeclaredMethod("selectByPrimaryKey");
    }
}
