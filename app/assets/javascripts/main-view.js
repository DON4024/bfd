$(function(){
  $(document).on('click', '.move-btn', function(){
    var href = this.href;
    var numbers = href.match(new RegExp("group-id\\d+","g"));
    var selectopen = $(this).attr('class');
    selectopen = selectopen.replace( ' move-btn', '')
    $( `.${numbers}` ).slideToggle(600);

  })
})

