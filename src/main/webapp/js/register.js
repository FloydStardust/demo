function register() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var passwordRepeat = document.getElementById("passwordRepeat").value;
    
    if (password !== passwordRepeat) {
        alert("密码不一致！");
        return;
    }

    var data = new FormData();
    data.append("userName", username);
    data.append("password", password);

    var xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === 4) {
            var response = JSON.parse(this.responseText);
            if (response.responseCode === 'RESPONSE_OK') {
                window.alert("注册成功");
                window.location.href = '/login';
            }
        }
    });

    xhr.open("POST", "/auth/register");

    xhr.send(data);
}