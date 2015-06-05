module API
  class MeetupsController < ApplicationController
    
    def index
      render json: Meetup.includes(:user).where(:user_id => params[:user_id])
    end

    def show
      render json: Meetup.find(params[:id])
    end

    def create
      @meetup = Meetup.new(meetup_params)

      if @meetup.save
        render json: @meetup, status: 201
      else
        render json: {errors: @meetup.errors}, status: 422
      end
    end

    def update
      @meetup = Meetup.find(params[:id])

      if @meetup.update(meetup_params)
        render json: @meetup, status: 202
      else
        render json: {errors: @meetup.errors}, status: 422
      end
    end

    def destroy
      @meetup = Meetup.find(params[:id])
      @meetup.destroy
      render json: :no_content
    end



    private
    def meetup_params
      params.require(:meetup).permit(:user_id, :date, :time, :establishment_id)
    end
  end
end