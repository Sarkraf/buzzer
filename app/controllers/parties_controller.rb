class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def choice
    @party = Party.find_by(name: params[:name])
  end

  def show
    @party = Party.find_by(name: params[:name])
  end
end
