/**
 * list.jsp
 * 검색어가 비어있는지 확인하는 check() 함수
 */
// 검색 버튼을 눌렀을 때 실행되는 함수
function check() {
    
    // document 안에 있는 form 중에서 name="searchFrm" 인 폼을 가져옴
    // 즉, <form name="searchFrm"> 을 자바스크립트에서 제어하기 위해 변수 f에 저장
    var f = document.searchFrm;

    // 검색어 입력창의 값(f.keyWord.value)을 가져와서
    // 앞뒤 공백을 제거(trim)한 뒤
    // 아무것도 입력하지 않았는지 확인
    if (f.keyWord.value.trim() == "") {
        
        // 검색어가 비어있다면 경고창 표시
        alert("검색어를 입력하세요.");
        
        // 커서를 다시 검색어 입력창에 위치시킴 (사용자 편의)
        f.keyWord.focus();
        
        // 함수 실행 중단 (폼 제출 막기)
        return;
    }

    // 위 조건을 통과하면 (검색어가 정상적으로 입력되었으면)
    // 폼을 서버로 전송
    f.submit();
}
/**
 * read.jsp
 */
function list() {
	//	name="listFrm" 인 <form>을 가져와서 frm 변수에 저장
	//즉, 아래 같은 폼을 제어하기 위한 코드입니다:
	//<form name="listFrm">
	const frm = document.listFrm;
	
	// nowPage 값이 없거나 null이면 기본값 1을 할당
	//	frm.nowPage.value 가 null 이거나 undefined 이거나 빈 문자열("") 이면
	//즉, 페이지 번호가 없는 경우 	! 는 "값이 없으면(true)" 라는 뜻입니다.
	if (!frm.nowPage.value || frm.nowPage.value === "") {
	//기본 페이지를 1로 설정 ,왜냐하면 페이징은 보통 1페이지부터 시작하니까요.
	    frm.nowPage.value = "1";
	}
	
	frm.submit();
}
