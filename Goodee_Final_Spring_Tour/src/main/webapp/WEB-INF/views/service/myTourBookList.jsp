<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./js/myTourBookListAjax.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
function request_pay() {
	//가맹점 식별코드
	IMP.init('imp51549826');
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '${productInfo.name}', //결제창에서 보여질 이름
		amount: '${productInfo.price}', //실제 결제되는 가격
		buyer_email: '${sessionScope.member.email}',
		buyer_name: '${sessionScope.member.name}',
		buyer_tel: '${sessionScope.member.phone}',
		/* buyer_addr : '서울 강남구 도곡동',
		buyer_postcode : '123-456' */
	}, function(rsp) {
		console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			/* 결제검증 */
			var sendData = {
				"imp_uid": rsp.imp_uid, "pg": rsp.pg_provider, "pay_method": rsp.pay_method,
				"card_name": rsp.card_name, "price": rsp.paid_amount, "name": rsp.name, "status": rsp.status
			}
			$.ajax({
				url: "./paymentInsert.do",
				type: "POST",
				data: JSON.stringify(sendData),
				contentType: 'application/json; charset=UTF-8',
				dataType: 'json'
			}).done(function(data) {

				console.log(data);

				// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
				if (rsp.paid_amount == data.response.amount) {
					console.log(rsp.paid_amount);
					console.log(data.response.amount);
					alert("결제 및 결제검증완료");
				} else {
					alert("결제 실패 : 위조된 결제시도");
				}
			});
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
}
</script>
<script type="text/javascript">
	function myTourBookInsert() {
		location.href="./myTourBookInsertForm.do";
	}
	$("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
			$(".myTourData").prop("checked",true);
		}else{
			$(".myTourData").prop("checked",false);
		}
	})
	function onChange(){
		var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			if(total == checked){
				$("#checkAll").prop("checked",true);
			}else{
				$("#checkAll").prop("checked",false);
			}
	}	
</script>
<title>MyTourBook 검색</title>
<%@ include file="../common/topMenu.jsp"%>
</head>
<body>
	<div class="container">
<h2>MyTourBook 검색</h2>
		<button type="button" class="btn btn-success" data-toggle="modal" data-target="#write">MyTourBook생성하기</button>
		<input type="text" id="title" name="title" placeholder="제목을 입력해주세요."> 
		<input type="button" onclick="titleseach();" id="titleSeach" value="검색" /> 
		<input type="button" onclick="myTourBookDelete();" id="BookDelete" value="삭제하기" />
		<table class="table table-striped">
			<thead>
				<tr>
					<td>제목</td>
					<td>키워드</td>
					<td>생성날짜</td>
					<td>상세보기</td>
					<td>전체선택하기<input type="checkbox" name="checkAll" id="checkAll" /></td>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:if test="${!empty requestScope.myTourBookList}">
					<c:forEach var="myTourBook" items="${requestScope.myTourBookList}">
						<tr>
							<td>${myTourBook.title}</td>
							<td>${myTourBook.keyword}</td>
							<td>${myTourBook.regdate}</td>
							<td>
								<input type="button" onclick="location.href='./myTourBookDetail.do?bookNo=${myTourBook.bookNo}'" value="상세보기">
								</td>
							<td>
								<input type='checkbox' class='myTourBook' name='check' onchange='onChange()' value="${myTourBook.bookNo}">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div id="write" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">MyTourBook 입력</h4>
					</div>
					<div class="modal-body">
						<form class="form-margin" method="post" id="frmWrite">

							<div class="form-group">
								<label for="title">Title:</label> <input type="text"
									class="form-control" id="name" name="title" required>
							</div>
							<div class="form-group">
								<label for="keyword">Keyword:</label> <input type="text"
									class="form-control" id="keyword" name="keyword" required>
							</div>


							<div class="modal-footer">
								<input type="button" class="btn btn-success" value="새글입력"
									onclick="insert()"> <input type="reset"
									class="btn btn-warning" value="초기화">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	
	<div>
		<button onclick="request_pay()">이용권 구매</button>
	</div>
</body>
</html>