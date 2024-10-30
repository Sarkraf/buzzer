class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find_by(name: params[:name])
  end

  def choice
    @party = Party.find_by(name: params[:name])
    @groups = @party.groups
    @group = Group.new
  end

  def manager
    @party = Party.find_by(name: params[:name])
  end
end
