/**
 * Created by st on 14-12-23.
 */
//function loginin_click(){
    $('.theme-login').click(function()
    {
        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    })
//}
//function loginclose_click(){
    $('.theme-poptit .close').click(function()
    {
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover').slideUp(200);
    })
//}
function login(){
    $.post(
        "/login/login",
        {
            "name":$("#div-input-name").val(),
            "password":$("#div-input-password").val(),
            "code":$("#div-input-code").val()
        },
        function(result){afterlogin(result);}
    );
}

function afterlogin(result){
    if(result=="成功"){
        alert(result);
        window.location.href="/index/index";
    }
    else
        alert(result);
}

function changesrc(){
    $("#div-check-img").attr("src","/login/code");
}