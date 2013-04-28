$ ->
	$('#facebook').show()
	$('.tabs div').click (e) ->
		e.preventDefault()
		id = $(@).find('a').attr 'href'
		$('.photos > div').hide()
		$('.tabs div.active').removeClass 'active'
		$(id).show()
		$(@).addClass('active')
