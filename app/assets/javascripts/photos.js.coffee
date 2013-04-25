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
			$('#facebook .main').append("<a class='fb-album' href='#'>#{album['name']}</a>
			<img src=#{album['cover_photo']} width='100' height= '100' class='#{album['id']} fb-album'>")
