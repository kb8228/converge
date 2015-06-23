module API
  class LocationsController < ApplicationController
    skip_before_filter  :verify_authenticity_token
    
    def index
      render json: Location.includes(:meetup).where(:meetup_id => params[:meetup_id])
    end

    def show
      render json: Location.find(params[:id])
    end

    def create
      @location = Location.new(location_params)

      if @location.save
        render json: @location, status: 201
        # if @location.invitee && @location.invitee.meetup.all_responded?
        #   @location.invitee.meetup.find_center(@location.invitee.meetup.coordinates)
        #   @location.invitee.meetup.user.send_convergence_text
        # end
      else
        render json: {errors: @location.errors}, status: 422
      end
    end

    def update
      @location = Location.find(params[:id])

      if @location.update(location_params)
        render json: @location, status: 202
      else
        render json: {errors: @location.errors}, status: 422
      end
    end

    # def destroy
    #   @location = Location.find(params[:id])P
    #   @location.destroy
    #   render json: :no_content
    # end

    private
    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end

  end #LocationsController ENDs
end # API ENDs