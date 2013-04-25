$ ->
	$('div.main').on 'click', '.fb-album', (e) ->
		e.preventDefault()
		id = $(this).attr('class').split(' ')[0]
		$("img.#{id}").toggle()
		$(@).siblings('.fb-photos').toggle()

	$.ajax
		method:'get'
		url: '/slides/facebook-albums'
		success: (albums) ->
			renderAlbums(albums)
			callToPhotos(albums)

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
		    url: "/slides/#{album['id']}/photos"
		    success: (photos) ->
		      renderPhotos(photos, album['id'])

	renderPhotos = (photos, album_id) ->
	  $("div##{album_id}").append("<div class='fb-photos'</div>")
	  for photo in photos
		  $("div##{album_id} .fb-photos").append("<img class='slideshow' src='#{photo['source']}' width='100' height='100'>")

	$('#facebook').on 'click', '.fb-photos img.slideshow', ->
		$(@).toggleClass('selected')
		image_url = $(@).attr('src');
		$('form').append("<input type='hidden' name='photos[]' value='#{image_url}'>");







