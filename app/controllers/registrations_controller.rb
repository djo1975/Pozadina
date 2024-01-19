class RegistrationsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def create
      if User.exists?(email: registration_params[:email])
        render json: { error: 'Email is already taken' }, status: :unprocessable_entity
      else
        user = User.new(registration_params)
  
        if user.save
          sign_in user
          render json: { message: 'Successful registration', user: user }, status: :created
        else
          render json: { error: 'Failed registration attempt', details: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  
    def options
        head :ok
      end
      
    private
  
    def registration_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :nickname,
        :first_name,
        :last_name,
        :gender,
        :age,
        :country,
        :occupation
      )
    end
  end
  