// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var App = {

  dialogWindow : null,

  initDialog: function() {
    App.dialogWindow = $('#content_panel');

    App.dialogWindow.dialog({
      autoOpen: false,
      modal: true,
      title: 'hola',
      width: 700,
      buttons: {
        "Save": function() {
          $('#form_submit_button').click();
        },
        "Cancel": function() {
          $(this).dialog("close");
        }
      }
    });
  },

  detectOpenInDialog: function() {
    $('.open-in-dialog').each(function() {
      $(this).click(function() {
        var $link = $(this);

        App.dialogWindow.load($link.attr('href'), function() {
          $(this).dialog('option', 'title', $link.attr('title'));
          $(this).dialog('open');
          return false;
        });
        return false;
      });
    });
  }
}
