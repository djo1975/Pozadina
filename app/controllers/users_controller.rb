class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find(params[:id])
      render json:  current_user
    end
  
    # Dodajte ostale metode prema vašim potrebama
  end
  