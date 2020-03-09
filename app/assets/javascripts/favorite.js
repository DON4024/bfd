$(function(){
  function buildfavorite(favorite_pic, num){

    var html =`
            <div class="like-image-items favorite-${num}" >
              <a class="like-btn" href="#">
                <div class="like-image-items__icon">
                  <img class="current-user-image" src= ${favorite_pic.image}>
                </div>
              </a>
            </div>`
            return html;
  };


  $('.image-favorite').on('click', function(e){
    e.preventDefault();
    debugger
    var href = this.href;
    var method =$('.image-favorite').data('method');
    if(method=="post"){
      var numbers = href.match(new RegExp("\\d+","g"));
      picture_id = numbers[0];
      judg_id = numbers[1];
      $.ajax({
        type: "POST",
        url: `/pictures/${picture_id}/add`,
        data: {picture_id: picture_id, judg_id: judg_id},
        dataType: 'json'
        
      })
      .done(function(picture){
        var num = picture_id;
        var html = buildfavorite(picture, num);
        $('#favorite-lists').append(html);
        $('#favorite-lists').animate({ scrollTop: $('#favorite-lists')[0].scrollHeight});
      })
      .fail(function(){
        alert('エラー');
      })
    } else if(method=="delete"){
      var numbers = href.match(new RegExp("\\d+","g"));
      picture_id = numbers[0];
      judg_id = numbers[1];
      $.ajax({
        type: "DELETE",
        url: `/favorites/${picture_id}`,
        data: {picture_id: picture_id, judg_id: judg_id},
        dataType: 'json'
      })
      .done(function(){
        debugger
        var num = picture_id;
        $(`favorite-${num}`).remove();
        $('#favorite-lists').animate({ scrollTop: $('#favorite-lists')[0].scrollHeight});
      })
      .fail(function(){
        alert('エラー');
      })
    }
    
  })
})

// pictures.some( function(picture) {
//   var picture_image = picture.image;
//   var num = picture_id;
//   var number = picture_image.match(new RegExp(num));
//   if(number) {
//     var html = buildfavorite(picture, num);
//     $('#favorite-lists').append(html);
//     $('#favorite-lists').animate({ scrollTop: $('#favorite-lists')[0].scrollHeight});
//     return true;
//   }
// });


pictures.some( function(picture) {
  var picture_image = picture.image;
  var num = picture_id;
  var number = picture_image.match(new RegExp(num));
  if(number) {
    var html = buildfavorite(picture, num);
    $('#favorite-lists').remove(html);
    $('#favorite-lists').animate({ scrollTop: $('#favorite-lists')[0].scrollHeight});
    return true;
  }
});