React = window.React = require("react")
Chat = React.createFactory(require("./components/Message/Chat.coffee"))
mountNode = document.getElementById("app")

React.render Chat(), mountNode