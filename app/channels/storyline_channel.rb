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
    Storyline.create!.permit(:title, :subject, :image, :user_id, :tags, :private); data['storyline']
    Talkroom.create!.permit(:user_id, :storyline_id); data['storyline']
  end
end
