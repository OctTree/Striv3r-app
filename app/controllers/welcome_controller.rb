class WelcomeController < ApplicationController
  def index
    redirect_to new_admin_user_session_path
  end
end
