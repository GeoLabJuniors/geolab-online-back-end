function isUserRegistered(accessToken) {
    $.ajax({
        url: '/api/Account/UserInfo',
        method: 'GET',
        headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer ' + accessToken
        },
        success: function (response) {
            if (response.HasRegistered) {
                localStorage.setItem("accessToken", accessToken);
                localStorage.setItem("userName", response.Email);
                window.location.href = "Data.html";
            }
            else {
                // Pass the login provider (Facebook or Google)
                signupExternalUser(accessToken, response.LoginProvider);
            }
        }
    });
}
function signupExternalUser(accessToken, provider) {
    $.ajax({
        url: '/api/User/Register',
        method: 'POST',
        headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer ' + accessToken
        },
        success: function () {
            // Use the provider parameter value instead of
            // hardcoding the provider name
            window.location.href = "/api/Account/ExternalLogin?provider=" + provider + "&response_type=token&client_id=self&redirect_uri=http%3a%2f%2flocalhost%3a52256%2fLogin.html&state=GerGr5JlYx4t_KpsK57GFSxVueteyBunu02xJTak5m01";
        }
    });
}