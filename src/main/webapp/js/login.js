function login() {

    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    var data = new FormData();
    data.append("username", email);
    data.append("password", password);
    data.append("grant_type", "password");
    data.append("scope", "select");
    data.append("client_id", "client");
    data.append("client_secret", "123456");

    var xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === 4 && this.status === 200) {
            var response = JSON.parse(this.responseText);
            var access_token = response.access_token;
            setCookie("access_token", access_token, 7);
            window.location.href = "/portfolio";
        }
    });

    xhr.open("POST", "http://localhost:8080/oauth/token");

    xhr.send(data);
}