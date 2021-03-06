;(function (factory) {
    'use strict';
     if(typeof define === "function" && define.amd) {
         define(['jquery'], factory);
     }else{
         factory(jQuery);
     }
}(function ($) {
    $.formb = $.formb || {};
    $.formb.components = $.formb.components || {};
    var baseComponent = $.formb.baseComponent;

    var component_date = function (kargs) {
        baseComponent.apply(this, arguments);
        this.template = 
            '<div class="component">'+
                '<span class="form-control-feedback feedback-fix"><i class="fa fa-calendar"></i></span>' +
                '<input type="text" class="form-control coreInput" name="{name}" />' +
                '<div class="help-block-error"></div>'+
            '</div>';
        var that = this ;
        
        this.__render = function() {
            
            that.$node = $(that.template.format(that.opts));
            var $input = $(that.$node.find('input'));
            $input.attr('placeholder', that.opts.placeholder);
            
            $input.datetimepicker(that.opts.dtp_setting || {
                language: 'zh-CN',
                format: 'yyyy-mm-dd',
                weekStart: 1,
                todayBtn:  1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
        }

    };
    $.formb.components.date = component_date;

}));