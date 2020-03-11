$(function(){
  $('.review-items__icons__open').on('click', function(){
    
  
    var selectgroup = $('#app-main__body__group').attr('class')
    console.log(selectgroup)
    if($('.review-items__icons__open').hasClass('off')){
      $('.review-items__icons__open').removeClass('off');
      $(`.${selectgroup}`).animate({'paddingLeft':'0px'},300);
    }else{
      $('.review-items__icons__open').addClass('off');
      $(`.${selectgroup}`).animate({'paddingLeft':'500px'},300);
    }

  })
})

