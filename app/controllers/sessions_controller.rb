class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
      user = User.find_by(email: params[:user][:email])
  
      if user && user.valid_password?(params[:user][:password])
        sign_in user
        render json: { message: 'Successful login', user: user }, status: :ok
      else
        render json: { error: 'Failed login attempt' }, status: :unauthorized
      end
    end
  
    def destroy
      sign_out current_user
      render json: { message: 'Successful logout' }, status: :ok
    end
  end
  