class StorylineChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "storyline_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #ActionCable.server.broadcast('storyline_channel', {storyline: data['storyline']})
    Storyline.create! title: data['storyline']
  end
end
