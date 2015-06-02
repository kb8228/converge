module API
  class AuthenticationController < ApplicationController
    respond_to :json
    def sign_in
      #finds a user by email
      user = User.find_by(email: params[:email])
      #if it finds a user and the user's password is correct it'll return the user
      if user && user.authenticate(params[:password])
        user.regenerate_token
        render json: user
      else
        render json: { message: "email or password incorrect" }, status: 422
      end
    end
  end #end class
end #end module