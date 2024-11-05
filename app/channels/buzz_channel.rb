class BuzzChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @buzz = Buzz.find(params[:id])
    if @buzz
      stream_for @buzz
    else
      reject
    end
  end

  def confirm_subscription
    BuzzChannel.broadcast_to(@buzz, { action: "initial_state", buzz: @buzz })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
