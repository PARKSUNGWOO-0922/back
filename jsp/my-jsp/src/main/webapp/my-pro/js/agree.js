const agreeAll = document.getElementById("agreeAll");
const agrees = document.querySelectorAll(".agree");
const required = document.querySelectorAll(".required");
const confirmBtn = document.getElementById("confirmBtn");

agreeAll.addEventListener("change", () => {
    agrees.forEach(chk => chk.checked = agreeAll.checked);
    checkRequired();
});

agrees.forEach(chk => {
    chk.addEventListener("change", checkRequired);
});

function checkRequired() {
    const allRequiredChecked = [...required].every(chk => chk.checked);

    confirmBtn.disabled = !allRequiredChecked;
    confirmBtn.classList.toggle("active", allRequiredChecked);
}

confirmBtn.addEventListener("click", () => {
    location.href = "step2.html";
});
