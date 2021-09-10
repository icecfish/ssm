package com.zcb.crud.test;

import org.junit.Test;

/**
 * @auther zcb
 * @create 2021-09-09 12:01
 */
public class JavaSeTest {
    @Test
    public void test(){
        String s = "abc";
        String s2 = "abc";
        String s1 = new String("abc");
        s1=s2;
        System.out.println(s1==s);

    }
}
