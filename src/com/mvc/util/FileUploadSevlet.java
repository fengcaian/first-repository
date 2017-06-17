package com.mvc.util;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@SuppressWarnings("serial")
public class FileUploadSevlet extends HttpServlet {
	
    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @SuppressWarnings("rawtypes")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        //request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
        String savePath = "d://aaa//";
        System.out.println("savePath: " + savePath);
        File f1 = new File(savePath);
        if(!f1.exists()) {
            f1.mkdirs();
        }
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");
        List fileList = null;
        try
        {
            fileList = upload.parseRequest(request);
        }
        catch(FileUploadException ex)
        {
            return;
        }
        Iterator it = fileList.iterator();
        String name = "";
        String extName = "";
        while (it.hasNext()) {
			FileItem item = (FileItem) it.next();
			if (!item.isFormField()) {
				name = item.getName();
				if (name != null && !name.trim().equals("")) {
					if (name.lastIndexOf(".") >= 0)
						extName = name.substring(name.lastIndexOf("."));
					File file = null;
					do {
						String dateStr = UUID.randomUUID().toString().replace("-", "");
						name = dateStr + extName;
	                    file = new File((new StringBuilder(String.valueOf(savePath))).append(name).toString());
					} while (file.exists());
					File saveFile = new File((new StringBuilder(String
							.valueOf(savePath))).append(name).toString());
					try {
						item.write(saveFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
        String asd[] = new String[2];
        asd[0] = savePath;
        asd[1] = name;
        
        response.getWriter().print(asd);
    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
