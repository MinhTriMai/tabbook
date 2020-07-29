$(document).ready(function ()
{
    $('#marketplace_setting').click(function ()
    {
        return marketplace(this);
    });

    $('#kb-new-transaction-submit').click(function ()
    {
        return kbmp_transaction(this);
    });

    $('.submit_edit_email').click(function ()
    {
        return kbmp_email_edit(this);
    });

});

function marketplace(elem)
{
    var is_error = false;
    $('.velsof_error_label').hide();
    $('.kb_error_message').remove();
    $('#kb_mp_seller_config_form input').removeClass('kb_error_field');
    $('#kb_mp_seller_config_form input').parent().removeClass('kb_error_field');

    var commission_mandatory_err = velovalidation.checkMandatory($('input[name="kbmp_default_commission"]'));
    if (commission_mandatory_err != true)
    {
        is_error = true;
        $('input[name="kbmp_default_commission"]').parent().addClass('kb_error_field');
        $('input[name="kbmp_default_commission"]').parent().after('<span class="kb_error_message">' + commission_mandatory_err + '</span>');

    }
    else {
        var commission_positive_err = velovalidation.checkPercentage($('input[name="kbmp_default_commission"]'), true);
        if ($('input[name="kbmp_default_commission"]').val() != '')
        {
            if (commission_positive_err != true) {
                is_error = true;
                $('input[name="kbmp_default_commission"]').parent().addClass('kb_error_field');
                $('input[name="kbmp_default_commission"]').parent().after('<span class="kb_error_message">' + commission_positive_err + '</span>');

            }

        }
    }


    var request_limit_mandatory_err = velovalidation.checkMandatory($('input[name="kbmp_approval_request_limit"]'));
    if (request_limit_mandatory_err != true)
    {
        is_error = true;
        $('input[name="kbmp_approval_request_limit"]').addClass('kb_error_field');
        $('input[name="kbmp_approval_request_limit"]').after('<span class="kb_error_message">' + request_limit_mandatory_err + '</span>');

    }
    else {
        var request_limit_positive_err = velovalidation.isNumeric($('input[name="kbmp_approval_request_limit"]'), true);
        if ($('input[name="kbmp_approval_request_limit"]').val() != '')
        {
            if (request_limit_positive_err != true) {
                is_error = true;
                $('input[name="kbmp_approval_request_limit"]').addClass('kb_error_field');
                $('input[name="kbmp_approval_request_limit"]').after('<span class="kb_error_message">' + request_limit_positive_err + '</span>');

            }
        }
    }

    var product_limit_mandatory_err = velovalidation.checkMandatory($('input[name="kbmp_product_limit"]'));
    if (product_limit_mandatory_err != true)
    {
        is_error = true;
        $('input[name="kbmp_product_limit"]').addClass('kb_error_field');
        $('input[name="kbmp_product_limit"]').after('<span class="kb_error_message">' + product_limit_mandatory_err + '</span>');

    }
    else {
        var product_limit_positive_err = velovalidation.isNumeric($('input[name="kbmp_product_limit"]'), true);
        if ($('input[name="kbmp_product_limit"]').val() != '')
        {
            if (product_limit_positive_err != true) {
                is_error = true;
                $('input[name="kbmp_product_limit"]').addClass('kb_error_field');
                $('input[name="kbmp_product_limit"]').after('<span class="kb_error_message">' + product_limit_positive_err + '</span>');

            }
        }
    }



    if (is_error) {
        return false;
    }



}


function kbmp_transaction(elem)
{
    var is_error = false;
    $('.velsof_error_label').hide();
    $('.kb_error_message').remove();
    $('#kb_new_transaction_form input').removeClass('kb_error_field');
    $('#kb_new_transaction_form input').parent().removeClass('kb_error_field');

    var transaction_id_mandatory_err = velovalidation.checkMandatory($('input[name="new_transaction[id_transaction]"]'));
    if (transaction_id_mandatory_err != true)
    {
        is_error = true;
        $('input[name="new_transaction[id_transaction]"]').addClass('kb_error_field');
        $('input[name="new_transaction[id_transaction]"]').after('<span class="kb_error_message">' + transaction_id_mandatory_err + '</span>');

    }


    var transaction_amount_mandatory_err = velovalidation.checkMandatory($('input[name="new_transaction[amount]"]'));
    if (transaction_amount_mandatory_err != true)
    {
        is_error = true;
        $('input[name="new_transaction[amount]"]').addClass('kb_error_field');
        $('input[name="new_transaction[amount]"]').after('<span class="kb_error_message">' + transaction_amount_mandatory_err + '</span>');

    }


    var transaction_type_mandatory_err = $('select[name="new_transaction[transaction_type]"]').val();
    if (transaction_type_mandatory_err == '0' || transaction_type_mandatory_err == undefined)
    {
        is_error = true;
        $('select[name="new_transaction[transaction_type]"]').addClass('kb_error_field');
        $('select[name="new_transaction[transaction_type]"]').after('<span class="kb_error_message">' + 'Select atleast one value.' + '</span>');

    }

    var transaction_sellerId_mandatory_err = $('select[name="new_transaction[id_seller]"]').val();
    if (transaction_sellerId_mandatory_err == '0' || transaction_type_mandatory_err == undefined)
    {
        is_error = true;
        $('select[name="new_transaction[id_seller]"]').addClass('kb_error_field');
        $('select[name="new_transaction[id_seller]"]').after('<span class="kb_error_message">' + 'Select atleast one value.' + '</span>');

    }

    if (is_error) {
        return false;
    }
}
