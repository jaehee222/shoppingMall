$(document).ready(function(){        
    OrderView();
});
    
	//주문 목록 이동
	function goBbsList(){       
		location.href = "/order/orderBbs?orderNum=1";
	}
	
	//주문 수정 이동
	function goBbsUpdate(){
		var bbsID = $("#orderID").val();
		location.href = "/bbs/bbsUpdate?orderID="+orderID;
	}
	
	//게시판 뷰
	function OrderView(){
		var orderID = $("#orderID").val();
		if(orderID!=0){
			$.ajax({    
	  
	            url     : "/order/OrderView",
	            data    : $("#orderForm").serialize(),
	            dataType: "JSON",
	            cache   : false,
	            async   : true,
	            type    : "POST",    
	            success : function(obj) {
	                OrderViewCallback(obj);                
	            },           
	            error     : function(xhr, status, error) {}
	            
	         });
	    } else {
	        alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}
	}
	
	   function OrderViewCallback(obj){
		   
	        var list = obj;
	        var listLen = obj.length;
	        var totalPrice = 0;
	        var str1 = "";
	        var str2 = "";
	        
	        if(listLen >  0){
	        	
	            for(var a=0; a<listLen; a++){
	            	
	            	var bbsID = list[a].bbsID;
	            	var title = list[a].title;
	            	var price = list[a].price;
	            	var amount = list[a].amount;
	            		
			        var filePath = "http://localhost:8080/resources/bbsImg/"+bbsID+"/"+bbsID+".jpg";

	            	str1 += "<tr>";
	                str1 += "<td><a href=\"/bbs/bbsView?bbsID="+bbsID+"&comCategory=1&commentNum=1\"><img src=\""+filePath+"\" onerror=\"this.src='http://placehold.it/700x400'\" width=\"80\" height=\"80\" alt=\"\"/></a></td>";
	                str1 += "<td colspan=2><a href=\"/bbs/bbsView?bbsID="+bbsID+"&comCategory=1&commentNum=1\"><br>"+title+"</a></td>";
	                str1 += "<td><br>"+price+"원</td>";
	                str1 += "<td><br>"+amount+"</td>";
	                str1 += "</tr>";
	                
	                totalPrice += (price*amount);
	            }	  
	            
		            var orderName = list[0].orderName;
		        	var addr1 = list[0].addr1;
		        	var addr2 = list[0].addr2;
		        	var addr3 = list[0].addr3;
		        	var phoneNumber = list[0].phoneNumber;
		        	var orderMemo = list[0].orderMemo;
		        	var delivery = list[0].delivery;
		        	
		        	str2 += "<tr>";
		        	str2 += "<td>"+orderName+"</td>";
		        	str2 += "<td>"+phoneNumber+"</td>";
		        	str2 += "<td>"+addr1+"</td>";
		        	str2 += "<td>"+addr2+", "+addr3+"</td>";
		        	str2 += "<td>"+orderMemo+"</td>";
		        	str2 += "</tr>";
		        	str2 += "<tr>";
		        	str2 += "<td colspan=5><br>총 가격 : "+totalPrice+"</td>";
		        	str2 += "</tr>";
		        	str2 += "<tr><td colspan=5><br><h3>현재 상태 : "+delivery+"</td></tr>";
		        	str2 += "<input type=\"hidden\" id=\"delivery\" name=\"delivery\" value="+delivery+">";
		        	
	        } else {
	            
	            alert("등록된 글이 존재하지 않습니다.");
	            return;
	        }        
	        
	        $("#tstr1").html(str1);
	        $("#tstr2").html(str2);
	   }
	   
	   function OrderDelete(){
				       
	       var yn = confirm("주문취소 하시겠습니까?");        
	       
	       if(yn){
	           
	           $.ajax({    
	               
	               url        : "/order/OrderDelete",
	               data    : $("#orderID").serialize(),
	               dataType: "JSON",
	               cache   : false,
	               async   : true,
	               type    : "POST",    
	               success : function(obj) {
	                   OrderDeleteCallback(obj);                
	               },           
	               error     : function(xhr, status, error) {}
	               
	            });
	       }        
	   }
	   
	   function OrderDeleteCallback(obj){
	   
	       if(obj != null){        
	           
	           var result = obj.result;
	           
	           if(result == "SUCCESS"){                
	               alert("주문취소를 성공하였습니다.");                
	               location.href="/bbs/home";
	           } else {                
	               alert("취소는 상품준비중일 때만 가능합니다♥\n고객센터로 연락해주세요:)");    
	               return;
	           }
	       }
	   }
	   
	   function OrderUpdate(delivery){
		 if(delivery=="상품준비중"){
			 location.href = "/order/orderUpdate?orderID="+$("#orderID").val();
		 }else{
			 alert("배송지 수정은 상품 준비중일 때만 가능합니다♥\n고객센터로 연락해주세요:)");
		 }
	   }