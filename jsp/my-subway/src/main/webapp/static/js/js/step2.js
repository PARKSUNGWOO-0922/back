// =======================
// input 요소
// =======================
const nameInput = document.getElementById("name");
const birthInput = document.getElementById("birth");
const phoneInput = document.getElementById("phone");
const userId = document.getElementById("userId");
const password = document.getElementById("password");
const passwordConfirm = document.getElementById("passwordConfirm");
const email = document.getElementById("email");
const joinBtn = document.getElementById("joinBtn");

// =======================
// error 요소
// =======================
const nameError = document.getElementById("nameError");
const birthError = document.getElementById("birthError");
const phoneError = document.getElementById("phoneError");
const idError = document.getElementById("idError");
const pwError = document.getElementById("pwError");
const pwConfirmError = document.getElementById("pwConfirmError");
const emailError = document.getElementById("emailError");

// =======================
// touched 상태
// =======================
let touchedName = false;
let touchedBirth = false;
let touchedPhone = false;
let touchedId = false;
let touchedPw = false;
let touchedPwConfirm = false;
let touchedEmail = false;

// =======================
// 정규식
// =======================
const nameRegex = /^[가-힣]{2,}$/;
const birthRegex = /^\d{8}$/;
const phoneRegex = /^010\d{8}$/;
const idRegex = /^[a-zA-Z0-9]{8,12}$/;
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

// =======================
// 개별 유효성 검사
// =======================
function checkName() {
    if (!touchedName) return true;
    const ok = nameRegex.test(nameInput.value.trim());
    nameError.textContent = "이름은 한글 2자 이상 입력하세요.";
    nameError.style.display = ok ? "none" : "block";
    return ok;
}


function isValidDate(yyyymmdd) {
    const year = Number(yyyymmdd.substring(0, 4));
    const month = Number(yyyymmdd.substring(4, 6));
    const day = Number(yyyymmdd.substring(6, 8));

    // 기본 범위 검사
    if (year < 1900 || year > new Date().getFullYear()) return false;
    if (month < 1 || month > 12) return false;

    // 월별 일수
    const daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    // 윤년 처리
    if (
        month === 2 &&
        ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0)
    ) {
        daysInMonth[1] = 29;
    }

    return day >= 1 && day <= daysInMonth[month - 1];
}


function checkBirth() {
    if (!touchedBirth) return true;

    const value = birthInput.value.trim();

    let ok =
        birthRegex.test(value) &&
        isValidDate(value);

    birthError.textContent = "생년월일은 실제 존재하는 날짜로 입력해주세요.";
    birthError.style.display = ok ? "none" : "block";

    return ok;
}

function updateJoinButton() {
    const birthValue = birthInput.value.trim();

    const valid =
        nameRegex.test(nameInput.value.trim()) &&
        birthRegex.test(birthValue) &&
        isValidDate(birthValue) &&
        phoneRegex.test(phoneInput.value.trim()) &&
        idRegex.test(userId.value) &&
        checkPassword() &&
        password.value === passwordConfirm.value &&
        emailRegex.test(email.value);

    joinBtn.disabled = !valid;
    joinBtn.classList.toggle("active", valid);
}



// function checkBirth() {
//     if (!touchedBirth) return true;
//     const ok = birthRegex.test(birthInput.value.trim());
//     birthError.textContent = "생년월일은 YYYYMMDD 형식입니다.";
//     birthError.style.display = ok ? "none" : "block";
//     return ok;
// }

function checkPhone() {
    if (!touchedPhone) return true;
    const ok = phoneRegex.test(phoneInput.value.trim());
    phoneError.textContent = "휴대폰 번호는 01012345678 형식입니다.";
    phoneError.style.display = ok ? "none" : "block";
    return ok;
}

function checkId() {
    if (!touchedId) return true;
    const ok = idRegex.test(userId.value);
    idError.style.display = ok ? "none" : "block";
    return ok;
}

function checkPassword() {
    if (!touchedPw) return true;

    const v = password.value;
    let count = 0;
    if (/[A-Za-z]/.test(v)) count++;
    if (/[0-9]/.test(v)) count++;
    if (/[^A-Za-z0-9]/.test(v)) count++;

    const ok = v.length >= 10 && v.length <= 16 && count >= 2;
    pwError.style.display = ok ? "none" : "block";
    return ok;
}

function checkPasswordConfirm() {
    if (!touchedPwConfirm) return true;
    const ok = password.value === passwordConfirm.value;
    pwConfirmError.style.display = ok ? "none" : "block";
    return ok;
}

function checkEmail() {
    if (!touchedEmail) return true;
    const ok = emailRegex.test(email.value);
    emailError.style.display = ok ? "none" : "block";
    return ok;
}

// =======================
// 버튼 활성화
// =======================
function updateJoinButton() {
    const valid =
        nameRegex.test(nameInput.value.trim()) &&
        birthRegex.test(birthInput.value.trim()) &&
        phoneRegex.test(phoneInput.value.trim()) &&
        idRegex.test(userId.value) &&
        checkPassword() &&
        password.value === passwordConfirm.value &&
        emailRegex.test(email.value);

    joinBtn.disabled = !valid;
    joinBtn.classList.toggle("active", valid);
}

// =======================
// 이벤트 바인딩
// =======================
nameInput.addEventListener("input", () => {
    touchedName = true;
    checkName();
    updateJoinButton();
});

birthInput.addEventListener("input", () => {
    touchedBirth = true;
    checkBirth();
    updateJoinButton();
});

phoneInput.addEventListener("input", () => {
    touchedPhone = true;
    checkPhone();
    updateJoinButton();
});

userId.addEventListener("input", () => {
    touchedId = true;
    checkId();
    updateJoinButton();
});

password.addEventListener("input", () => {
    touchedPw = true;
    checkPassword();
    checkPasswordConfirm();
    updateJoinButton();
});

passwordConfirm.addEventListener("input", () => {
    touchedPwConfirm = true;
    checkPasswordConfirm();
    updateJoinButton();
});

email.addEventListener("input", () => {
    touchedEmail = true;
    checkEmail();
    updateJoinButton();
});

// =======================
// 가입 버튼 클릭
// =======================
joinBtn.addEventListener("click", () => {
    location.href = "step3.html";
});
