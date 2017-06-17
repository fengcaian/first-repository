package com.mvc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;


public class dao {
    
    private ApplicationContext ac = new ClassPathXmlApplicationContext("/config/spring-servlet.xml");
    
    private DataSource dsBusiness;
    
    
    private void init() {
        
        if (dsBusiness == null) {
            dsBusiness = (DataSource) ac.getBean("dataSource");
        }
    }
    
    public String sss(){
        init();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "select * from user where 1=1";
        try {
            conn = dsBusiness.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                String re1 = rs.getString("userName");
                String re2 = rs.getString(2);
                System.out.println(re1);
                System.out.println(re2);
                
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
