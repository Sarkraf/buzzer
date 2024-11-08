class GroupChannel < ApplicationCable::Channel
  def subscribed
    party = Party.find_by(name: params[:party_name])
    stream_from "avatars_channel_#{party.name}"
    # stream_from "some_channel"
  end

  def confirm_subscription
    party = Party.find_by(name: params[:party_name])
    avatars = party.avatars
    # ActionCable.broadcast_to(@party, { action: "avatar_toggle", avatar:, toggle: avatar.taken? })
    ActionCable.server.broadcast("avatars_channel_#{party.name}", { avatars: })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
