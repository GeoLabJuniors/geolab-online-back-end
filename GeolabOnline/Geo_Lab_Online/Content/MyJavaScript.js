$(document).ready(function () {

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
                if (response.isRedirect) {
                    window.location.href = response.redirectUrl;
                } else
                    if (response == "0") {
                        $('#div-for-error').html('მომხმარებელი აღნიშნული იმეილით და პაროლით არ არსებობს');
                    } else if (response == "1") { location.replace("http://localhost:52256/Home/index"); }
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
                        if (response == "-1") {
                            $('#div-for-error').html('შეავსეთ ყველა ველი');
                        }
                        else if (response == "2") {
                            $('#div-for-error').html('აღნიშნული იუზერი უკვე რეგისტრირებულია');
                        }
                        else {

                            $('#div-for-error').html('დაფიქსირდა ხარვეზი');
                        }
                }
            });

        }

    });

    $('#savelessons').click(function () {

        var model = {

            Title: $('#usr').val(),
            Desc: $.trim(tinymce.get('comment').getContent()),
            CodeEditor: $('input[name=optradio]:checked').val(),
            subjectid: $('#subjectid').val(),
            videoURl: $('#videoURl').val(),
            lessonselvl: $('#lessonselvl').val()
        };
        $.ajax({
            url: '/Subject/AddLessons',
            type: 'post',
            dataType: 'json',
            complete: function (result) {
                if (result.responseText) {
                    $('body').html(result.responseText);
                }
            },
            cache: false,
            data: model
        });
    });
    
    var max_fields = 5; //maximum input boxes allowed
    var wrapper = $(".input_fields_wrap"); //Fields wrapper
    var add_button = $(".add_field_button"); //Add button ID

    var x = 1; //initlal text box count
    $(add_button).click(function (e) { //on add input button click
        e.preventDefault();
        if (x < max_fields) { //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div><input type="text" name="mytext" class="users"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
        }
    });

    $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })


    $(".savequiz").click(function () {
        var textlist = $('input:text.users').serializeArray();
        var list = [];
        for (var i in textlist) {
            list.push(textlist[i].value)
    }
        var model = {
            quiz: $.trim(tinymce.get('quiz').getContent()),
            LessonsTitel: $('#LessonsTitel').val(),
            correct: $('#correct').val(),
            List: list            
        }
       
        $.ajax({
            url: '/Lessons/AddQuiz',
            type: 'post',
            dataType: 'json',
            complete: function (result) {
                if (result.responseText) {
                    $('body').html(result.responseText);
                }
            } ,
            cache: false,
            data: model
            
        });
    })



    $('#editlessons').click(function () {

        var model = {

            Title: $('#usr').val(),
            Desc: $.trim(tinymce.get('comment').getContent()),
            CodeEditor: $('input[name=optradio]:checked').val(),
            id: $('#subjectid').val(),
            videoURl: $('#videoURl').val(),
            lessonselvl: $('#lessonselvl').val()
        };
        $.ajax({
            url: '/Lessons/Edit',
            type: 'post',
            dataType: 'json',
            complete: function (result) {
                if (result.responseText) {
                    $('body').html(result.responseText);
                }
            },
            cache: false,
            data: model
        });
    });
});

