class AvatarsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[toggle]
  def toggle
    avatar = Avatar.find(params[:id])
    party = avatar.party
    params[:toggle] ? avatar.take : avatar.release
    ActionCable.server.broadcast("avatars_channel_#{party.name}", { avatars: party.avatars, toggle: params[:toggle] })
  end
end
