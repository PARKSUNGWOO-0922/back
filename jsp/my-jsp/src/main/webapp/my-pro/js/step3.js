// 실제 서비스에서는 서버 세션에서 사용자명 조회
const userName = "홍길동";

document.getElementById("userName").innerText = userName;

// 신규회원 혜택
document.getElementById("benefitBtn").addEventListener("click", () => {
    location.href = "/subway/benefit.html";
});

// 메인 이동
document.getElementById("mainBtn").addEventListener("click", () => {
    location.href = "/subway/main.html";
});
