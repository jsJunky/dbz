UserList = require './UserList.coffee'
MessageList = require './MessageList.coffee'
MessageForm = require './MessageForm.coffee'
ChangeNameForm = require './ChangeNameForm.coffee'
socket = io.connect 'http://localhost:8000'

$ = React.DOM
Messages = []
Users = []
Chat = React.createClass
    getInitialState: ->
        socket.on 'init', @initialize
        socket.on 'send:message', @messageRecieve
        socket.on 'user:join', @userJoined
        socket.on 'user:left', @userLeft

        {users: [], messages: [], text: ''}

    initialize: (data) ->
        @setState {users: data.users, user: data.name}
        return

    messageRecieve: (message) ->
        @state.messages.push message
        @setState()
        return

    userJoined: (data) ->
        @state.users.push data.name
        @state.messages.push {user: 'Application Bot', text: data.name + ' Joined'}
        @setState()
        return

    userLeft: (data) ->
        index = users.indexOf data.name
        @state.users.splice index, 1
        @state.messages.push {user: 'Application Bot', text: data.name + ' Left'}
        @setState()
        return

    userChangedName: (data) ->
        oldName = data.oldName
        newName = data.newName
        @state.users.splice @state.users.indexOf(oldName), 1, newName
        @state.messages.push {user: 'Application Bot', text: 'Change Name : ' + oldName + ' ==> ' + newName}
        @setState()
        return

    handleMessageSubmit: (message) ->
        @state.messages.push message
        @setState()
        socket.emit 'send:message', message
        return

    handeChangeName: (newName) ->
        oldName = @state.user
        socket.emit 'change:name', {name: newName}, (result) =>
            if !results 
                alert 'There was an error changing your name'
            else
                index = @state.users.indexOf oldName
                @state.users.splice index, 1, newName
                @setState()

    render: ->
        $.div className: '',
            UserList users: @state.users
            MessageList messages: @state.messages
            MessageForm onMessageSubmit: @handleMessageSubmit, user: @state.user
            ChangeNameForm onChangeName: @handleChangeName

module.exports = Chat