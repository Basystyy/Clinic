class HomeController < ApplicationController

  def index

  end

  def login_as
    user = User.find_by(phone: params[:phone])
    if user
      sign_in(user)
      redirect_to root_path, notice: "Logged in as #{user.phone} with role #{user.role}"
    else
      redirect_to root_path, alert: "User not found"
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "User not found"
  end
end