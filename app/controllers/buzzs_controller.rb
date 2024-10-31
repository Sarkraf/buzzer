class BuzzsController < ApplicationController
  def update
    @buzz = Buzz.find(params[:id])
    @buzz.buzz!
    ActionCable.server.broadcast("buzz_channel", { action: "disable_buzzers", buzz_id: @buzz.id })
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referer }
    end
  end
end
