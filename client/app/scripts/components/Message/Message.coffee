$ = React.DOM

Message = React.createClass
    render: ->
        $.div className: 'message',
            $.strong {}, @props.user
            @props.text

module.exports = Message