$(document).ready(function ()
{

    
    $('#add_product_button').click(function ()
    {
        return add_product_validation();
    });
    
    $('#request-update-btn').click(function ()
    {
        return category_request_validation();
    });
    
    $('#review-submit-btn').click(function ()
    {
        return review_submit_validation();
    });
    
    $('#add_shipping_button').click(function ()
    {
        return shipping_submit_validation();
    });

});

// Image Manager
$(document).on('click', 'a[data-toggle=\'image\']', function(e) {
        var $element = $(this);
        var $popover = $element.data('bs.popover'); // element has bs popover?

        e.preventDefault();

        // destroy all image popovers
        $('a[data-toggle="image"]').popover('destroy');

        // remove flickering (do not re-add popover when clicking for removal)
        if ($popover) {
                return;
        }

        $element.popover({
                html: true,
                placement: 'right',
                trigger: 'manual',
                content: function() {
                        return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
                }
        });

        $element.popover('show');

        $('#button-image').on('click', function() {
                var $button = $(this);
                var $icon   = $button.find('> i');

                $('#modal-image').remove();

                $.ajax({
                        url: 'index.php?route=kbmp_marketplace/filemanager&token=' + getURLVar('token') + '&target=' + $element.parent().find('input').attr('id') + '&thumb=' + $element.attr('id'),
                        dataType: 'html',
                        beforeSend: function() {
                                $button.prop('disabled', true);
                                if ($icon.length) {
                                        $icon.attr('class', 'fa fa-circle-o-notch fa-spin');
                                }
                        },
                        complete: function() {
                                $button.prop('disabled', false);
                                if ($icon.length) {
                                        $icon.attr('class', 'fa fa-pencil');
                                }
                        },
                        success: function(html) {
                                $('body').append('<div id="modal-image" class="modal">' + html + '</div>');

                                $('#modal-image').modal('show');
                        }
                });

                $element.popover('destroy');
        });

        $('#button-clear').on('click', function() {
                $element.find('img').attr('src', $element.find('img').attr('data-placeholder'));

                $element.parent().find('input').val('');

                $element.popover('destroy');
        });
});
