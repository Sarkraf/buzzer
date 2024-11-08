class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    if @group.save
      @group.avatar.take
      redirect_to party_group_path(@group.party.name, @group.name)
    else
      @party = @group.party
      @groups = @party.groups
      @avatars = @party.avatars
      @group = Group.new
      redirect_to request.referer, status: :unprocessable_entity
    end
  end

  def show
    @group = Group.find_by(name: params[:name])
    @buzz = @group.buzz
  end

  private

  def group_params
    params.require(:group).permit(:name, :party_id, :avatar_id)
  end
end
