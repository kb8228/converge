module API
  class UsersController < ApplicationController
    before_action :restrict_access, only: [:show, :update, :destroy]
    # def index
    #   render json: User.all
    # end

    def show
      render json: User.find(params[:id])
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: 201
      else
        render json: {errors: @user.errors}, status: 422
      end
    end
    
    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        render json: @user, status: 200
      else
        render json: {errors: @user.errors}, status: 422
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: :no_content
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :token)
      end

      def restrict_access
        token = User.find_by(token: params[:token])
        render json: {error:"You need to be logged in to access this page"}, status: 401 unless token
      end

  end
end
