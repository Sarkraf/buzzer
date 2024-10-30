class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to party_group_path(@group.party.name, @group.name)
    else
      @party = @group.party
      render "parties/choice", status: :unprocessable_entity
    end
  end

  def show
    @group = Group.find_by(name: params[:name])
    @buzz = @group.buzz
  end

  private

  def group_params
    params.require(:group).permit(:name, :party_id)
  end
end
