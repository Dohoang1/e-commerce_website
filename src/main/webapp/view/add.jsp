<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Thêm mới sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
    .navbar-brand img {
      height: 40px;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="#"><img src="path/to/your/logo.png" alt="Logo"> TechStore</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="add"><i class="fas fa-plus"></i> Thêm mới sản phẩm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="list"><i class="fas fa-list"></i> Danh sách sản phẩm</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h1 class="text-center mb-4">Thêm mới sản phẩm</h1>

  <c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">${errorMessage}</div>
  </c:if>

  <form action="add" method="post" class="col-md-6 offset-md-3">
    <div class="mb-3">
      <label for="name" class="form-label">Tên sản phẩm:</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>

    <div class="mb-3">
      <label for="price" class="form-label">Giá:</label>
      <input type="number" class="form-control" id="price" name="price" min="100" step="0.01" required>
    </div>

    <div class="mb-3">
      <label for="discount" class="form-label">Giảm giá:</label>
      <select class="form-select" id="discount" name="discount" required>
        <option value="5">5%</option>
        <option value="10">10%</option>
        <option value="15">15%</option>
        <option value="20">20%</option>
      </select>
    </div>

    <div class="mb-3">
      <label for="stock" class="form-label">Tồn kho:</label>
      <input type="number" class="form-control" id="stock" name="stock" min="10" step="0.01" required>
    </div>

    <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>