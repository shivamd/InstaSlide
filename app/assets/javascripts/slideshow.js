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
    $('body').on("keydown", this.checkEvent);
  },

  displaySlide: function(){
    var photoIndex = $(this).parent().index('li.photo')
    slideshow.currentIndex = photoIndex
    $('div.slide').show();
    slideshow.displayImage();
  },

  displayImage: function(){
    $('div.content').html("<img src='"+slideshow.photos[slideshow.currentIndex]+"'>");
  },

  checkEvent: function(event){
    if (event.which === 39){
      slideshow.incrementIndex();
    } else if (event.which === 37){
      slideshow.decrementIndex();
    }
    slideshow.displayImage();
  },

  incrementIndex: function(){
    if (slideshow.isLastPhoto()){
         slideshow.currentIndex = 0
    } else {
	 slideshow.currentIndex += 1
    }
  },

  decrementIndex: function(){
    if (slideshow.isFirstPhoto()){
        slideshow.currentIndex = slideshow.photos.length-1
    } else {
	slideshow.currentIndex -= 1;
    }
  },
  
  isLastPhoto: function(){
    return slideshow.currentIndex === slideshow.photos.length-1;
  },

  isFirstPhoto: function(){
    return slideshow.currentIndex === 0;
  },

  hideSlide: function(){
    $('div.slide').hide();
  },

  populatePhotos: function(){
	          for (var i =0; i < $('li.photo').length; i++) { this.photos.push($($('li.photo img')[i]).attr('src')) }
                  
  }
}
