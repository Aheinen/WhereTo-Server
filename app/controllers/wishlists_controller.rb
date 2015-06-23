class WishlistsController < ApplicationController
  def create
    accepted = to_boolean(params[:accepted])
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @user.wishlists.create(event_id: @event.id, accepted: accepted)
    redirect_to user_events_path(@user)
  end

  def index
    @user = User.find(params[:user_id])
    events = Event.where(id: @user.wishlists.where(accepted: true).map{|item| item.event_id})
    render json: {user: @user, events: events}
  end

  private
  def to_boolean(str)
    str == 'true'
  end
end
