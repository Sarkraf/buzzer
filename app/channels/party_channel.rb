class PartyChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @party = Party.find_by(name: params[:name])
    if @party
      stream_for @party
    else
      reject
    end
  end

  def confirm_subscription
    PartyChannel.broadcast_to(@party, { action: "initial_state", party: @party, groups: @party.ranked_groups })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
