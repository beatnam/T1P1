<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String savePath = application.getRealPath("/") + "uploads";
    File uploadDir = new File(savePath);

    if (!uploadDir.exists()) {
        uploadDir.mkdir();
    }

    try {
        if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (!item.isFormField()) {
                    String fileName = item.getName();
                    File uploadedFile = new File(savePath + File.separator + fileName);
                    item.write(uploadedFile);
                }
            }
        }
        out.println("파일 업로드 성공");
    } catch (Exception ex) {
        out.println("<h3>Error: " + ex.getMessage() + "</h3>");
    }
%>