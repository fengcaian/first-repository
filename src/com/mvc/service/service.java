package com.mvc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mvc.bo.User;

public class service extends HttpServlet {

    private DataSource dataSource;
    
    public void saveUser() throws SQLException{
        
        
        
        ApplicationContext ac = new FileSystemXmlApplicationContext("/WEB_INF/spring-servlet.xml");

        
        
      //获取ServletContext 再获取 WebApplicationContextUtils  
        /*ServletContext servletContext = this.getServletContext();  
        WebApplicationContext context =   AQQWQWW   
                WebApplicationContextUtils.getWebApplicationContext(servletContext);  */
        dataSource  = (DataSource) ac.getBean("dataSource");
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dataSource.getConnection();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        StringBuffer sql = new StringBuffer("insert into user(userId,userName)values(?,?)");
        ps.setString(1, "1234");
        ps.setString(2,"冯才安");
        ps = conn.prepareStatement(sql.toString());
        ps.execute();
        
        
        
    }
}
