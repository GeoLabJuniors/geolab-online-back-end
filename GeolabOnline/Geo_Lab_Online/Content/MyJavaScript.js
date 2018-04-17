$(document).ready(function ($) {
    console.log('read');
    $('#login-submit').click(function () {
      
        var model = {
        
            Name: $('#email').val(),
            Password: $('#password').val()
        };
        $.ajax({
            url: '/User/Login',
            type: 'post',
            dataType: 'json',
            cache: false,
            data: model,
            success: function (response) {
                if (response.isRedirect)
                {
                    window.location.href = response.redirectUrl;
                } else
                if (response == "0") {
                    $('#div-for-error').html('მომხმარებელი აღნიშნული იმეილით და პაროლით არ არსებობს');
                } else if (response == "1") { location.replace("http://localhost:52256/Home/index");}
            }
        });
    });

    $('#logout-submit').click(function () {

        
        $.ajax({
            url: '/User/Logout',
            type: 'Get',
            dataType: 'json',
            cache: false,
            
            success: function (response) {
                if (response.isRedirect) {
                    location.replace("http://localhost:52256/Home/index");
                } 
            }
        });
    });

    $('.logintest').click(function () {
        console.log('sss');
        if ($('#userPassword').val() != $('#confirm-password').val()) {
            console.log('ss');
            $('#div-for-error').html('პაროლები არ არის იდენტური');
        } else {
            console.log('ss2s');
            var model = {
                UserName: $('#registeremail').val(),
                PassowrdCon1: $('#userPassword').val(),
                PassowrdCon: $('#confirm-password').val(),
                Mail: $('#registeremail').val(),
                FirstName: $('#name').val(),
                LastName: $('#lastname').val()
            };
            $.ajax({
                url: '/User/Register',
                type: 'post',
                dataType: 'json',
                cache: false,
                data: model,
                success: function (response) {
                    if (response == "0") {
                        $('#div-for-error').html('ელექტრონული ფოსტის იდენტიფიცირებისთვის თქვენს მეილზე გამოგზავნილია აქტივაციის ლინკი');
                        $("#div-for-error").css("color", "green");
                    }
                    else
                        if (response == "-1")
                        {
                            $('#div-for-error').html('შეავსეთ ყველა ველი'); 
                        }
                        else if (response == "2") {
                            $('#div-for-error').html('აღნიშნული იუზერი უკვე რეგისტრირებულია'); 
                        }
                        else
                        {

                            $('#div-for-error').html('დაფიქსირდა ხარვეზი');
                        }
                }
            });

        }
    });

});