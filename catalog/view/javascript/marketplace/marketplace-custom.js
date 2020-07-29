$(document).ready(function ()
{
    if ($('.date').length > 0) {
        $('.date').datetimepicker({
            pickTime: false
        });
    }

    $('.productEditSection li a').click(function ()
    {
        $(this).next('.productFields').slideToggle();
        $(this).toggleClass('opened');
        $(this).parent().siblings().find('.productFields').fadeOut();
        $(this).parent().siblings().find('.opened').removeClass('opened');
    });

    $('input[name="seller_profile_url"]').keyup(function ()
    {
        var seller_profile_url_text = $(this).val();
        $('#friendly-url-demo').text(seller_profile_url_text);
    });
    
    function showLogoPreview(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#seller_logo_placeholder').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    function showBannerPreview(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#seller_banner_placeholder').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $(".custom-inputFile-logo input").change(function () {
        showLogoPreview(this);
    });
    
    $(".custom-inputFile-banner input").change(function () {
        showBannerPreview(this);
    });

    $('#order-status-button').click(function ()
    {
        $('#change-order-status').show();
        $('#add-order-comment').hide();
    });
    
    $('#order-comment-button').click(function ()
    {
        $('#change-order-status').hide();
        $('#add-order-comment').show();
    });

    $('select[name="seller_payment_option"]').change(function () {
        $('.selectpaymentType').hide();
        $('#' + $(this).val()).show();
    });
});

