$(function(){
  // function buildselect(){
  //   var htmlselect =`
  //         <form action="/" accept-charset="UTF-8" method="post">
  //           <input name="utf8" type="hidden" value="✓">
  //           <input type="hidden" name="authenticity_token" value="soYlvBK2rBkOAEOU9et6kUNTLWbV/q7uC7TqSWftV3aot7GzF/7U9d9x7DYVGdappS2lUWxcpy5RbWKbU4zfRA==">
  //           <select class="sort-box" name="javascript:void()[image]" id="javascript:void__image">
  //             <option value="0">all</option>
  //             <option value="1">cool</option>
  //             <option value="2">cute</option>
  //             <option value="3">creepy</option>
  //           </select>
  //         </form>`

  //   return htmlselect
  // }
  function buildpost(data){
    var html = `
          <div class="app-main__body__group">
            <div class="picture-image" data-post-id=${data.id}>
              <div class="group-id88 move-flame" >
                <i class="fas fa-expand fa-2x"></i>
                <div class="group-id${data.id} review-items__icons">
                </div>
                <a class="image-favorite" rel="nofollow" data-method="post" href="javascript:void(76, 4)">
                  <img class="bests-pic image-url" src=${data.image} alt="%e6%b5%b7%e8%b3%8a">
                  <input name="[0][picture_id:]" type="hidden">
                </a>
              </div>
              <div class="review-items__icons__list">
                <div class="review-items__icons__list__left">
                  <a rel="nofollow" data-method="post" href="/pictures/76/add?judg_id=1">
                    <i class="fas fa-grin-stars fa-3x"></i>
                  </a>
                </div>
                <div class="review-items__icons__list__center">
                  <a rel="nofollow" data-method="post" href="/pictures/76/add?judg_id=2">
                    <i class="far fa-grin-hearts fa-3x"></i>
                  </a>
                </div>
                <div class="review-items__icons__list__right">
                  <a rel="nofollow" data-method="post" href="/pictures/76/add?judg_id=3">
                    <i class="far fa-flushed fa-3x"></i>
                  </a>
                </div>
              </div>
                


              <div class="review-group">
                <div class="review-group__items">
                  <div class="picture-name">
                    ${data.nickname}
                  </div>
                  <div class="review-items">
                    <div class="review-items__content">
                      ${data.content}
                    </div>
                    <div class="review-items__comments">
                      <div class="comments-box">
                        <div class="input-box">
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
      // var htmlselect = buildselect();
      // $('#post-body').append( htmlselect );
      pictures.forEach( function(picture) {
        var html = buildpost(picture);
        $('#post-body').append( html );
      });
      $(".sort-box").removeAttr("disabled");
    })
  });
})
