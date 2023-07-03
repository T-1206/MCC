import consumer from "channels/consumer"

 // appRoomという定数に格納
consumer.subscriptions.create("FavoriteChannel", {
  connected() {
      return alert('connected');
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
      return alert(data['post']);
  },

});
