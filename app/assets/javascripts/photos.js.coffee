$ ->
	$('div.main a').click (e) ->
		e.preventDefault()
		album_id = $(this).attr('class')
		$("img.#{album_id}").toggle()
		$("div##{album_id}").toggle()

	$.ajax
			method:'get'
			url: '/slides/facebook-albums'
			success: (albums) ->
				renderAlbums(albums) # render album html to some place in the dom

	renderAlbums = (albums) ->
		for album in albums
			$('#facebook .main').append("<div class='album-info'><a class='#{album['id']} fb-album' href='#'>#{album['name']}</a>
			<img src=#{album['cover_photo']} width='100' height= '100' class='#{album['id']} fb-album'></div>")

	$('#facebook').on 'click', '.fb-album', (e) ->
		album_id = $(@).attr('class').split(' ')[0]
		e.preventDefault()
		$.ajax
		  method: "get"
		  url: "/slides/#{album_id}/photos"
		  success: (photos) ->
		  	renderPhotos(photos)
		$(@).parent().children('img').toggle()

	renderPhotos = (photos) ->
		for photo in photos
			$('div.fb-photos').append("<img src='#{photo['source']}' width='100' height='100'>")
