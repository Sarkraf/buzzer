class PartiesController < ApplicationController
  before_action :set_party, only: %i[show choice display_group next_round next_try fetch_data update_score]
  skip_before_action :verify_authenticity_token, only: %i[update_score]

  def set_party
    @party = Party.find_by(name: params[:name])
  end

  def index
    @parties = Party.all
  end

  def show
    @groups = @party.groups
  end

  def choice
    @group = Group.new
    @groups = @party.groups

    @avatars = @party.avatars

  end

  def display_group
    @group = @party.buzzs.last_buzzed.group
    @avatar = @group.avatar
  end

  def manager
    @party = Party.find_by(url: params[:url])
    @groups = @party.groups
    redirect_to root_path, alert: "Party not found" if @party.nil?
  end

  def next_round
    # set score
    @party.next_round
  end

  def next_try
    @party.next_try
  end

  def update_score
    @group = @party.buzzs.last_buzzed.group
    if @group.update_score(params[:operator], params[:value])
      # next round
      PartyChannel.broadcast_to(@party, { action: "update_score", party: @party, groups: @party.ranked_groups, operator: params[:operator] })
    end
  end

  def fetch_data
    render json: { party: @party }
  end
end
