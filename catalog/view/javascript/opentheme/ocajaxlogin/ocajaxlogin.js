$(document).ready(function(){"1"==$("#input-opc-status").val()&&ocajaxlogin.changeEvent()}),$(document).ajaxComplete(function(){"1"==$("#input-opc-status").val()&&ocajaxlogin.changeEvent()});var ocajaxlogin={loginAction:function(o,e){$.ajax({url:"index.php?route=extension/module/ajaxlogin/login",type:"post",data:{email:o,password:e},dataType:"json",beforeSend:function(){$(".ajax-load-img").show()},success:function(o){1==o.success?(o.enable_redirect?location=o.redirect:($(".ul-account").load("index.php?route=extension/module/ajaxlogin/toheaderhtml #top-links ul.ul-account li"),$("#wishlist-total span").html(o.wishlist_total),$("#wishlist-total").attr("title",o.wishlist_total),$("#cart-total").html(o.cart_total),$("#cart > ul").load("index.php?route=common/cart/info ul li"),$("body").before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+o.success_message+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>'),o.isSeller||$("#pt_custommenu").append('<div id="pt_menu_link9999" class="pt_menu pt_menu_link"><div class="parentMenu"><a href="index.php?route=account/seller"><span>Trở thành người bán</span></a></div></div>')),ocajaxlogin.closeForm(),$(".ajax-load-img").hide(),$(".login-form-content .alert-danger").remove()):($(".ajax-load-img").hide(),$(".login-form-content .alert-danger").remove(),$("#input-email").val(""),$("#input-password").val(""),$(".ajax-content .login-form-content").append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+o.error_warning+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>'))}})},registerAction:function(){$(".for-error").removeClass("text-danger").hide(),$(".form-group").removeClass("has-error"),$.ajax({url:"index.php?route=extension/module/ajaxregister/register",type:"post",data:$("#ajax-register-form").serialize(),dataType:"json",beforeSend:function(){$(".ajax-load-img").show()},success:function(o){$(".ajax-load-img").hide(),1==o.success?ocajaxlogin.appendSuccess():(""!=o.error_warning&&($(".error-warning span").html(" "+o.error_warning),$(".error-warning").show()),""!=o.error_firstname&&$(".error-firstname").addClass("text-danger").html(o.error_firstname).show(),""!=o.error_lastname&&$(".error-lastname").addClass("text-danger").html(o.error_lastname).show(),""!=o.error_school&&$(".error-school").addClass("text-danger").html(o.error_school).show(),""!=o.error_email&&$(".error-email").addClass("text-danger").html(o.error_email).show(),""!=o.error_telephone&&$(".error-telephone").addClass("text-danger").html(o.error_telephone).show(),""!=o.error_custom_field&&$(".error-custom").addClass("text-danger").html(o.error_custom_field).show(),""!=o.error_password&&$(".error-password").addClass("text-danger").html(o.error_password).show(),""!=o.error_confirm&&$(".error-confirm").addClass("text-danger").html(o.error_confirm).show(),$(".text-danger").each(function(){var o=$(this).parent().parent();o.hasClass("form-group")&&o.addClass("has-error")}))}})},logoutAction:function(){$.ajax({url:"index.php?route=extension/module/ajaxlogin/logout",dataType:"json",beforeSend:function(){$("#ajax-login-block").show(),$("#ajax-loader").show()},success:function(o){o.enable_redirect?location=o.redirect:($(".ul-account").load("index.php?route=extension/module/ajaxlogin/toheaderhtml #top-links ul.ul-account li"),$("#wishlist-total span").html(o.wishlist_total),$("#wishlist-total").attr("title",o.wishlist_total),$("#cart-total").html(o.cart_total),$("#cart > ul").load("index.php?route=common/cart/info ul li")),$("#ajax-loader").hide(),ocajaxlogin.appendLogoutSuccess()}})},appendLoginForm:function(){ocajaxlogin.resetLoginForm(),ocajaxlogin.resetRegisterForm(),$(".ajax-body-login").show(),$(".account-register").hide("400"),$("#ajax-login-block").show(),$(".account-login").show("600")},appendRegisterForm:function(){ocajaxlogin.resetLoginForm(),ocajaxlogin.resetRegisterForm(),$(".ajax-body-login").show(),$(".account-login").hide("400"),$("#ajax-login-block").show(),$(".account-register").show("600")},appendSuccess:function(){$(".ajax-body-login").show(),$(".account-register").hide("400"),$(".account-success").show("600")},appendLogoutSuccess:function(){$(".ajax-body-login").show(),$(".logout-success").show("600")},resetLoginForm:function(){$(".login-form-content .alert-danger").remove(),$("#ajax-login-form")[0].reset()},resetRegisterForm:function(){$(".for-error").removeClass("text-danger").hide(),$(".form-group").removeClass("has-error"),$("#ajax-register-form")[0].reset()},closeForm:function(){$("#ajax-login-block").hide(),$("#ajax-loader").hide(),$(".account-login").hide("400"),$(".account-register").hide("400"),$(".account-success").hide(),$(".logout-success").hide(),$(".ajax-body-login").hide(),ocajaxlogin.resetLoginForm(),ocajaxlogin.resetRegisterForm()},changeEvent:function(){$("#a-register-link").attr("href","javascript:void(0);").attr("onclick","ocajaxlogin.appendRegisterForm()"),$("#a-login-link").attr("href","javascript:void(0);").attr("onclick","ocajaxlogin.appendLoginForm()"),$("#a-logout-link").attr("href","javascript:void(0);").attr("onclick","ocajaxlogin.logoutAction()")}};