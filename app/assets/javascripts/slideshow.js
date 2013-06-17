$(document).ready(function(){
  slideshow.init();
});


var slideshow = {
  photos: [],

  currentIndex: null,

  init: function(){
	this.addListeners();
	this.populatePhotos();
  },

  addListeners: function(){
    $('div.slideshow img').on("click",this.displaySlide);
    $('div.overlay').on("click", this.hideSlide);
    $('body').on("keydown", this.nextPhoto);
  },

  displaySlide: function(){
    var photoIndex = $(this).parent().index('li.photo')
    slideshow.currentIndex = photoIndex
    $('div.slide').show();
    $('div.content').html("<img src='"+slideshow.photos[photoIndex]+"'>");
  },

  nextPhoto: function(event){
    if ( event.which === 39){
	   debugger
      if (slideshow.currentIndex === (slideshow.photos.length-1)){
	 slideshow.currentIndex = 0
      } else {
	 slideshow.currentIndex += 1
      }
      $('div.content').html("<img src='"+slideshow.photos[slideshow.currentIndex]+"'>");
    }
    else if (event.which === 37){
      if (slideshow.currentIndex === 0){
	 slideshow.currentIndex = slideshow.photos.length-1
      } else {
	slideshow.currentIndex -= 1;
      }
      $('div.content').html("<img src='"+slideshow.photos[slideshow.currentIndex]+"'>");
    }
  },

  hideSlide: function(){
    $('div.slide').hide();
  },

  populatePhotos: function(){
	          for (var i =0; i < $('li.photo').length; i++) { this.photos.push($($('li.photo img')[i]).attr('src')) }
                  
  }
}
