class GroupChannel < ApplicationCable::Channel
  def subscribed
    @party = Party.find_by(name: params[:name])
    @avatars = @party.avatars
    if @party
      stream_for @party
    else
      reject
    end
    # stream_from "some_channel"
  end

  def confirm_subscription
    GroupChannel.broadcast_to(@party, { action: "initial_state", party: @party, avatars: @avatars })
  end

  def take_avatar(data)
    avatar.find_by(data).take
  end

  def release_avatar(data)
    avatar.find_by(data).release
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
