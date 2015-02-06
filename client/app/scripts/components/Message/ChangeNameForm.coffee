$ = React.DOM
ChangeNameForm = React.createClass
    getInitialState: ->
    	{newName: ''}

    onKey: (e) ->
    	@setState {newName: e.target.value}
    	return

    handleSubmit: (e) ->
    	e.preventDefault()
    	newName = @state.newName
    	@props.onChangeName newName
    	@setState {newName: ''}
    	return

    render: ->
    	$.div className: 'change_name_form',
    		$.h3 {}, ' Change Name '
    		$.form onSubmit: @handleSubmit,
    		    $.input onChange: @onKey, value: @state.newName

module.exports = ChangeNameForm