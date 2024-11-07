class BuzzsController < ApplicationController
  def update
    @buzz = Buzz.find(params[:id])
    @party = @buzz.party

    if @buzz.clickable
      @buzz.buzz!
      @party.disable_buzzs
      PartyChannel.broadcast_to(@party, { action: "buzz", group: @buzz.group, buzz: @buzz, avatar: @buzz.group.avatar })
    end

    # respond_to do |format|
    #   format.turbo_stream
    #   format.html { redirect_to request.referer }
    # end
  end
end
