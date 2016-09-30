App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	#alert data['message']
    #UIkit.notify 'Заказ оформлен', {status:'info'}   
    
    $('#messages').append data['message']
    audio = new Audio "/assets/be.wav"
    audio.play()
    # Called when there's incoming data on the websocket for this channel

  speak: (message)->
    @perform 'speak', message: message
    # audio = new Audio "/assets/be.wav"
    # audio.play()
    UIkit.notify("Заказ оформлен!", {status:'success'})
    
$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ""
    event.preventDefault()
    