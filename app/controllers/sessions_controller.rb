class SessionsController < ApplicationController
  skip_before_filter :authorize, :verify_authenticity_token

  def index
  end

  def create
    @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    self.current_user = @user

    redirect_to '/', :notice => "Signed in!"
  end

  def destroy
    self.current_user = nil
    redirect_to '/', :notice => "Signed out!"
  end
end
