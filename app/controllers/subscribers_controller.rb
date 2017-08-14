class SubscribersController < ApplicationController

  def index
    @subscribers = current_user.subscribers.all
  end

  def create
  end

  def destroy
  end
end
