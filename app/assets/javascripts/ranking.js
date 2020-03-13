$(function(){

  buildcoolestHTML =function(data){
    var coolesthtml = `
    <div class="right-items__image" data-coolest-id=${data.idcoolest}>
      <a class="picture-image, image-favorite" rel="nofollow" data-method="post" href="javascript:void(3, 4)">
        <img class="coolest-pic image-url" src=${data.imagecoolest}>
        <input name="[0][picture_id:]" type="hidden">
      </a>
    </div>
    <div class="right-items__nickname">
      <a href="/users/3">${data.nicknamecoolest}
      </a>
    </div>`
    return coolesthtml
  }

  buildcutestHTML =function(data){
    var cutesthtml = `
    <div class="right-items__image" data-coolest-id=${data.idcutest}>
      <a class="picture-image, image-favorite" rel="nofollow" data-method="post" href="javascript:void(3, 4)">
        <img class="coolest-pic image-url" src=${data.imagecutest}>
        <input name="[0][picture_id:]" type="hidden">
      </a>
    </div>
    <div class="right-items__nickname">
      <a href="/users/3">${data.nicknamecutest}
      </a>
    </div>`
    return cutesthtml
  }

  buildcreepiestHTML =function(data){
    var creepiesthtml = `
    <div class="right-items__image" data-coolest-id=${data.idcreepiest}>
      <a class="picture-image, image-favorite" rel="nofollow" data-method="post" href="javascript:void(3, 4)">
        <img class="coolest-pic image-url" src=${data.imagecreepiest}>
        <input name="[0][picture_id:]" type="hidden">
      </a>
    </div>
    <div class="right-items__nickname">
      <a href="/users/3">${data.nicknamecreepiest}
      </a>
    </div>`
    return creepiesthtml
  }



  var reloadBests = function() {
      $.ajax({
        url: "api/rankings",
        type: 'get',
        dataType: 'json'
      })
      .done(function(bests) {
        $('.right-items').empty();
        var coolesthtml = buildcoolestHTML(bests)
        $('.right-items').append(coolesthtml);

        $('.center-items').empty();
        var cutesthtml = buildcutestHTML(bests)
        $('.center-items').append(cutesthtml);

        $('.left-items').empty();
        var creepiesthtml = buildcreepiestHTML(bests)
        $('.left-items').append(creepiesthtml);
      })
      .fail(function() {
        alert('error ranking');
      });
    }
    setInterval(reloadBests, 43200000);
})


a


