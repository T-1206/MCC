class StorylineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "storylines"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
