// $(function(){
//   function buildfavorite(favorite_pic, num){

//     var html =`
//             <div class="like-image-items favorite-id${num}" >
//               <a class="like-btn" href="#">
//                 <div class="like-image-items__icon">
//                   <img class="current-user-image" src= ${favorite_pic.image}>
//                 </div>
//               </a>
//             </div>`
//             return html;
//   };
//   $('.image-favorite').on('click', function(e){
//     e.preventDefault();
//     var href = this.href;
//     var numbers = href.match(new RegExp("\\d+","g"));
//     picture_id = numbers[0];
//     judg_id = numbers[1];
//     var num = picture_id;
//     if($(`.favorite-id${num}`).length){
//       var numbers = href.match(new RegExp("\\d+","g"));
//       picture_id = numbers[0];
//       judg_id = numbers[1];
//       $.ajax({
//         type: "DELETE",
//         url: `/favorites/${picture_id}`,
//         data: {picture_id: picture_id, judg_id: judg_id},
//         dataType: 'json'
//       })
//       .done(function(){
//         var num = picture_id;
//         $(`.favorite-id${num}`).remove();
//         $('#favorite-lists').animate({ scrollTop: $('#favorite-lists')[0].scrollHeight});
//       })
//       .fail(function(){
//         alert('エラー');
//       })

//     } else {
//       var numbers = href.match(new RegExp("\\d+","g"));
//       picture_id = numbers[0];
//       judg_id = numbers[1];
//       $.ajax({
//         type: "POST",
//         url: `/pictures/${picture_id}/add`,
//         data: {picture_id: picture_id, judg_id: judg_id},
//         dataType: 'json'
        
//       })
//       .done(function(picture){
//         var num = picture_id;
//         var html = buildfavorite(picture, num);
//         $('#favorite-lists').append(html);
//         $('#favorite-lists').animate({ scrollTop: $('#favorite-lists')[0].scrollHeight});
//       })
//       .fail(function(){
//         alert('エラー');
//       })
//     }
//   })
// })