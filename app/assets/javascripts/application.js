// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var utils = {
    checkForm($form) {
        var isValidate = true
        $form.find('.has-error').removeClass('has-error')
        $form.find('.alert').fadeOut()


        $form.find('input[data-required=required]').each( (i,elem) => {
            if (elem.value === "") {
                isValidate = false
                $form.find(elem).parent('.form-group').addClass("has-error")
            }
        })

        this.showError($form, isValidate, 'Campos requeridos')

        return isValidate
    },

    showError($form, isValidate, message){
        if (isValidate)
            return

        $form.find('.alert').fadeIn().children('span').html(message)
    }
}