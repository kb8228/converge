module API
  class InviteesController < ApplicationController

    def index
      render json: Invitee.includes(:meetup).where(:meetup_id => params[:meetup_id])
    end

    def show
      render json: Invitee.find(params[:id])
    end

    def create
      @invitee = Invitee.new(invitee_params)

      if @invitee.save
        @invitee.send_invitation_text
        render json: @invitee, status: 201
      else
        render json: {errors: @invitee.errors}, status: 422
      end
    end

    # def update
    #   @invitee = Invitee.find(params[:id])

    #   if @invitee.update(invitee_params)
    #     render json: @invitee, status: 202
    #   else
    #     render json: {errors: @invitee.errors}, status: 422
    #   end
    # end

    def destroy
      @invitee = Invitee.find(params[:id])
      @invitee.destroy
      render json: :no_content
    end

    private
    def invitee_params
      params.require(:invitee).permit(:name, :email, :phone_number, :meetup_id, :address)
    end

  end #InviteesController ENDs
end # API ENDs