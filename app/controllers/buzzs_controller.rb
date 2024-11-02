class BuzzsController < ApplicationController
  def update
    @buzz = Buzz.find(params[:id])
    @party = Party.find_by(name: params[:party_name])
    @buzz.buzz!
    @party.disable_buzzs
    ActionCable.server.broadcast("buzz_channel", { action: "disable_buzzers", buzz: @buzz })

    # respond_to do |format|
    #   format.turbo_stream
    #   format.html { redirect_to request.referer }
    # end
  end
end
