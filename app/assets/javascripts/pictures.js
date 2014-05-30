$(document).ready(function(){
  $(".options").on('click', function(e){
      e.preventDefault();
      var dataSet = $(this).attr('data-type');
      var data = $(this).html();



      $.get('/user/find_pics', { 'data' : data, 'dataSet' : dataSet }, function(response){
          console.log(response);
          $('#loc_ind').fadeOut(500, function(){
            iterateThroughImages(response);
          })

      }, 'json');



  });

});

var iterateThroughImages = function(response) {
   for (ind in response) {
            var img = response[ind].img_url
            var name = response[ind].name
            if (!(img == null)) {
                addImages(img, name);

            }
    }
}


var addImages = function(img_url, name) {
      $('#img_holder').append("<aside class='img_box'><img src='" + img_url + "'/><h5>" + name + "</h5></aside>");

}
