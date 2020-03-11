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

  $('.sort-box').on('change', function(){
    var select = $('option:selected').val();
    $.ajax({
      type: 'GET',
      url: '/pictures',
      data: { judge: select },
      dataType: 'json'
    })
    .done(function(pictures){
      $( '#post-body' ).empty();
      pictures.forEach( function(picture) {
        var html = buildpost(picture);
        $('#post-body').append( html );
      });
    })
  })
})