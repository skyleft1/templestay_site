<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>      
    
<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.springframework.util.FileCopyUtils" %>
<%@ page import="com.templestay_site.start.commons.WebConstants" %>
<%
    //request.setCharacterEncoding("UTF-8");//이 작업은 필터가 한다.
    String filename = request.getParameter("filename");
  //위 "filename" 을 컨트롤러에서 넘겨 받는다.(실제파일명)
    String tempfilename = request.getParameter("tempfilename");
  //위 "tempfilename" 을 컨트롤러에서 넘겨 받는다.(임시파일명)
    
    
    
    // 아래는 다운로드를 위한 일반적인 규칙
    File file = new File(WebConstants.UPLOAD_PATH + tempfilename);
    
    String filetype = filename.substring(filename.indexOf(".") + 1,
            filename.length());
    
    if (filetype.trim().equalsIgnoreCase("txt")) {
        response.setContentType("text/plain");
    } else {
        response.setContentType("application/octet-stream");
        // 서버가 클라이언트로 주는 애가 파일이라는 것을 설정하는 것
    }
    
    response.setContentLength((int) file.length());
    
    boolean ie = request.getHeader("User-Agent").indexOf("MSIE") != -1;
    
    if (ie) {
        filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
    } else {
        filename = new String(filename.getBytes("UTF-8"), "8859_1");
    }
    
    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
    
    OutputStream outputStream = response.getOutputStream();
    FileInputStream fis = null;
    
    try {
        fis = new FileInputStream(file);
        FileCopyUtils.copy(fis, outputStream);
    } finally {
        if (fis != null) {
            try {
                fis.close();
            } catch (IOException e) {
            }
        }
    }
    
    out.flush();
%>