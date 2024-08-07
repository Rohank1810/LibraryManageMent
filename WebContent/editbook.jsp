<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.configuration.HibernateConfig" %>
<%@ page import="com.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Book</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Edit Book</h1>
        <%
            try {
                String idStr = request.getParameter("id");
                int id = Integer.parseInt(idStr);
                Session s = HibernateConfig.getSessionFactory().openSession();
                Transaction transaction = s.beginTransaction();
                Book book = s.get(Book.class, id);
                if (book == null) {
                    out.println("<p>Error: No book found with ID " + id + ".</p>");
                    transaction.commit();
                    s.close();
                    return;
                }
                transaction.commit();
                s.close();
        %>
        <form action="EditBookServlet" method="post">
            <input type="hidden" name="id" value="<%= book.getB_id() %>">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= book.getB_title() %>">
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" class="form-control" id="author" name="author" value="<%= book.getB_author() %>">
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="text" class="form-control" id="price" name="price" value="<%= book.getB_price() %>">
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
        <%
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
