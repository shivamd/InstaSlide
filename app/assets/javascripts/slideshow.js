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
    $('body').on("keydown", this.checkEvent.bind(this));
  },

  displaySlide: function(){
    var photoIndex = $(this).parent().index('li.photo')
    slideshow.currentIndex = photoIndex
    $('div.slide').show();
    slideshow.displayImage();
  },

  displayImage: function(){
    $('div.content').html("<img src='"+this.photos[this.currentIndex]+"'>");
  },

  checkEvent: function(event){
    if (event.which === 39){
      this.incrementIndex();
    } else if (event.which === 37){
      this.decrementIndex();
    }
    this.displayImage();
  },

  incrementIndex: function(){
    if (this.isLastPhoto()){
        this.currentIndex = 0
    } else {
	this.currentIndex += 1
    }
  },

  decrementIndex: function(){
    if (this.isFirstPhoto()){
        this.currentIndex = this.photos.length-1
    } else {
	this.currentIndex -= 1;
    }
  },
  
  isLastPhoto: function(){
    return this.currentIndex === this.photos.length-1;
  },

  isFirstPhoto: function(){
    return this.currentIndex === 0;
  },

  hideSlide: function(){
    $('div.slide').hide();
  },

  populatePhotos: function(){
    for (var i =0; i < $('li.photo').length; i++) { 
      this.photos.push($($('li.photo img')[i]).attr('src'));
    }
  }
}
