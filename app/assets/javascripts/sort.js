$(function(){
  function buildpost(data){
    var html = `
    <div class="app-main__body__group">
    <div class="picture-image" data-post-id=${data.id}>
      <div class="move-flame">
        <a class="image-favorite" rel="nofollow" data-method="delete" href="javascript:void(92, 4)">
          <img class="bests-pic image-url" src=${data.image} alt="Sanji">
        </a>
      </div>
      <div class="review-items__icons__list">
        <div class="review-items__icons__list__left">
          <a rel="nofollow" data-method="post" href="/pictures/92/add?judg_id=1">
            <i class="fas fa-grin-stars fa-3x"></i>
          </a>
        </div>
        <div class="review-items__icons__list__center">
          <a rel="nofollow" data-method="post" href="/pictures/92/add?judg_id=2">
            <i class="far fa-grin-hearts fa-3x"></i>
          </a>
        </div>
        <div class="review-items__icons__list__right">
          <a rel="nofollow" data-method="post" href="/pictures/92/add?judg_id=3">
            <i class="far fa-flushed fa-3x"></i>
          </a>
        </div>
        <a class="move-btn" href="javascriot:void(group-id${data.id})">
          <i class="fas fa-expand fa-2x"></i>
        </a>
      </div>
      <div class="group-id92 review-group">
        <div class="review-group__items">
          <div class="picture-name">
            <a class="btn" href="/users/13">edward
            </a>
          </div>
          <div class="review-items">
            <div class="review-items__content">
              ${data.text}
            </div>
            <div class="review-items__comments">
              <div class="comments-box">
                <form class="new_comment" id="new_comment" action="/pictures/92/comments" accept-charset="UTF-8" method="post">
                  <input name="utf8" type="hidden" value="✓">
                  <input type="hidden" name="authenticity_token" value="1VfGJNuevIl1GZqwVpZV+Fjuls4pstg2qkfYiFVU1EgXf/ITHoYC0hgZvpeKVZS6t4zLxZzDRPJMWqPMePbCeA==">
                  <div class="input-box">
                    <input class="message-box" placeholder="コメントをどうぞ" type="text" name="comment[comments]" id="comment_comments">
                    <input type="submit" name="commit" value="Send" class="submit-btn" data-disable-with="Send">
                  </div>
                </form>
              </div>
            </div>
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
      $(".sort-box").removeAttr("disabled");
    })
  });
})
