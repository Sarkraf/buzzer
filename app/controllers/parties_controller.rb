class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find_by(name: params[:name])
    @groups = @party.groups
    @ranked_groups = @groups.sort_by(&:score).reverse
  end

  def choice
    @party = Party.find_by(name: params[:name])
    @group = Group.new
    @groups = @party.groups
  end

  def manager
    @party = Party.find_by(name: params[:name])
  end

  def next
    reset_all_buzzers
  end

  def reset_all_buzzers
    @party = Party.find_by(name: params[:name])
    @party.reset_buzzs
  end
end
