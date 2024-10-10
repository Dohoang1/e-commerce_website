<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
    .navbar-brand img {
      height: 40px;
    }
    .product-actions {
      margin: 20px 0;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="#"><img src="../logo.png" alt="Logo"> TechStore</a>
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
  <h1 class="text-center mb-4">Danh sách sản phẩm</h1>

  <c:if test="${not empty sessionScope.successMessage}">
    <div class="alert alert-success">${sessionScope.successMessage}</div>
    <% session.removeAttribute("successMessage"); %>
  </c:if>

  <div class="row product-actions">
    <div class="col-md-6 mb-3">
      <div class="form-container">
        <h5 class="text-center">Xem sản phẩm bán chạy</h5>
        <form action="topProducts" method="get" class="d-flex justify-content-center">
          <select name="limit" class="form-select me-2" style="width: auto;">
            <option value="3">Top 3</option>
            <option value="5">Top 5</option>
            <option value="10">Top 10</option>
          </select>
          <button type="submit" class="btn btn-primary">Xem</button>
        </form>
      </div>
    </div>
    <div class="col-md-6 mb-3">
      <div class="form-container">
        <h5 class="text-center">Xem sản phẩm đã đặt hàng</h5>
        <form action="orderedProducts" method="get" class="d-flex justify-content-center">
          <input type="date" id="startDate" name="startDate" class="form-control me-2" required style="width: auto;">
          <input type="date" id="endDate" name="endDate" class="form-control me-2" required style="width: auto;">
          <button type="submit" class="btn btn-primary">Xem</button>
        </form>
      </div>
    </div>
  </div>

  <table class="table table-striped table-hover">
    <thead class="table-dark">
    <tr>
      <th>STT</th>
      <th>Tên</th>
      <th>Giá</th>
      <th>Giảm giá</th>
      <th>Tồn kho</th>
      <th>Giá sau giảm</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}" varStatus="status">
      <tr>
        <td>${status.index + 1}</td>
        <td>${product.name}</td>
        <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/></td>
        <td>${product.discount}%</td>
        <td>${product.stock}</td>
        <td><fmt:formatNumber value="${product.discountedPrice}" type="currency" currencySymbol="$"/></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>