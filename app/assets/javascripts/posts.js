$(function(){

  function buildpost(data){
    var html = `
        <div class="app-main__body__group">
          <div class="picture-image">
            <a rel="nofollow" data-method="post" href="/pictures/8/add?judg_id=4"><img class="image-url" alt="image.url" src = ${data.image}>
            </a>
          </div>
          <div class="review-group">
            <div class="picture-name">
              ${data.nickname}
            </div>
            <div class="review-items">
              <div class="review-items__icons">
                <div class="review-items__icons__left">
                  <a rel="nofollow" data-method="post" href="/pictures/8/add?judg_id=1"><i class="fas fa-grin-stars fa-5x"></i>
                  </a>
                </div>
              <div class="review-items__icons__center">
                <a rel="nofollow" data-method="post" href="/pictures/8/add?judg_id=2"><i class="far fa-grin-hearts fa-5x"></i>
                </a>
              </div>
              <div class="review-items__icons__right">
                <a rel="nofollow" data-method="post" href="/pictures/8/add?judg_id=3"><i class="far fa-flushed fa-5x"></i>
                </a>
              </div>
            </div>
            <div class="review-items__comments">
              <div class="comments-box">
                <div class="input-box"></div>
                </div>
              </div>
            </div>
          </div>
        </div>`
    return html;
  }


  $("#new_picture").on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      $( function() {
        $.ajax({
          type: 'GET',
          url: '/pictures',
          data: { judge: 0 },
          dataType: 'json'
        })
        .done(function(pictures){
          $( '#post-body' ).empty();
          pictures.forEach( function(picture) {
            var html = buildpost(picture);
            $('#post-body').append( html );
          });
        })
      });
      $(".submit-btn").removeAttr("disabled");
      $('form')[0].reset();
    })
    .fail(function(){
      alert('エラー');
    })
  })
});


