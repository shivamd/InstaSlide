$ ->
	$('div.main a').click (e) ->
		e.preventDefault()
		album_id = $(this).attr('class')
		$("img.#{album_id}").toggle()
		$("div##{album_id}").toggle()

