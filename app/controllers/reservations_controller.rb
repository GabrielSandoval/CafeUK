class ReservationsController < ApplicationController
 def index
  	@reservations = Reservation.all
  end
  
  def show
  	@reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	Reservation.create(reservation_params)
  	redirect_to reservations_path
  end

  def update
    reservation = Reservation.find(params[:id])
    if Reservation.update_attributes(reservation_params)
      redirect_to reservations_path, :notice => 'Your reservation has successfully been updated.'
    else
      redirect_to :back, :alert => 'There was an error updating your reservation.'
    end   
  end

  def destroy
    Reservation.destroy(params[:id])
    redirect_to reservations_path, :notice => 'Reservation has been s deleted.'
  end

  private

	  def reservation_params
	  	params.require(:reservation).permit(:table_number, :number_of_people, :date, :time)
	  end

end
