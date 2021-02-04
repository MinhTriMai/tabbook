$(document).ready(function () {
    var enable_status = $('#input-opc-status').val();
    if(enable_status == '1') {
        ocajaxlogin.changeEvent();
    }
});

$(document).ajaxComplete(function () {
    var enable_status = $('#input-opc-status').val();
    if(enable_status == '1') {
        ocajaxlogin.changeEvent();
    }
});

var ocajaxlogin = {
    'loginAction' : function(email, password) {
        $.ajax({
            url: 'index.php?route=extension/module/ajaxlogin/login',
            type: 'post',
            data: { email: email, password: password },
            dataType: 'json',
            beforeSend: function () {
                $('.ajax-load-img').show();
            },
            success: function (json) {
                if(json['success'] == true) {
                    if(json['enable_redirect']) {
                        location = json['redirect'];
                    } else {
                        // Update account top links
                        $('.ul-account').load('index.php?route=extension/module/ajaxlogin/toheaderhtml #top-links ul.ul-account li');

                        // Update wishlish in top links
                        $('#wishlist-total span').html(json['wishlist_total']);
                        $('#wishlist-total').attr('title', json['wishlist_total']);

                        // Update cart total
                        $('#cart-total').html(json['cart_total']);
                        $('#cart > ul').load('index.php?route=common/cart/info ul li');

                        $('body').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success_message'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                        //start volyminhnhan@gmail.com modifications
                        // add seller link to top menu
                        if(!json['isSeller']) {
                            $("#pt_custommenu").append('<div id="pt_menu_link9999" class="pt_menu pt_menu_link"><div class="parentMenu"><a href="index.php?route=account/seller"><span>Trở thành người bán</span></a></div></div>');
                        }
                        else {
                            $("#pt_custommenu").append('<div id="pt_menu_link9999" class="pt_menu pt_menu_link"><div class="parentMenu"><a href="index.php?route=kbmp_marketplace/products"><span>Đăng bán sản phẩm</span></a></div></div>');
                        }
                        //end volyminhnhan@gmail.com modifications
                    }
                    ocajaxlogin.closeForm();
                    $('.ajax-load-img').hide();
                    $('.login-form-content .alert-danger').remove();
                } else {
                    $('.ajax-load-img').hide();
                    $('.login-form-content .alert-danger').remove();
                    $('#input-email').val('');
                    $('#input-password').val('');
                    $('.ajax-content .login-form-content').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' +
                                        json['error_warning'] +
                                        '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            }
        });
    },
    
    'registerAction' : function () {
        $('.for-error').removeClass('text-danger').hide();
        $('.form-group').removeClass('has-error');
        $.ajax({
            url: 'index.php?route=extension/module/ajaxregister/register',
            type: 'post',
            data: $('#ajax-register-form').serialize(),
            dataType: 'json',
            beforeSend: function () {
                $('.ajax-load-img').show();
            },
            success: function (json) {
                $('.ajax-load-img').hide();
                if(json['success'] == true) {
                    ocajaxlogin.appendSuccess();
                } else {

                    // Error Warning
                    if(json['error_warning'] != '') {
                        $('.error-warning span').html(" " + json['error_warning']);
                        $('.error-warning').show();
                    }

                    // First Name
                    if(json['error_firstname'] != '') {
                        $('.error-firstname').addClass('text-danger').html(json['error_firstname']).show();
                    }

                    // Last Name
                    if(json['error_lastname'] != '') {
                        $('.error-lastname').addClass('text-danger').html(json['error_lastname']).show();
                    }

                    // School
                    if(json['error_school'] != '') {
                        $('.error-school').addClass('text-danger').html(json['error_school']).show();
                    }

                    // Email
                    if(json['error_email'] != '') {
                        $('.error-email').addClass('text-danger').html(json['error_email']).show();
                    }

                    // Telephone
                    if(json['error_telephone'] != '') {
                        $('.error-telephone').addClass('text-danger').html(json['error_telephone']).show();
                    }

                    // Custom Field
                    if(json['error_custom_field'] != '') {
                        $('.error-custom').addClass('text-danger').html(json['error_custom_field']).show();
                    }

                    // Password
                    if(json['error_password'] != '') {
                        $('.error-password').addClass('text-danger').html(json['error_password']).show();
                    }

                    // Confirm Password
                    if(json['error_confirm'] != '') {
                        $('.error-confirm').addClass('text-danger').html(json['error_confirm']).show();
                    }

                    // Highlight any found errors
                    $('.text-danger').each(function() {
                        var element = $(this).parent().parent();

                        if (element.hasClass('form-group')) {
                            element.addClass('has-error');
                        }
                    });
                }
            }
        });
    },
    
    'logoutAction' : function () {
        $.ajax({
            url: 'index.php?route=extension/module/ajaxlogin/logout',
            dataType: 'json',
            beforeSend: function () {
                $('#ajax-login-block').show();
                $('#ajax-loader').show();
            },
            success: function (json) {
                if(json['enable_redirect']) {
                    location = json['redirect'];
                } else {
                    // Update account top links
                    $('.ul-account').load('index.php?route=extension/module/ajaxlogin/toheaderhtml #top-links ul.ul-account li');

                    // Update wishlish in top links
                    $('#wishlist-total span').html(json['wishlist_total']);
                    $('#wishlist-total').attr('title', json['wishlist_total']);

                    // Update cart total
                    $('#cart-total').html(json['cart_total']);
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
                $('#ajax-loader').hide();
                ocajaxlogin.appendLogoutSuccess();
            }
        });
    },
    
    'appendLoginForm' : function() {
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
        $('.ajax-body-login').show();
        $('.account-register').hide('400');
        $('#ajax-login-block').show();
        $('.account-login').show('600');
    },
    
    'appendRegisterForm' : function() {
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
        $('.ajax-body-login').show();
        $('.account-login').hide('400');
        $('#ajax-login-block').show();
        $('.account-register').show('600');
    },

    'appendSuccess' : function () {
        $('.ajax-body-login').show();
        $('.account-register').hide('400');
        $('.account-success').show('600');
    },

    'appendLogoutSuccess' : function () {
        $('.ajax-body-login').show();
        $('.logout-success').show('600');
    },

    'resetLoginForm' : function () {
        $('.login-form-content .alert-danger').remove();
        $('#ajax-login-form')[0].reset();
    },
    
    'resetRegisterForm' : function () {
        $('.for-error').removeClass('text-danger').hide();
        $('.form-group').removeClass('has-error');
        $('#ajax-register-form')[0].reset();
    },

    'closeForm' : function () {
        $('#ajax-login-block').hide();
        $('#ajax-loader').hide();
        $('.account-login').hide('400');
        $('.account-register').hide('400');
        $('.account-success').hide();
        $('.logout-success').hide();
        $('.ajax-body-login').hide();
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
    },
    
    'changeEvent' : function () {
        $('#a-register-link').attr('href', 'javascript:void(0);')
            .attr('onclick', 'ocajaxlogin.appendRegisterForm()');
        $('#a-login-link').attr('href', 'javascript:void(0);')
            .attr('onclick', 'ocajaxlogin.appendLoginForm()');
        $('#a-logout-link').attr('href', 'javascript:void(0);')
            .attr('onclick', 'ocajaxlogin.logoutAction()');
    }
};