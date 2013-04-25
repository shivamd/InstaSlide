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
