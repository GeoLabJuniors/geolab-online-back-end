$(document).ready(function () {
    console.log('ss')
    $('.დალოგინება').click(function () {
        var model = {
            Name: $('#userName').val(),
            Password: $('#userPassword').val()
        };
        $.ajax({
            url: '/Account/Login',
            type: 'post',
            dataType: 'json',
            cache: false,
            data: model
        });
    });
    $('.btn').click(function () {
        if ($('#userPassword').val() != $('#userPasswordcon').val()) {
            console.log('ss');
            $('#div-for-error').html('პაროლები არ არის იდენტური');
        } else {
            var model = {
                UserName: $('#userPassword').val(),
                Password: $('#userPassword').val(),
                PassowrdCon: $('#userPassword').val(),
                Mail: $('#userPassword').val(),
                FirstName: $('#userPassword').val(),
                LastName: $('#userPassword').val()
            };
            $.ajax({
                url: '/Account/Register',
                type: 'post',
                dataType: 'json',
                cache: false,
                data: model,
                success: function (response) {
                    if (response == "0") { }
                    else
                        if (response == "-1")
                        {
                        }
                        else {

                        }
                }
            });

        }
    });

});