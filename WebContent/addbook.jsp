<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Book</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        text-align: center;
        padding: 50px;
        margin: 0;
    }
    .navbar {
        overflow: hidden;
        background-color: #333;
        position: fixed;
        width: 100%;
        top: 0;
    }
    .navbar a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }
    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }
    .container {
        margin-top: 70px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    h1 {
        color: #4CAF50;
        margin-bottom: 20px;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }
    label {
        width: 100%;
        text-align: left;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type="text"] {
        margin: 10px 0;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        box-sizing: border-box;
    }
    input[type="submit"], input[type="reset"] {
        margin: 10px 5px;
        padding: 10px;
        border-radius: 5px;
        border: none;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        width: calc(50% - 20px);
    }
    input[type="reset"] {
        background-color: #f44336;
    }
    input[type="submit"]:hover, input[type="reset"]:hover {
        background-color: #45a049;
    }
    input[type="reset"]:hover {
        background-color: #e53935;
    }
    a {
        display: block;
        margin-top: 20px;
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="addbook.jsp">Add Book</a>
        <a href="booklist.jsp">View Book List</a>
    </div>
    <div class="container">
        <h1>Add your book here</h1>
        <form action="AddBookServlet" method="POST">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required><br>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required pattern="^\d+(\.\d{1,2})?$" title="Enter a valid price (e.g., 9.99)"><br>
            <div style="display: flex; width: 100%; justify-content: space-between;">
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
            </div>
        </form>
    </div>
</body>
</html>
