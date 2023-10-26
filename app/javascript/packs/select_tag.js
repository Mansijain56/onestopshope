$(function() {
    $('#independent').on('change', function (e) {

      var selected = $('#independent').val().toUpperCase();
      var currentDep = $('#dependent').val().charAt(0).toUpperCase();
      var changedSelected = false;

      $('#dependent option').each(function() {

        var opt = $(this);
        var value = opt.val().charAt(0).toUpperCase();

        if (value !== selected) {

          opt.addClass('hide');
          opt.removeAttr('selected');

        } else {

          opt.removeClass('hide');

          if (!changedSelected) {

            opt.attr('selected', 'selected');
            changedSelected = true;

          } else {
            opt.removeAttr('selected');
          }
        }
      });
    });
});