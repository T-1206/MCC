class StorylineBroadcastJob < ApplicationJob
  queue_as :default
  def perform(object)
    objects=render_message(object)
    ActionCable.server.broadcast('storyline_channel', objects)
  end


  private
  def render_message(storyline)
    ApplicationController.renderer.render(partial: 'storylines/storyline', locals: { storyline: storyline})
  end
end
