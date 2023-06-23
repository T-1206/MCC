import consumer from "channels/consumer"

// appRoomという定数に格納
const appRoom = consumer.subscriptions.create("StorylineChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const storylines = document.getElementById('storylines');
    storylines.insertAdjacentHTML('beforeend', data['storyline']);
    return alert(data['storyline']);
  },

  speak: function(message) {
    return this.perform('speak', {storyline: message});
  }
});

window.document.onkeydown = function(event) {
  if(event.key === 'Enter') {
    appRoom.speak(event.target.value);
    event.target.value = '';
    event.preventDefault();
  }
}
