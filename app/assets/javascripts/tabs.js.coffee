$ ->
	$('#facebook').show()
	$('.tabs li').click (e) ->
		e.preventDefault()
		id = $(@).find('a').attr 'href'
		$('.photos > div').hide()
		$('.tabs li.active').removeClass 'active'
		$(id).show()
		$(@).addClass('active')
