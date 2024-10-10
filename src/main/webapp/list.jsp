<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh sách sản phẩm</title>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    .success {
      color: green;
    }
    .add-link {
      display: inline-block;
      margin-bottom: 10px;
      padding: 5px 10px;
      background-color: #4CAF50;
      color: white;
      text-decoration: none;
      border-radius: 3px;
    }
  </style>
</head>
<body>
<h1>Danh sách sản phẩm</h1>

<c:if test="${not empty sessionScope.successMessage}">
  <p class="success">${sessionScope.successMessage}</p>
  <% session.removeAttribute("successMessage"); %>
</c:if>

<div class="top-products">
  <form action="topProducts" method="get">
    <select name="limit">
      <option value="3">Top 3</option>
      <option value="5">Top 5</option>
      <option value="10">Top 10</option>
    </select>
    <button type="submit">Xem sản phẩm bán chạy</button>
  </form>
</div>

<div class="date-range-form">
  <form action="orderedProducts" method="get">
    <label for="startDate">Từ ngày:</label>
    <input type="date" id="startDate" name="startDate" required>
    <label for="endDate">Đến ngày:</label>
    <input type="date" id="endDate" name="endDate" required>
    <button type="submit">Xem sản phẩm đã đặt hàng</button>
  </form>
</div>

<a href="add" class="add-link">Thêm mới sản phẩm</a>

<table>
  <tr>
    <th>STT</th>
    <th>Tên</th>
    <th>Giá</th>
    <th>Giảm giá</th>
    <th>Tồn kho</th>
    <th>Giá sau giảm</th>
  </tr>
  <c:forEach var="product" items="${products}" varStatus="status">
    <tr>
      <td>${status.index + 1}</td>
      <td>${product.name}</td>
      <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VNĐ"/></td>
      <td>${product.discount}%</td>
      <td>${product.stock}</td>
      <td><fmt:formatNumber value="${product.discountedPrice}" type="currency" currencySymbol="VNĐ"/></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>