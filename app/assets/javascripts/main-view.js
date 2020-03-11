$(function(){
  $('.review-items__icons').on('click', function(){
    console.log(this)
    $(this).removeAttr("disabled");
    var selectopen = $(this).attr('class');
    selectopen = selectopen.replace( ' review-items__icons', '')
    console.log(selectopen)
    if($(this).css("margin-left").length==5){
      console.log($(this).css("margin-left").length)
      $(`.${selectopen}`).animate({'marginLeft':'0'},300);
    }else {
      $(`.${selectopen}`).animate({'marginLeft':'310px'},300);
    }
    // var selectgroup = $('#app-main__body__group').attr('class');
    // console.log(selectgroup)
    
    // if($(`${selectopen}`).hasClass('off')){
    //   $(`${selectopen}`).removeClass('off');
    //   $(`.${selectgroup}`).animate({'paddingLeft':'0px'},300);
    //   selectgroup = ""
    // }else{
    //   $('#review-items__icons__open').addClass('off');
    //   $(`.${selectgroup}`).animate({'paddingLeft':'550px'},300);
    // }

  })
})

