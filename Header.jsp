<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- skipnavigation -->
<div id="skipnavigation">
	<ul>
		<li><a href="#container_wrap">본문 바로가기</a></li>
		<li><a href="#header">주요메뉴 바로가기</a></li>
	</ul>
</div>
<!-- //skipnavigation -->
<hr />
<!-- header_wrap -->
<div id="header_wrap">
	<!-- header -->
	<div id="header" class="header clearfix">
		<h1><a href="#none"><img src="/def/img/common/img_logo-rcms.png" alt="kt is call frame center" /></a></h1>
		<!-- cti_wrap -->
		<!-- 20210112 cti log add -->
		<div id="divCtiLogInfo" style="position:absolute; top:160px; left:10px; width:600px; height:500px; z-index:9999; text-align:left; background-color:#fff; border:1px solid #d30810; overflow:auto; display:none;">
		</div>
		<a href="#none" style="position: absolute;top:10px; left: 88px;" onclick="divCtiLogInfoShow()" class="btn_info">&nbsp;&nbsp;</a>
		<a href="#none" style="position: absolute;top:10px; left: 221px;" onclick="javascript:document.getElementById('divCtiLogInfo').innerHTML='';" class="btn_info">&nbsp;</a>
		<div class="cti_wrap clearfix" <c:if test="${siteProduct eq 'ONLINE'}"> style="display:none;" </c:if>>
			<!-- CTI 상태 -->
			<div class="cti_stat_box">
				<p class="title">CTI 상태</p>
				<p class="cont"><span id="ctiStats">OFF</span>&nbsp;<span id="ctiTime">00:00:00</span></p>
			</div>
			<!-- //CTI 상태 -->
			<!-- CTI 상태 버튼 -->
			<div id="cti_stat_mn" class="cti_stat_mn">
				<h2 class="hidden">CTI 상태 버튼</h2>
				<ul class="tab clearfix">
					<!-- 클래스 on 추가시 버튼 활성화-->
					<li id="ctiBtnOn0" class="on" onclick="btnCtiOn_onClick();">ON</li>
					<li id="ctiBtnOff0" class="on" style="display:none" onclick="btnCtiOff_onClick();">OFF</li>
					<li id="ctiBtnOn1" class="on" style="display:none" onclick="btnReady_onClick();">대기</li>
					<li id="ctiBtnOff1" style="display:">대기</li>
					<li id="ctiBtnOn2" class="on" style="display:none" onclick="btnAbsent_onClick();">이석</li>
					<li id="ctiBtnOff2" style="display:">이석</li>
					<li id="ctiBtnOn3" class="on" style="display:none" onclick="btnHold_onClick();">보류</li>
					<li id="ctiBtnOff3" style="display:">보류</li>
					<li id="ctiBtnOn4" class="on" style="display:none" onclick="btnRetrieve_onClick();">해제</li>
					<li id="ctiBtnOff4" style="display:">해제</li>
					<li id="ctiBtnOn5" class="on" style="display:none" onclick="btnConsult_onClick();">호전환</li>
					<!-- <li id="ctiBtnOff5" style="display:" onclick="$('#ctiConsultPop').show();">호전환</li> -->
					<li id="ctiBtnOff5" style="display:">호전환</li>
					<li id="ctiBtnOn6" class="on" style="display:none" onclick="btnMakeCall_onClick();">걸기</li>
					<li id="ctiBtnOff6" style="display:">걸기</li>
					<li id="ctiBtnOn7" class="on" style="display:none" onclick="btnRelease_onClick();">끊기</li>
					<li id="ctiBtnOff7" style="display:">끊기</li>
					<li id="ctiBtnOn8" class="on" style="display:none" onclick="popUpKeyPad();">키패드</li>
					<li id="ctiBtnOff8" style="display:">키패드</li>
				</ul>
			</div>
			<!-- //CTI 상태 버튼 -->
			
			<div class="popup_wrap layer_popup" >
				<!-- 이석 팝업 -->
				<div class="popup_absent pop_cti popup" id="ctiAbsentPop" style="display:none;">
					<div class="title">
						<h5>이석</h5>
					</div>
					<div class="cont_box">
					    <div class="select_wrap">
							<select type="text" id="ctiAbsentResn" name="ctiAbsentResn" class="select_ot">
								<option value="2">자리비움</option>
								<option value="5">식사중</option>
								<option value="6">교육중</option>
								<option value="15">회의중</option>
								<option value="16">작업중</option>
								<option value="17">기타</option>
							</select>
						</div>
						<div class="info_btn_box">
							<a href="#none" class="info_btn_save" onclick="selectAbsent()">확인</a>
							<a href="#none" class="info_btn" onclick="closeCtiAbsentPop()">취소</a>
						</div>					
					</div>
					<a href="#none" class="btn_close" onclick="closeCtiAbsentPop()"><img src="/def/img/contents/btn_popup_close.gif" alt="팝업닫기" /></a>
				</div>
				<!-- //이석 팝업 -->
			</div>
			
			<div class="popup_wrap layer_popup fxpis_ctiMakeCall" >
				<!-- 전화걸기 팝업 -->
				<div class="popup_makecall pop_cti popup" id="ctiMakeCallPop" style="display:none;">
					<div class="title">
						<h5>전화걸기</h5>
					</div>
					<div class="cont_box">
						<label class="mb5">전화 번호를 입력하세요.</label>
						<input type="text" id="telNoMakeCall" name="telNoMakeCall" class="inp_type" autofocus onkeypress="Site.Util.checkEnterKey('makeCallEnter()')"/>
						<div class="info_btn_box">
							<a href="#none" class="info_btn_save" onclick="makeCall($('#telNoMakeCall').val())">걸기</a>
							<a href="#none" class="info_btn" onclick="getRedialNo()">재다이얼</a>
						</div>
					</div>
					<a href="#none" class="btn_close" onclick="closeCtiMakeCallPop()"><img src="/def/img/contents/btn_popup_close.gif" alt="팝업닫기" /></a>
				</div>
				<!-- //전화걸기 팝업 -->
			</div>
			
			<div class="popup_wrap layer_popup fxpis_ctiId">
				<!-- 호전환 팝업 -->
				<div class="popup_consult pop_cti popup" id="ctiConsultPop">
					<input type="hidden" id="ctiIdConsult" name="ctiIdConsult" />
					<div class="title">
						<h5>호전환</h5>
					</div>
					<div class="cont_box clearfix">
						<div id="divJq_consultPop" class="fl" style="width:400px;height:200px;overflow: scroll;">
							<table id="tbJq_consultPop"></table>
						</div>
						<div class="fr">
							<label for="" class="mb5">연결전화번호</label>
							<input type="text" id="telNoConsult" name="telNoConsult" class="inp_type mr15" />
							<div class="radio">
								<label class="control control_radio"><input type="radio" id="tranDiv" name="tranDiv" value="blind" onclick="clickTranDiv()"/>호전환<div class="control_indicator"></div></label>
								<label class="control control_radio"><input type="radio" id="tranDiv" name="tranDiv" value="attended" onclick="clickTranDiv()" checked/>호전환(협의)<div class="control_indicator"></div></label>
							</div>
							<div class="info_btn_box">
								<a href="#none" id="btnTransferBlindOn" name="btnTransferBlindOn" style="display:none"  class="info_btn org" onclick="transfer('blind')">호전환</a>
								<a href="#none" id="btnTransferBlindOff" name="btnTransferBlindOff" style="display:" class="info_btn org disable" >호전환</a>
								<a href="#none" id="btnTransferAttendedOn" name="btnTransferAttendedOn" style="display:" class="info_btn org" onclick="transfer('attended')">협의연결</a>
								<a href="#none" id="btnTransferAttendedOff" name="btnTransferAttendedOff" style="display:none"  class="info_btn org disable">협의연결</a>
								<a href="#none" id="btnTransferOn" name="btnTransferOn" style="display:none"  class="info_btn org" onclick="CTI_HangupCall()">협의전달</a>
								<a href="#none" id="btnTransferOff" name="btnTransferOff" style="display:" class="info_btn org disable" >협의전달</a>
								<a href="#none" id="btnTransferCancelOn" name="btnTransferCancelOn" style="display:none"  class="info_btn org" onclick="CTI_TransferCancel()">협의회수</a>
								<a href="#none" id="btnTransferCancelOff" name="btnTransferCancelOff" style="display:" class="info_btn org disable">협의회수</a>
							</div>
							
						</div>
						<div class="ser_box_n section" style="display:none;">
							<div class="info_btn_box">
								<a href="#none" class="info_btn" onclick="btn_ARSConference('ARS_01')" style="width:100px;background:#ef3c48;">단기ARS</a>
							</div>
						</div>
					</div>
					<a href="#none" class="btn_close" onclick="closeCtiConsultPop()"><img src="def/img/contents/btn_popup_close.gif" alt="팝업닫기" /></a>
				</div>
				<!-- //호전환 팝업 -->
			</div>
			
			<div class="popup_wrap layer_popup fx_ctikey">
				<!-- 키패드 팝업 -->
				<div class="popup_makecall pop_cti popup keypadWrap" id="ctiKeyPadPop" style="display:none;">
					<div class="title">
						<h5>키패드</h5>
					</div>
					<div class="cont_box">
						<div class="keypad">
							<table>
								<tr>
									<td><span id="keypad_1" onclick="CTI_keyPad_onClick('1')">1</span></td>
									<td><span id="keypad_2" onclick="CTI_keyPad_onClick('2')">2</span></td>
									<td><span id="keypad_3" onclick="CTI_keyPad_onClick('3')">3</span></td>
								</tr>
								<tr>
									<td><span id="keypad_4" onclick="CTI_keyPad_onClick('4')">4</span></td>
									<td><span id="keypad_5" onclick="CTI_keyPad_onClick('5')">5</span></td>
									<td><span id="keypad_6" onclick="CTI_keyPad_onClick('6')">6</span></td>
								</tr>            		
								<tr>
									<td><span id="keypad_7" onclick="CTI_keyPad_onClick('7')">7</span></td>
									<td><span id="keypad_8" onclick="CTI_keyPad_onClick('8')">8</span></td>
									<td><span id="keypad_9" onclick="CTI_keyPad_onClick('9')">9</span></td>
								</tr>
								<tr>
									<td><span id="keypad_etc1" onclick="CTI_keyPad_onClick('*')">*</span></td>
									<td><span id="keypad_0" onclick="CTI_keyPad_onClick('0')">0</span></td>
									<td><span id="keypad_etc2" onclick="CTI_keyPad_onClick('#')">#</span></td>
								</tr>
							</table>
						</div>
					</div>
					<a href="#none" class="btn_close" onclick="closeCtiKeyPadPop()"><img src="/def/img/contents/btn_popup_close.gif" alt="팝업닫기" /></a>
				</div>
				<!-- //키패드 팝업 -->
			</div>
		</div>
		<!--// cti_wrap -->
		<!-- ONLINE_wrap -->
		<div class="cti_wrap clearfix" <c:if test="${siteProduct ne 'ONLINE'}"> style="display:none;" </c:if>>
			<!-- ONLINE 상담 컨텐츠 추가 예정 -->
		</div>
		<!--// ONLINE_wrap -->
<!-- cti_script -->		
<script type="text/javascript">
// CTI REC정보 셋팅 
top.gsCTIServerIp = "${CTIServerIp}";
top.gsCTIServerPort = "${CTIServerPort}";
top.gsCTIAutoLogin = "${CTIAutoLogin}";
top.gsCTIOutCallTno = "${CTIOutCallTno}";
top.gsCTIOutCallUserTno = "${userSession.genrUserVO.tel }";
top.gsRECServerIp = "${RECServerIp}";
top.gsRECServerPort = "${RECServerPort}";
top.gsRECServerPath = "${RECServerPath}";
/* if("${userSession.genrUserVO.userId }" =="user20")
	top.ctiInit("", "8002");
else
	top.ctiInit("", "8000");  */
top.ctiInit("${userSession.genrUserVO.userId }", "${userSession.genrUserVO.lxtnTelNo }", "${userSession.genrUserVO.phoneKndCd }");
	
top.goServerDate = Site.Util.date.parse("${ServerDate}");				//서버 시간 Date
	
var oConsultPopJqGrid;	//호전환팝업 jqgrid obj

$(function() {

	//호전환팝업 Grid
	jQuery("#tbJq_consultPop").jqGrid({
		datatype: "local",
		mtype: "POST",
		loadBeforeSend: function(jqXHR)  { jqXHR.setRequestHeader("ajax", "true"); },		//그리드 조회 ajax 표기 
	   	colNames:['상담사ID','상담사명','내선번호','상태','상태코드'],
	   	colModel:[
	   		{name:'userId', width:80, align:"center", sorttype:'text', hidden:true},
	   		{name:'userNm', width:80, align:"center", sorttype:'text'},
	   		{name:'lxtnTelNo', width:80, align:"center", sorttype:'text'},
	   		{name:'statusNm', width:80, align:"center", sorttype:'text'},
	   		{name:'statusCd', width:50, align:"center", sorttype:'text', hidden:true}
	   	],
	   	rowNum:9999,		//페이지당 rowNum
//	   	rowList:[50,100,200],
//	   	pager: "#divJqPg_consultPop",
	   	viewrecords: true,	// 페이저 우측에 레코드조회 상태 출력
//		rownumbers: true,	// 라인별 왼쪽에 시리얼번호 생성
		gridview: true,		//그리드 속도개선(treeGrid, subGrid, afterInsertRow 필요시 false)
	    height: "130px",
		autowidth: true,		//true로 설정하면 모눈 너비가 부모 요소의 너비에 자동으로 다시 계산됩니다. 그리드가 생성 될 때만 초기에 수행됩니다. 상위 요소가 너비를 변경할 때 격자 크기를 조정하려면 맞춤 코드를 적용 setGridWidth하고이 목적으로이 방법을 사용해야합니다
		ignoreCase: true,	// 정렬/검새시 대/소문자 무시
		jsonReader: {
	         root: "data", // 실제 jqgrid에서 뿌려져야할 데이터들이 있는, json 키값.
	         page: "page", // 현재 페이지 정보.
	         total: "total", // 전체 페이지 개수.
	         records: "records", // 전체 데이터 갯수를 지칭하는 태그를 지칭.
	         repeatitems: false,// json key와 value를 사용하기 위함.
	         cell: "cell",
	         id: ""

		},
		onSelectRow:function(rowid,status,e){onSelectRow_consultPop(this.id,rowid,status);},
		onSortCol:function(index,iCol,sortorder){
			return Site.Cmmn.onSortCol_jqGrid(this,index,iCol,sortorder);
		},
		loadError:function(){Site.Cmmn.showMsgAlarm("E","","result.seletFail","");}
	});
	oConsultPopJqGrid = $("#tbJq_consultPop");

	closeCtiConsultPop();
	
	//상담예약 달력
	$('#resveDate').datetimepicker({
		showOn: "both",
		dateFormat: "yy-mm-dd",
		timeInput: true,
		timeFormat: "HH:mm",
		changeYear: true,
		changeMonth: true,		
		buttonImage: "/def/img/contents/icon_calendar.png",
		buttonImageOnly: true,
		showButtonPanel: true,
		closeText: "닫기"		
	}).next('img').css('vertical-align', 'middle').css('margin-left','5px');
	
	//전화번호 숫자만 입력처리
	$('#Itel').keyup(function() {$(this).val($(this).val().replace(/[^0-9]/g,"")); });			
});


function makeCallEnter(){
	makeCall($('#telNoMakeCall').val());
}

function onSelectRow_consultPop(id,rowid,status){
	if(oConsultPopJqGrid.jqGrid("getCell",rowid,"statusCd") == "1")
	{
		$("#telNoConsult").val(oConsultPopJqGrid.jqGrid("getCell",rowid,"lxtnTelNo"));
		$("#ctiIdConsult").val(oConsultPopJqGrid.jqGrid("getCell",rowid,"userId"));
	}else{
		Site.Cmmn.showMsgAlarm("E","대기 상담사만 선택 가능 합니다.","","");
		return;
	}
}

//업무예약등록form
function resveInsert(){	
	$("#resvePop").css({'top':'-90px','left':'81%'}) 
	$("#resvePop").show();
	$( ".message_btn" ).click(function() {
		  $( ".resvePop" ).toggle();
	});
}

//업무예약취소
function resveCancel(){
	$("#resveSn").val("");
	$("#resveCn").val("");
	$("#resveDate").val("");
	$("#resvePop").hide();
}

//업무예약저장
function resveSave(){	
	if($("#resveDate").val() == ""){
		Site.Cmmn.showMsgAlarm("E","예약일시는 필수입니다.","","");
		$("#resveDate").focus();
		return;
	}
	
	var params = {};
	params["resveCn"] = $("#resveCn").val();
	params["resveDate"] = Site.Util.getNumber($("#resveDate").val());	
	params["resveSn"] = $("#resveSn").val();
	
	Site.actionAjax("/job/JobRsWorkMng/insert.do", params, function(ajaxData){ 
		var data = ajaxData.data;
		if(data.iSuccessCnt != 1){
			Site.Cmmn.showMsgAlarm("E","저장 중 오류가 발생하였습니다.","","");
			return;
		}		
		Site.Cmmn.showMsgAlarm("E","저장되었습니다.","","");
		$("#resveCn").val("");
		$("#resveDate").val("");
		$("#resvePop").hide();
	});
}

//비밀번호 변경 열기
function editPassWord(){
	$('#IuserPw').val("");
	$('#InewUserPw').val("");
	$('#IreUserPw').val("");
	$("#changePasswd").show();
}

//비밀번호 변경 닫기
function cancelPassWord(){
	$('#IuserPw').val("");
	$('#InewUserPw').val("");
	$('#IreUserPw').val("");
	$("#changePasswd").hide();
}

//비밀번호 저장
function savePassWord(){
	var $InewUserPw = $('#InewUserPw');
	var InewUserPw = $('#InewUserPw').val().replace(/\\s/, '');
	
	var $IreUserPw = $('#IreUserPw');
	var IreUserPw = $('#IreUserPw').val().replace(/\\s/, '');
	
	if($("#IuserPw").val() != "" || $("#InewUserPw").val() != "" || $("#IreUserPw").val() != ""){		
		var fResult = checkPasswd();								
		if(fResult == undefined){
			return false;
		}
		if(fResult.isAvail != 'true'){
			Site.Cmmn.showMsgAlarm("E","현재 비밀번호가 일치하지 않습니다.","","");
			$("#IuserPw").focus();
			return false;
		}
		
		if(InewUserPw != IreUserPw){
			Site.Cmmn.showMsgAlarm("E","비밀번호와 비밀번호확인 정보가 일치하지 않습니다.","","");
			$($IreUserPw).focus();
			return false;
		}
		
		if(InewUserPw == $("#IuserPw").val()){
			Site.Cmmn.showMsgAlarm("E","새 비밀번호는 현재 비밀번호가 달라야 합니다.","","");
			$($IreUserPw).focus();
			return false;
		}
		
		//유효성 체크
		var passed = validatePassword(InewUserPw, {
		 length:   [8, Infinity],
		 alpha:    1,
		 numeric:  1,
		 special:  1,
		 badWords: ["password"],
		 badSequenceLength: 4
		});
		
		if(!passed){
			Site.Cmmn.showMsgAlarm("E","비밀번호는 반복되거나, 연속된 문자나 숫자는 쓸 수 없으며, 최소 8자리 이상, 대문자나 소문자, 숫자, 특수문자 조합으로 입력하세요.","","");
			$($InewUserPw).focus();
			return false;
		}
		
	}else{
		Site.Cmmn.showMsgAlarm("E","비밀번호를 입력하세요.","","");
		$("#IuserPw").focus();
		return false;
	}
	
	var params = {};
	params["userPw"] = $('#InewUserPw').val().replace(/\\s/, '');
	params["userId"] = $("#IuserId").val();	
	params["ctmmnyCode"] = $("#IctmmnyCode").val();
	
	Site.actionAjax("/user/genr/updateUserPw.do", params, function(ajaxData){ 
		if(ajaxData.isAvail == 'true'){
			Site.Cmmn.showMsgAlarm("E","비밀번호가 수정되었습니다.","","");
			cancelPassWord();
		}else{
			Site.Cmmn.showMsgAlarm("E","","result.fail","");
		}
	});
}

//개인정보설정 닫기
function infoCancel(){
	$("#editinfo").hide();
}

//개인정보설정 변경
function editInfo(){
 	var params = {};

 	Site.actionAjax("/main/popInfoData.do", params, function(ajaxData){
		
		var data = ajaxData.data;
		
		if(data.userId == null){
			Site.Cmmn.showMsgAlarm("E","조회된 데이터가 없습니다.","","");
			return;
		}else{
			$("#IuserNm").val(data.userNm+"("+data.userId+")");			
			$("#IaddrDetail").val(data.addr1);
			$("#Itel").val(Site.Format.telMask(data.tel));
			$("#IuserId").val(data.userId);
			$("#IctmmnyCode").val(data.ctmmnyCode);
			$("#IphoneKndCd").val(data.phoneKndCd);
			 
			$("#editinfo").show();			
		}		
	},"","N"); 
 }

//비밀번호 체크
function checkPasswd(){
	var _result;
	var pw=$("#IuserPw").val();
	var enc=btoa(pw);
	
	$.ajax({
		url : '/user/genr/checkLoginInfo.do' 
        ,method : "post"
		,dataType : 'json'
		,async: false
		,data : {
			userId:"${userSession.genrUserVO.userId }"
	    	,userPw:enc
			,ctmmnyCode:"${userSession.genrUserVO.ctmmnyCode }"
		}
		,success : function(result, stat, xhr) {			
			_result = result;
		}
	    ,error : function(xhr, stat, err) {
	    	console.log(err);
	    }
	});
	return _result;
}

//비밀번호 90일 변경 체크
function pwChgDtCheck(){
	var paramsLogin = {
			cmd : "login",
			userId : "${userSession.genrUserVO.userId}",
			ctmmnyCode : "${userSession.genrUserVO.ctmmnyCode}"
	}
	
	Site.actionAjax("/user/genr/checkPwChgDt.do", paramsLogin, function(ajaxData){
		if(ajaxData.msg!=null){
			Site.Cmmn.showMsgAlarm("E",ajaxData.msg,"","");
			
		}
	});
}

//개인정보 설정 저장
function infoSave(){
	
	if($("#IphoneKndCd").val() == ""){
		Site.Cmmn.showMsgAlarm("E","전화기종류를 선택하세요.","","");
		$("#IphoneKndCd").focus();
		return;
	}

	//설정저장
	var params = {};	
	params["userId"] = $("#IuserId").val();	
	params["ctmmnyCode"] = $("#IctmmnyCode").val();
	params["tel"] = Site.Util.replaceAll($("#Itel").val(),"-","");
	params["addr1"] = $("#IaddrDetail").val();
	params["phoneKndCd"] = $("#IphoneKndCd").val();
	
 	Site.actionAjax("/user/genr/updateUserInfo.do", params, function(ajaxData){ 
		if(ajaxData.isAvail == 'true'){
			Site.Cmmn.showMsgAlarm("E","개인정보가 수정되었습니다.","","");
			
			top.gsCTIOutCallUserTno = params["tel"];
			top.gsDeviceType = params["phoneKndCd"];
			
			infoCancel();
		}			
	});
	
	//비밀번호변경
/* 	$(function(){
		$('.password .ps_btn').click(function(){
			$('.ps_w').show();
		});
		$('.ps_w .btn_close').click(function(){
			$('.ps_w').hide();
		});
		
	}); */
	
}

//divCtiLogInfoShow용
function divCtiLogInfoShow()
{
	if($('#divCtiLogInfo').css("display")=="none")
		$('#divCtiLogInfo').css("display","");
	else
		$('#divCtiLogInfo').css("display","none");
}

//화면 닫기
function winclose(){
	location.href = "/user/genr/logout.do";
}
//$(window).bind("beforeunload", function (e){ 는 Footer.jsp에 있습니다.

</script>


<!--// cti_script -->	
		<!-- user_menu_wrap -->
		<div class="user_menu_wrap clearfix">
			<p class="login_info"><span class="name">${userSession.genrUserVO.userNm }</span> <span class="data">(${userSession.genrUserVO.lastLoginDt })</span></p>
			<span class="user_menu">
				<button href="#none" onClick="onMessengerPopupOpen();" id="iconChat"><label id="iconChatText">0</label></button><!-- 채팅 화면 Open -->
				<a href="#none" onclick="resveInsert();" class="message_btn" title="알림"><img src="/def/img/common/icon_message.png" alt="알림" title="알림"></a>
				<a href="#none" onclick="editInfo();" title="개인설정"><img src="/def/img/common/icon_set.png" alt="개인설정"  title="개인설정"></a>
				<a href="#none" onclick="winclose();" title="로그아웃"><img src="/def/img/common/icon_logout.png" alt="로그아웃" title="로그아웃"></a>
			</span>
			<div class="t_menu_wrap" id="lnb">
				<a class="t_menu" href="#"><span></span></a>
				<ul id="divMenu" class="menu_wrap clearfix"><!-- 1열 최대 6개노출 -->
 					<!-- 이곳에 메뉴가 만들어집니다 -->
				</ul>
			</div>
			<!--// t_menu_wrap-->
			
		<!-- 업무예약 등록 div form -->
		<form:form  id="defaultForm" name="defaultForm" >
			<input type="hidden" id="ctmmnyCode" name="ctmmnyCode" />
			<input type="hidden" id="resveSn" name="resveSn" />			
			<div id="resvePop" name="resvePop" class="popup_wrap resvePop" style="display: none;">
				<div class="popup_search">
					<div class="title">
						<h5>업무예약</h5>
					</div>
					<div class="cont_box">
						<dl>
							<dt>
								<label for="">예약일시</label>
							</dt>
							<dd class="booking mdt_y clearfix">
								<input type="text" id="resveDate" name="resveDate" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${toDay}" />" class="inp_type" maxlength="16" />																
							</dd>
						</dl>
						<dl class="fl_text_box">
							<dt>
								<label for="">예약내용</label>
							</dt>
							<dd>
								<textarea type="text" id="resveCn" name="resveCn" class="inp_type" style="height: 100px;"></textarea>
							</dd>
						</dl>
						<div class="info_btn_box">
							<a href="#none" id ="insertForm" name="insertForm" onclick="resveSave();" class="info_btn_save">저장</a>
							<a href="#none" onclick="resveCancel();" class="info_btn">취소</a>
						</div>
					</div>
					<a href="#none" onclick="resveCancel();" class="btn_close"><img src="/def/img/contents/btn_cls.png" alt="팝업닫기" /></a>
				</div>
			</div>
		</form:form>
		<!-- 업무예약 등록 div form -->	
	
		</div>
		<!--// user_menu_wrap -->
	</div>
	
	<!-- //header -->
</div>
<!-- //header_wrap -->
<hr />

<hr />
<!--계정 기본정보 popup-->
<form:form id="infoForm" name="infoForm" >
<input type="hidden" id="IctmmnyCode" name="IctmmnyCode" />
<input type="hidden" id="IuserId" name="IuserId" />
<div  id="editinfo" name="editinfo" class="layer_popup editinfo" style="display: none;" >
	<div class="popup editinfo">
		<div class="title">
			<h5>계정 기본정보</h5>
		</div>
		<div class="cont_box">
			<dl>
				<dt>
					<label for="">성명</label>
				</dt>
				<dd>
					<input type="text" id="IuserNm" name="IuserNm" class="inp_type readonly" value="${userSession.genrUserVO.userNm }" readonly=readonly>
				</dd>
				</dl>
			<dl>
				<dt>
					<label for="">발신전화</label>
				</dt>
				<dd>
					<input type="tel" id="Itel" name="Itel" class="validate[maxSize[15],custom[integer]] inp_type" numberonly="true">
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="">전화기</label>
				</dt>
				<dd>
					<div class="select_wrap">
						<select type="select" id="IphoneKndCd" name="IphoneKndCd" class="select_ot essn">
							<option value="">선택</option>
								<c:forEach var="item" items="${mngrCodeDataList.PHONE_KND_CD}">
									<option value="${item.codeId}">${item.codeNm }</option>							
								</c:forEach>
						</select>
					</div>
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="">주소</label>
				</dt>
				<dd>
					<input type="text" id="IaddrDetail" name="IaddrDetail" class="validate[maxSize[100]] inp_type"  value="" >
				</dd>
			</dl>
			<p class="password">	
				<span>비밀번호</span>
				<a href="#none" onclick="editPassWord();" class="ps_btn">변경하기</a>
			</p>		
			<div class="info_btn_box">
				<a href="#none" onclick="infoSave();" class="info_btn_save">수정</a>
				<a href="#none" onclick="infoCancel();" class="info_btn">취소</a>
			</div>
		</div>
		<a href="#none" onclick="infoCancel();" class="btn_close"><img src="/def/img/contents/btn_popup_close.gif" alt="팝업닫기"></a>
	</div>
</div>
</form:form>
<!--//계정 기본정보 popup-->

<!-- 비밀번호 변경 팝업-->
<div id="changePasswd" name="changePasswd" class="layer_popup ps_w" style="display: none;" >
	<div class="popup editinfo">
		<div class="title">
			<h5>비밀번호 변경</h5>
		</div>
		<div class="cont_box">
			<dl>
				<dt><label for="">현재 비밀번호</label></dt>
				<dd><input type="password" id="IuserPw" name="IuserPw" class="validate[minSize[6],maxSize[20]] inp_type" ></dd>
			</dl>
			<dl>
				<dt><label for="">새 비밀번호</label></dt>
				<dd><input type="password" id="InewUserPw" name="InewUserPw" class="validate[minSize[6],maxSize[20]] inp_type"></dd>
			</dl>
			<dl>
				<dt><label for="">새 비밀번호 확인</label></dt>
				<dd><input type="password" id="IreUserPw" name="IreUserPw" class="validate[minSize[6],maxSize[20]] inp_type"></dd>
			</dl>
			<div class="info_btn_box">
				<a href="#none" onclick="savePassWord();" class="info_btn_save">수정</a>
				<a href="#none" onclick="cancelPassWord();" class="info_btn">취소</a>
			</div>
		</div>
		<a href="#none" onclick="cancelPassWord();" class="btn_close"><img src="/def/img/contents/btn_popup_close.gif" alt="팝업닫기"></a>
	</div>
</div>
<!--// 비밀번호 변경 팝업  -->

<script type="text/javascript" src="<c:out value='/def/js/site.menu.js' />"></script>
<script type="text/javascript" >
	// lnb
	$('.t_menu').hover(function(){
		$(this).addClass('on') }, function(){
		$(this).removeClass('on') 
	});
	$('.menu_wrap').hover(function(){
		$('.t_menu').addClass('on') }, function(){
		$('.t_menu').removeClass('on') 
	});
	// Hover dropdown
	$('.t_menu_wrap').hover(function() {
	  	$(this).find('.menu_wrap').stop(true, true).delay().fadeIn(200);
		}, function() {
		$(this).find('.menu_wrap').stop(true, true).delay().fadeOut(200);
	});

	$(function(){
		// lnb
		var lnbUI = {
			click: function (target) { 
				var _self = this,
					$target = $(target);

				$target.on('click', 'a', function(e) { 
					e.stopPropagation();
					var $this = $(this);				
					if($this.parent('li').attr("MENU_URL") != undefined){
						KtisApp.MainFrame.openMenu($this.parent('li'));	
					}						
				})

			}

		};
		
		$(function(){
			lnbUI.click('#lnb li')
		});

    });
		
		
	// 메뉴실행
	function doAction( sAction, p1 )
	{ 
		switch(sAction)
		{
		case "ready" :
			{
				Site.Cmmn.showMsgAlarm("E","준비중입니다.","","");
			}
		break;
		case "init":
			{
				//시작시 상담등록 오픈 처리
				<c:choose >
					<c:when test="${siteProduct eq 'ONLINE'}">
						KtisApp.MainFrame.openMenu($('#menuOmniCrsMain').parent('li'));
					</c:when>
					<c:otherwise>
						KtisApp.MainFrame.openMenu($('#menuCrsMain').parent('li'));
					</c:otherwise>
				</c:choose>
				//KtisApp.MainFrame.openMenu($('#menuCrsMain').parent('li'));		
				
				//콜통계정보 정보 조회
				getIntervalData();
				
				//업무예약 알림팝업
				getJobResve();
				
				//실시간 공지사항 조회
				getNotice();

				//비밀번호 변경일 체크
				pwChgDtCheck();
			}
		break;	
		case "openNotice" :	//공지사항 메뉴열기
			{
				KtisApp.MainFrame.openMenu($('#공지사항').parent('li'));
			}
		break;
		}		
	}

	//메뉴그리기
	function makeMenu(){		
		
		$("#divMenu").html("");	
		<c:forEach var="topMenu" items="${treeMenuList}">	
		
		//권한체크
		<c:set var="auth" value="false"/>
		<c:forEach var="useKey" items="${userSession.defMenuUseKeys }">
			<c:if test="${useKey eq topMenu.menuKey }">
				<c:set var="auth" value="true"/>
			</c:if>
		</c:forEach>
		
		var menuHtml = "";	
		<c:if test="${auth}">
		
		var menuLi = $("<li class='depth01'></li>");		
		
			<c:choose>
			<c:when test="${empty topMenu.childList}"> 			    
				menuLi.html("${topMenu.menuNm}");
				menuLi.attr("MENU_ID", "${topMenu.menuKey}");	//메뉴키
				menuLi.attr("MENU_TYPE", "${topMenu.menuTyp}");//메뉴type
				menuLi.attr("MENU_NM", "${topMenu.menuNm}");	//메뉴명
				menuLi.attr("MENU_URL", "${topMenu.menuUrl}");	//URL
			    menuLi.attr("MENU_PKEY", "${topMenu.pkey}");	//상위메뉴키
			    menuLi.attr("MENU_OKEY", "${topMenu.okey}");	//순번
			    menuLi.attr("MENU_GKEY", "${topMenu.gkey}");	//depth				
				menuHtml = "<a href='#none' id='${topMenu.menuNm}'>"+"${topMenu.menuNm}"+"</a>";
				menuLi.html(menuHtml);				
			</c:when>
			<c:otherwise>			    
			    menuLi.html("${topMenu.menuNm}");
			    menuLi.attr("MENU_ID", "${topMenu.menuKey}");	//메뉴키
			    var menuHtml = "<a href='#none'>"+"${topMenu.menuNm}"+"</a>";
			    menuLi.html(menuHtml);
			    
			    var menuUl = $("<ul></ul>");			    			    
			    <c:forEach var="depth1Menu" items="${topMenu.childList }">
			    //권한체크 
			    	<c:set var="auth" value="false"/>
			    	<c:forEach var="useKey" items="${userSession.defMenuUseKeys }">
						<c:if test="${useKey eq depth1Menu.menuKey }">
							<c:set var="auth" value="true"/>		
						</c:if>
					</c:forEach>			
					<c:if test="${auth}"> //권한
					
			    	<c:choose>
			    	<c:when test="${depth1Menu.linkTyp eq 'EMPTY'}">
					    var depth1Menu =$("<li class='depth02'></li>");
					    var depth1Html = "<a href='#none'>"+"${depth1Menu.menuNm}"+"</a>";
					    depth1Menu.append(depth1Html);
					    
					    <c:if test="${not empty depth1Menu.childList}">	
					    	var subUl = $("<ul class='has-sub'></ul>");
					    	<c:forEach var="depth2Menu" items="${depth1Menu.childList }">		
					    	
						    	var depth2Menu =$("<li class='depth03'></li>");
							    var depth2Html = "<a href='#none' id='${depth2Menu.menuNm}'>"+"${depth2Menu.menuNm}"+"</a>";
							    
							    depth2Menu.html("${depth2Menu.menuNm}");
							    depth2Menu.attr("MENU_ID", "${depth2Menu.menuKey}");//메뉴키
							    depth2Menu.attr("MENU_TYPE", "${depth2Menu.menuTyp}");//메뉴type
							    depth2Menu.attr("MENU_NM", "${depth2Menu.menuNm}");	//메뉴명
							    depth2Menu.attr("MENU_URL", "${depth2Menu.menuUrl}");	//URL
							    depth2Menu.attr("MENU_PKEY", "${depth2Menu.pkey}");	//상위메뉴키
							    depth2Menu.attr("MENU_OKEY", "${depth2Menu.okey}");	//순번
							    depth2Menu.attr("MENU_GKEY", "${depth2Menu.gkey}");	//depth
							    
							    /* 상담등록 메뉴 경로 정보 셋팅 */
								if("${depth2Menu.menuUrl}".indexOf("CrsMain") != -1 && top.gs_crsMainScreen ==""){
									top.gs_crsMainScreen = "iframe_biz_" + "${depth2Menu.menuTyp}" + "${depth2Menu.menuKey}";
									//depth2Menu.attr("id", "menuCrsMain");	//depth
									depth2Html = "<a href='#none' id='menuCrsMain'>"+"${depth2Menu.menuNm}"+"</a>";
								}
								/* 옴니상담 메뉴 경로 정보 셋팅 */
								if("${depth2Menu.menuUrl}".indexOf("CrsOmniMain") != -1 && top.gs_crsOmniMainScreen ==""){
									top.gs_crsOmniMainScreen = "iframe_biz_" + "${depth2Menu.menuTyp}" + "${depth2Menu.menuKey}";
									depth2Html = "<a href='#none' id='menuOmniCrsMain'>"+"${depth2Menu.menuNm}"+"</a>";
								}
							    
							    depth2Menu.html(depth2Html);
							    subUl.append(depth2Menu);
					    	</c:forEach>					    	
					    	depth1Menu.append(subUl);					    	
					    </c:if>
					    
			    	</c:when>			    	
			    	<c:otherwise>
			    	
					    var depth1Menu =$("<li class='depth02'></li>");
					    var depth1Html = "<a href='#none' id='${depth1Menu.menuNm}'>"+"${depth1Menu.menuNm}"+"</a>";
					    
					    depth1Menu.html("${topMenu.menuNm}");
					    depth1Menu.attr("MENU_ID", "${depth1Menu.menuKey}");	//메뉴키
					    depth1Menu.attr("MENU_TYPE", "${depth1Menu.menuTyp}");//메뉴type
					    depth1Menu.attr("MENU_NM", "${depth1Menu.menuNm}");	//메뉴명
					    depth1Menu.attr("MENU_URL", "${depth1Menu.menuUrl}");	//URL
					    depth1Menu.attr("MENU_PKEY", "${depth1Menu.pkey}");	//상위메뉴키
					    depth1Menu.attr("MENU_OKEY", "${depth1Menu.okey}");	//순번
					    depth1Menu.attr("MENU_GKEY", "${depth1Menu.gkey}");	//depth
					    
					    /* 상담등록 메뉴 경로 정보 셋팅 */
						if("${depth1Menu.menuUrl}".indexOf("CrsMain") != -1 && top.gs_crsMainScreen ==""){
							top.gs_crsMainScreen = "iframe_biz_" + "${depth1Menu.menuTyp}" + "${depth1Menu.menuKey}";
							//depth1Menu.attr("id", "menuCrsMain");	//depth
							depth1Html = "<a href='#none' id='menuCrsMain'>"+"${depth1Menu.menuNm}"+"</a>";
						}
						/* 옴니상담 메뉴 경로 정보 셋팅 */
						if("${depth1Menu.menuUrl}".indexOf("CrsOmniMain") != -1 && top.gs_crsOmniMainScreen ==""){
							top.gs_crsOmniMainScreen = "iframe_biz_" + "${depth1Menu.menuTyp}" + "${depth1Menu.menuKey}";
							depth1Html = "<a href='#none' id='menuOmniCrsMain'>"+"${depth1Menu.menuNm}"+"</a>";
						}

					    depth1Menu.html(depth1Html);
			    	</c:otherwise>			    	
			    	</c:choose>				    		
				    menuUl.append(depth1Menu);
				    
				    </c:if> //권한
				    
			    </c:forEach>
			    
			    menuLi.append(menuUl);
			</c:otherwise>			
			
			</c:choose>
		$("#divMenu").append(menuLi);
		
		</c:if>
		</c:forEach>
	}
	
</script>

