$ = React.DOM

UserList = React.createClass
    render: ->
        renderUser = (user) ->
            $.li {}, user
        $.div className: 'users',
            $.h3 {}, 'Online Users'
            $.ul {}, @props.users.map renderUser

module.exports = UserList