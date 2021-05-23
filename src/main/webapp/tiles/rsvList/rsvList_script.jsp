<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
//=====================variable================================
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

$(document).ready(function(){
	rsvTable;
// 	getRsvList();
// 	$('#rsvTable').DataTable();
});

function selectChange(index) {
	
// 	예약번호 id
// 	var reservationNumberId = "reservationNumber" + index;
// 	예약번호 id로 예약번호 조회
// 	var reservationNumber = $('#'+reservationNumberId).val();
	
	
// 	셀렉트 박스 id 
	var statusId = "status" + index;

// 	데이터테이블 선택자로 바로 조회
	var reservationNumber = rsvTable.cells({ row: index, column: 5 }).data()[0];
// 	셀렉트 박스 id로  셀렉트 박스 값 조회
	var reservationStatus =$('#'+statusId+' option:selected').val();
	
	$.ajax({
        url:"/host/updateRsvStatus.do",
        type:"POST",
        data:{'reservationNumber':reservationNumber,
        		'reservationStatus':reservationStatus},
        dataType:"json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        },success:function(){
        	makeCalendar();
        },error:function(xhr,status,e){
            alert('상태 변경 실패');
        }
    })
	
}

	
function getRsvList() {
	$.ajax({
        type : "POST",
        url : "/host/getRsvList.do",
        datatype : "json",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header, token);
        }, success : function(data){
        	var body = $("#rsvTable > tbody");
            body.empty();
            var bodyHtml = "";
            				
            $.each(data.rsvList, function(index,val) {
            	
            	var selectOption = "<select id='status" + index + "' onchange = 'selectChange("+ index+")'>";
					 				
            	if (val.reservationStatus == 'w') {
					selectOption += " <option value = 'w' selected>대기</option>"+
					 				" <option value = 'c'>확인</option>"+
					 				" <option value = 'r'>거절</option>"+
					 				"</select>";
				}else if (val.reservationStatus =='c') {
					selectOption += " <option value = 'w'>대기</option>"+
					 				" <option value = 'c' selected>확인</option>"+
					 				" <option value = 'r'>거절</option>"+
					 				"</select>";
				}else if (val.reservationStatus =='r') {
					selectOption += " <option value = 'w'>대기</option>"+
					 				" <option value = 'c'>확인</option>"+
					 				" <option value = 'r' selected>거절</option>"+
					 				"</select>";
				}
            	 
            	
            	if (val.endDate == undefined) {
					val.endDate = val.startDate;
				}
                bodyHtml += "<tr>" + 
                                "<td>" + val.productName + "</td>" + 
                                "<td>" + val.rsvctmName + "</td>" + 
                                "<td>" + val.rsvctmTel + "</td>" +
                                "<td>" + val.rsvctmNmpr + "</td>" + 
                                "<td>" + val.startDate + "</td>" + 
                                "<td>" + val.endDate + "</td>" + 
                                "<td>" + selectOption + "</td>" + 
                                "<td style = 'display:none;'> <input type='text' hidden='hidden' id = 'reservationNumber"+index+"' value='" + val.reservationNumber + "'/></td>" + 
                                /* "<td> <input type='button' value='수정' id='UpdateBtn'/></td>" +
                                "<td> <input type='button' value='삭제' id='groupDelBtn'/></td>"  */
                          	"</tr>";    
            });
            body.append(bodyHtml);
        }, error : function(xhr, status, e) {
            alert('Error');
        }
	});
}

function getRsvTableList() {
	rsvTable.ajax.reload();
}

// Dropdown 내용
var dropOptions = [
	"대기",
	"확인",
	"거절"
];


//  데이터테이블 적용
var rsvTable = $('#rsvTable').DataTable({
    	processing: true,
        serverSide: true,
        searching: false,
        info:false,
        lengthChange : false,
        ordering: false,
        pageLength: 10,
        pagingType: 'first_last_numbers',
        scrollX: 1175,
        scrollCollapse:true,
        ajax:{
	    	 type : "POST",
	         url : "/host/getRsvList.do",
	         data : function(d){
// 	        	 	d.srch_regTime = $('#srch_regTime').val() + " " + $('#srch_regTime_time').val();
// 	        	 	d.srch_startDate = $('#srch_startDate').val() + " " + $('#srch_startDate_time').val();
// 	        	 	d.srch_endDate = $('#srch_endDate').val() + " " + $('#srch_endDate_time').val();
	                d.srch_productName = $("#srch_productName").val();
	                d.srch_rsvctmName = $("#srch_rsvctmName").val();
	                d.srch_rsvctmTel = $("#srch_rsvctmTel").val();
	                d.srch_reservationStatus = $("#srch_reservationStatus").val();
	            },
	         async:true,
	         datatype : "json",
	         dataSrc:"data",
	         processData: true,
	         beforeSend : function(xhr){
	             xhr.setRequestHeader(header, token);
	         },error	: function(request, status, error){
	  	        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  		},
	  		complete: function(xhr, status){
	  		}
        },
        columns:[
        	{data: "regTime"},
        	{data: "productName"},
        	{data: "rsvctmName"},
        	{data: "rsvctmTel"},
        	{data: "rsvctmNmpr"},
        	{data: "reservationNumber"},
        	{data: "startDate" },
        	{data: "endDate",
        	 defaultContent : ""},
        	{data: "reservationStatus"  }
        ],
        columnDefs : [
        	{
                targets: [ 5 ],
                visible: false,
                "render":function(data,type,row,meta){
					var html ="<input type='text'  id = 'reservationNumber"+meta.row+"' value='" + data + "'/>";
					return html;
                }
            },
        	{
        		targets: [ 8 ],
            	"render": function(data,type,row,meta){
                	var $select = $("<select id = 'status" + meta.row + "' onchange = 'selectChange("+ meta.row+")'> </select>", {
                        "value": data
                    });
                	$.each(dropOptions, function(key,value){
//                 		옵션 value값 = v
                		var v = "";
                		
                		if (value == "대기") {
							v = "w";
						}else if (value == "확인") {
							v = "c";
						}else if (value == "거절") {
							v = "r";
						}
//                 		보여지는 텍스트는 value, 값은 v
                    	var $option = $("<option></option>", {
                        	"text": value,
                        	"value" : v 
							
                        });
                        if(data === v){
                        	$option.attr("selected", "selected")
                        }
                    	$select.append($option);
                    });
                    return $select.prop("outerHTML");
                }
            }
        	
        ],
        language: {
            "emptyTable": "조회결과가 없습니다.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "에서 검색: ",
            "zeroRecords": "일치하는 데이터가 없습니다.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        }
        
    });
    







//풀캘린더 적용
document.addEventListener('DOMContentLoaded', function() {
  makeCalendar();
});

function makeCalendar() {
	
	$('#calendar').empty(); 
	
	var calendarEl = document.getElementById('calendar');
	
	
  	var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	    },
// 	       시간 형식
// 		timeFormat:{
// 			timeFormat: 'h:mm',
// 			agenda:'HH:mm{ - HH:mm}'
// 		},
// 		axisFormat: 'tt hh',// 주간 월간
	    navLinks: true, // can click day/week names to navigate views
	    businessHours: true, // display business hours
	    editable: false,
	    events:function(info, successCallback, failureCallback){
	        $.ajax({
	       		type : "POST",
	            url: '/host/getAllRsvList.do',
	            dataType: 'json',
	            beforeSend : function(xhr){
	                xhr.setRequestHeader(header, token);
	            },success: function(data) {
	           	   var events = [];
					
	               if(data!=null){
		                         
	                   $.each(data.data, function(index, element) {
	                	   
							var endDate=element.endDate;
								
							if(endDate==undefined){
							     endDate=element.startDate;
							}
							var startDate = element.startDate;
//	 						var endDate = moment(endDate).format('YYYY-MM-DD hh:mm:ss');
	                        
	                        if(element.reservationStatus =='c'){
	                        	events.push({
	    							title: element.productName,
	    							start: startDate,
	    							end: endDate,
	    							/* url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq, */
	    							color:"#8888a3"                                                   
	    						}); //.push()
	                        }
	           			});//each end                           
	               	successCallback(events);                               
	           		}//if end
	           }, error : function(xhr, status, e) {
	        		console.log("xhr: "+ xhr +"\n status: "+ status +"\n e: "+ e);

		        }
		}); //ajax end
		
	    },//events:function end
		
	    //시간 포멧 설정
	    eventTimeFormat: { // like '14:30:00'
	        meridiem: true,
	        hour: '2-digit',
	        minute: '2-digit'
	      }
	    
	 });

	  calendar.render();
}



function enter(e){
	 if (e.keyCode == 13) {
		fn_search();
	 }	
}


function fn_search(){
	rsvTable.ajax.reload();
}

function chk_date(date,time) {
	if (time!='' || time != null) {
		if (date==''|| date != null) {
			return false;
		}
	}
}

</script>