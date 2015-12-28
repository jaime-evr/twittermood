class SessionsController < ApplicationController
  def create
    User.find_or_create_from_auth_hash(auth_hash)
    redirect_to root_path
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
