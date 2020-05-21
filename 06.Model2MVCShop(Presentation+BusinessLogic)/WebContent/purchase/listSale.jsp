<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<title>��� ����</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScript �̿�  
	function fncGetSaleList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listSale.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">�Ǹ� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<input 	type="text" name="searchKeyword"  value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
							class="ct_input_g" style="width:200px; height:19px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetSaleList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		��ü  ${ resultPage.totalCount } �Ǽ�,	���� ${ resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" >����ּ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="pcVO" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">
				<c:choose>
					<c:when test="${pcVO.tranCode=='0'}">
						<a href="/getProduct.do?prodNo=${pcVO.purchaseProd.prodNo}&menu=manage">${pcVO.purchaseProd.prodName}</a>
					</c:when>
					<c:otherwise>
						${pcVO.purchaseProd.prodName}
					</c:otherwise>
				</c:choose>
			</td>
			<td></td>
			<td align="left">${pcVO.receiverName}</td>
			<td></td>
			<td align="left">${pcVO.divyAddr}</td>
			<td></td>
			<td align="left">
				<c:choose>
					<c:when test="${pcVO.tranCode==1}">
						���ſϷ� <a href="/updateTranCodeByProd.do?tranNo=${pcVO.tranNo}&tranCode=2">����ϱ�</a>
					</c:when>
					<c:when test="${pcVO.tranCode==2}">
						�����
					</c:when>
					<c:when test="${pcVO.tranCode==3}">
						��ۿϷ�
					</c:when>
					<c:otherwise>
						�Ǹ���
					</c:otherwise>
				</c:choose>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<c:if test="${resultPage.currentPage <= resultPage.pageUnit }">�� ����</c:if>
			<c:if test="${resultPage.currentPage > resultPage.pageUnit }">
				<a href="javascript:fncGetProdList('${resultPage.currentPage-1}')">�� ����</a>
			</c:if>
			<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				<a href="javascript:fncGetProdList('${i}');">${i}</a>
			</c:forEach>
			<c:if test="${resultPage.endUnitPage>=resultPage.maxPage}">���� ��</c:if>
			<c:if test="${resultPage.endUnitPage<resultPage.maxPage}">
				<a href="javascript:fncGetProdList('${resultPage.endUnitPage+1}')">���� ��</a>
			</c:if>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>
</div>

</body>
</html>