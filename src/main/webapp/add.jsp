<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Thêm mới sản phẩm</title>
  <style>
    .error {
      color: red;
    }
    form {
      width: 300px;
      margin: 0 auto;
    }
    label, input, select {
      display: block;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>

<c:if test="${not empty errorMessage}">
  <p class="error">${errorMessage}</p>
</c:if>

<form action="add" method="post">
  <label for="name">Tên sản phẩm:</label>
  <input type="text" id="name" name="name" required>

  <label for="price">Giá:</label>
  <input type="number" id="price" name="price" min="100" step="0.01" required>

  <label for="discount">Giảm giá:</label>
  <select id="discount" name="discount" required>
    <option value="5">5%</option>
    <option value="10">10%</option>
    <option value="15">15%</option>
    <option value="20">20%</option>
  </select>

  <label for="stock">Tồn kho:</label>
  <input type="number" id="stock" name="stock" min="10" step="0.01" required>

  <input type="submit" value="Thêm sản phẩm">
</form>
</body>
</html>