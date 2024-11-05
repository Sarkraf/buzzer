class BuzzsController < ApplicationController
  def update
    @buzz = Buzz.find(params[:id])
    @party = @buzz.party
    @buzz.buzz!
    @party.disable_buzzs
    # respond_to do |format|
    #   format.turbo_stream
    #   format.html { redirect_to request.referer }
    # end
  end
end
