// 获取表单、复选框和错误提示元素
const loginForm = document.getElementById("loginForm");
const agreementCheckbox = document.getElementById("agreement");
const submitButton = document.getElementById("submitButton");

agreementCheckbox.addEventListener("change", function () {
    submitButton.disabled = !this.checked; // 如果未勾选则禁用按钮
});