module API
  class EstablishmentsController < ApplicationController

    # no need?
    # def index
    #   render json: Establishment.all
    # end

    def show
      render json: Establishment.find(params[:id])
    end

    def create
      @establishment = Establishment.new(establishment_params)

      if @establishment.save
        render json: @establishment, status: 201
      else
        render json: {errors: @establishment.errors}, status: 422
      end
    end

    def update
      @establishment = Establishment.find(params[:id])

      if @establishment.update(establishment_params)
        render json: @establishment, status: 202
      else
        render json: {errors: @establishment.errors}, status: 422
      end
    end

    def destroy
      @establishment = Establishment.find(params[:id])
      @establishment.destroy
      render json: :no_content
    end

    private
    def location_params
      params.require(:establishment).permit(:name, :address, :phone_number, :hours, :image_url, :category)
    end

  end #EstablishmentsController ENDs
end # API ENDs
