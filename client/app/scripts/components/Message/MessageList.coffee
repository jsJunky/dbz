$ = React.DOM

Message = require './Message.coffee'
MessageList = React.createClass
    render: ->
        renderMessage = (message) ->
            Message user: message.user, text: message.text
        $.div className: 'messages',
            $.h2 {}, ' Conversation: '
            @props.messages.map renderMessage

module.exports = MessageList