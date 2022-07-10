function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function phoneMask($selector) {

    var maskList = $.masksSort($.masksLoad("dist/js/phone-codes.json"), ['#'], /[0-9]|#/, "mask");
    var maskOpts = {
        inputmask: {
            definitions: {
                '#': {
                    validator: "[0-9]",
                    cardinality: 1
                }
            },
            //clearIncomplete: true,
            showMaskOnHover: false,
            autoUnmask: true
        },
        match: /[0-9]/,
        replace: '#',
        list: maskList,
        listKey: "mask",
        onMaskChange: function (maskObj, completed) {
            if (completed) {
                var hint = maskObj.name_ru;
                if (maskObj.desc_ru && maskObj.desc_ru != "") {
                    hint += " (" + maskObj.desc_ru + ")";
                }
            }

        }
    };

    $selector.inputmasks(maskOpts);
}

function checkForm($form) {
    var errorFields = [],
        passwordVal = false;

    $form.find('[data-required]:not(.no-validate)').each(function (j, item) {
        var type = $(item).data('rule'),
            value = $(item).val().trim(),
            err = false,
            $errWrap = $(item).closest('.form__required');

        $errWrap.removeClass('error');

        switch (type) {
            case 'phone':
                if (!$(item).inputmask("isComplete")) {
                    err = true;
                }
                break;
            case 'name':
                var re = /^[A-ZА-ЯЁ\s]{2,100}$/i;
                if (value == '' || !re.test(value)) {
                    err = true;
                }
                break;
            case 'fio':
                var re = /^[A-ZА-ЯЁ\s.-]{2,100}$/i;
                if (value == '' || !re.test(value)) {
                    err = true;
                }
                break;
            case 'email':
                if (!validateEmail(value)) {
                    err = true;
                }
                break;
            case 'password':
                if (value == '' || value.search(/\d/) < 0 || value.length < 6 || value.search(/[a-zA-Z]/) < 0 || value.search(/\W+/) >= 0) {
                    err = true;
                }
                passwordVal = value;
                break;
            case 'password_repeat':
                if (value != passwordVal || value == "") {
                    err = true;
                }
                break;
            case 'checkbox':
                if ($(item).prop('checked') != true) {
                    err = true;
                }
                break;
            default:
                if (value == '') {
                    err = true;
                }
                break;
        }

        if (err) {
            $errWrap.addClass('error');
            errorFields.push(item)
        }

    });

    return errorFields;
}

function submitFormModal(event) {
    var $form = $(this).closest('form'),
        errorFields = checkForm($form),
        callPop = $('[data-remodal-id="call"]').remodal();

    if (errorFields.length <= 0) {
        $(document).on('closed', '[data-remodal-id="call"]', function (e) {
            $(document).off('closed', '[data-remodal-id="call"]');
            $.alert({
                title: 'Спасибо!',
                content: 'Ваша заявка принята'
            });

            clearForm($form);
        });

        callPop.close();
    }

    return event.preventDefault();
}

function submitForm(event) {
    var $form = $(this).closest('form'),
        errorFields = checkForm($form);

    if (errorFields.length <= 0) {
        $.alert({
            title: 'Спасибо!',
            content: 'Ваша заявка принята'
        });

        clearForm($form);
    }

    return event.preventDefault();
}

function submitKeyForm(event) {
    event.preventDefault();
    var event = event || window.event,
        $modal = $('[data-remodal-id="authorize"]');

    if (event.keyCode === 13 && $modal.hasClass('remodal-is-opened')) {
        $modal.find('form').trigger('submit');
    }

}

function clearForm($form) {
    var $form = $form;

    $form.find('.form__required').removeClass('error');

    $form.find('input[type="text"], input[type="password"], textarea').val('');

    $form.find('input[type="checkbox"]').prop('checked', false);
}

function refreshError() {
    $(this).closest('.form__required').removeClass('error');
}
