class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find_by(name: params[:name])
    @groups = @party.groups
    @ranked_groups = @party.groups.sort_by { |group| group.score }.reverse

  end

  def choice
    @party = Party.find_by(name: params[:name])
    @group = Group.new
    @groups = @party.groups
  end

  def manager
    @party = Party.find_by(name: params[:name])
  end

  def reset_all_buzzers
    @party = Party.find_by(name: params[:name])
    @party.groups.each do |group|
      group.buzzes.each do |buzz|
        buzz.reset_buzzer
      end
    end
  end

  def next
    reset_all_buzzers
  end

end
