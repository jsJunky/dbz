$ = React.DOM

MessageForm = React.createClass
    getInitialState: ->
        {text: ''}

    handleSubmit: (e) ->
        e.preventDefault()
        message = {
            user: @props.user
            text: @state.text
        }
        @props.onMessageSubmit message
        @setState {text: ''}
        return

    changeHandler: (e) ->
        @setState {text: e.target.value}
        return

    render: ->
        $.div className: 'message_form',
            $.h3 {}, 'Write New Message'
            $.form onSubmit: @handleSubmit,
                $.input onChange: @changeHandler, value: @state.text

module.exports = MessageForm