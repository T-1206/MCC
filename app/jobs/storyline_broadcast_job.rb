class StorylineBroadcastJob < ApplicationJob
  queue_as :default
  def perform(storyline)
    ActionCable.server.broadcast'storyline_channel',{storyline: render_message(storyline)}
  end


  private
  def render_message(storyline)
    ApplicationController.renderer.render(partial: 'storylines/storyline', locals: { storyline: storyline})
  end
end
