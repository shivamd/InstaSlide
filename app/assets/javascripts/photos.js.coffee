$ ->
	$('div.main').on 'click', '.fb-album', (e) ->
		e.preventDefault()
		id = $(this).attr('class').split(' ')[0]
		$("img.#{id}").toggle()
		$(@).siblings('.fb-photos').toggle()

	$.ajax
		method:'get'
		url: '/photos/facebook-albums'
		success: (albums) ->
			renderAlbums(albums)
			callToPhotos(albums)
	$.ajax
	  method: 'get'
	  url: '/photos/instagram-photos'
	  success: (photos) ->
	  	renderInstagramPhotos(photos)

	renderAlbums = (albums) ->
		for album in albums
			$('#facebook .main').append("<div id='#{ album['id'] }' class='album-info'><a class='#{album['id']} fb-album' href='#'>#{album['name']}</a>
			<img src=#{album['cover_photo']} width='100' height= '100' class='#{album['id']} fb-album'></div>")

	callToPhotos = (albums) ->
		for album in albums
			getPhotos(album)

	getPhotos = (album) ->
		  $.ajax
		    method: "get"
		    url: "/photos/#{album['id']}/photos"
		    success: (photos) ->
		      renderPhotos(photos, album['id'])

	renderPhotos = (photos, album_id) ->
	  $("div##{album_id}").append("<div class='fb-photos'</div>")
	  for photo in photos
	  	debugger
		  $("div##{album_id} .fb-photos").append("<img class='slideshow'
		  	                                           data-standard-image='#{photo['source']}'
		  	                                           src='#{photo['picture']}'>")

	renderInstagramPhotos = (photos) ->
		for photo in photos
			$("div.instagram-photos").append("<img class='slideshow'
				                                     data-standard-image='#{photo.images.standard_resolution.url}'
				                                     src='#{photo.images.thumbnail.url}'>")

	$('#facebook').on 'click', '.fb-photos img.slideshow', ->
		image_url = $(@).attr('src');
		hidden_field = "<input type='hidden' name='photos[]' value='#{image_url}'>"
		$(@).toggleClass('selected')
		if $(@).hasClass('selected')
		  $('form').append(hidden_field)
		else
		  $("form input[value='#{image_url}']").remove()







