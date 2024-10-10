<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sản phẩm đã đặt hàng</title>
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
  </style>
</head>
<body>
<h1>Sản phẩm đã đặt hàng từ ${startDate} đến ${endDate}</h1>

<table>
  <tr>
    <th>STT</th>
    <th>Tên</th>
    <th>Giá</th>
    <th>Giảm giá</th>
    <th>Tồn kho</th>
    <th>Giá sau giảm</th>
  </tr>
  <c:forEach var="product" items="${orderedProducts}" varStatus="status">
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

<a href="list">Quay lại danh sách sản phẩm</a>
</body>
</html>