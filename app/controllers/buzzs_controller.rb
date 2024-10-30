class BuzzsController < ApplicationController
  def buzz!
    @buzz = Buzz.find(params[:id])
    @buzz.update!(clicked: true)
  end
end
