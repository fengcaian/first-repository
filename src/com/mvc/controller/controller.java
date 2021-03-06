package com.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;







import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.mvc.bo.Student;
import com.mvc.bo.User;
import com.mvc.dao.dao;
import com.mvc.service.service;

@Controller
public class controller extends HttpServlet {
    
    service serv;
    
    
    //welcome-file不需要再写controller方法
   /* @RequestMapping("/index1")
    public ModelMap indexLog(){
        ModelMap map = new ModelMap();
        return map;
    }*/
    @InitBinder("user")  
    public void initUserBinder(WebDataBinder binder) {  
        binder.setFieldDefaultPrefix("user.");  
    }
    @InitBinder("student")  
    public void initStudentBinder(WebDataBinder binder) {  
        binder.setFieldDefaultPrefix("student.");  
    }
    @RequestMapping("/saveFormOk")
    public ModelMap saveOk(HttpServletRequest request,HttpServletResponse response,@ModelAttribute("user") User user,@ModelAttribute("student")Student student) throws SQLException{
        ModelMap map = new ModelMap();
        User userr = new User();
        
        String nn = request.getParameter("User.userName");
        userr.setUserName(nn);
        String name = user.getUserName();
        System.out.println(name);
        serv = new service();
        /*serv.saveUser();*/
        return map;
    }
    @SuppressWarnings("rawtypes")
    public ModelMap uploadFile(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        ModelMap map = new ModelMap();
        /*FileUploadSevlet util = new FileUploadSevlet();
        util.doPost(request, response);*/
        /*String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
        File uploadDest = new File(filePath);  
        String[] fileNames = uploadDest.list();  
        for (int i = 0; i < fileNames.length; i++) {  
            //打印出文件名  
            System.out.println(fileNames[i]);  
        }  
        */
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
        File file = new File(filePath);
        
        //判断上传文件的保存目录是否存在
        if(!file.exists() && !file.isDirectory()){
            System.out.println("目录不存在，需要新建目录");
            file.mkdir();
        }
        //消息提示
        String message = "";
        try{
          //使用Apache文件上传组件处理文件上传步骤：
          //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
          //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
          //解决上传文件名的中文乱码
            upload.setHeaderEncoding("utf-8");
          //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
              //按照传统方式获取数据
                return map;////////
            }
          //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item: list){
              //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    System.out.println(name+"="+value);
                }else{//如果fileitem中封装的是上传文件
                  //得到上传的文件名称
                    String fileName = item.getName();
                    System.out.println(fileName);
                    if(fileName == null || fileName.trim().equals("")){
                        continue;
                    }
                    
                  //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                  //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                  //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(filePath+ "\\" + fileName);
                  //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                  //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                  //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                      //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer,0,len);
                    }
                  //关闭输入流
                    in.close();
                  //关闭输出流
                    out.close();
                  //删除处理文件上传时生成的临时文件
                    item.delete();
                    message = "文件上传成功！";
                }
            }
        }catch (Exception e){
            message="文件上传失败";
            e.printStackTrace();
        }
        return map;
    }
    
    @RequestMapping("/testDateSource")
    public void testDateSource(){
        dao dao =  new dao();
        dao.sss();
    }
    
    
    @RequestMapping("index")
    public ModelMap index(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
        return map;
    }

    @RequestMapping("snake")
    public ModelMap snake(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
        String path = request.getSession().getServletContext().getRealPath("xls");//获得项目的相对路径，后面继续跟文件名称，可以获得该文件在项目下的路径
        System.out.println(path);
       /* JSONArray jsonArray = JSONArray.fromObject(User);*/
        
        
        return map;
    }
    
    @RequestMapping("regex")
    public ModelMap regex(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
       // String path = request.getSession().getServletContext().getRealPath("xls");//获得项目的相对路径，后面继续跟文件名称，可以获得该文件在项目下的路径
        return map;
    }
    @RequestMapping("tableSort")
    public ModelMap tableSort(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
        return map;
    }
    @RequestMapping("arrayTest")
    public ModelMap arrayTest(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
        return map;
    }
    
    @RequestMapping("funcTest")
    public ModelMap funcTest(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
        return map;
    }
    
    @RequestMapping("drawCube")
    public ModelMap drawCube(HttpServletRequest request,HttpServletResponse response){
        ModelMap map = new ModelMap();
        return map;
    }
    @RequestMapping("draw_table_slant")
    public ModelAndView drawTableSlant(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("table_slant");
        return mav;
    }
    
    @RequestMapping("draw_table_slant_fun2")
    public ModelMap drawTableSlantFun2(HttpServletRequest request,HttpServletResponse response){
        ModelMap mav = new ModelMap();
        return mav;
    }
    
    @RequestMapping("jsonp")
    public Object jsonp(HttpServletRequest request,HttpServletResponse response) throws IOException{
    	response.getWriter().write("l");
    	
    	
    	return null;
    }
    
}
