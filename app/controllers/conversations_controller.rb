class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.where("username LIKE ?", "%#{params[:search]}%")
  end
end
