/*
 * Zunda Networks specific js scripts
 * Created: 2014/01/13 09:39:31
 * Author : Kwabi<kwabispace@gmail.com>
 * Updated: 2014/01/29 22:40:39
 *
*/ 
(function() {
  $(function() {
    //slideshow activation 2014/01/13 09:39:31
    $('.carousel').carousel();

    //colorbox for blog posts images with class zoom 2014/01/29 22:40:12
    $('.zoom img, img.zoom').colorbox({
      rel: 'group',
      maxWidth: 800,
      html: function(){
        return '<img src="' + $(this).attr('src') + '">';
      }
    });
  });
}).call(this);
