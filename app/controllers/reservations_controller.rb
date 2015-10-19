class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    
    if current_user.admin?
      @reservations = Reservation.all.order('date_reserved')
    else
      @reservations = Reservation.joins(:user).where(user: current_user).order('date_reserved')
    end

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
  	reservation = Reservation.new(reservation_params)
    reservation.date_reserved = DateTime.now.in_time_zone("Asia/Manila")
    reservation.user = User.find(current_user)
    reservation.save
  	redirect_to reservations_path
  end

  def update
    reservation = Reservation.find(params[:id])
    if reservation.update_attributes(reservation_params)
      redirect_to reservations_path, :notice => 'Your reservation has successfully been updated.'
    else
      redirect_to :back, :alert => 'There was an error updating your reservation.'
    end   
  end

  def destroy
    Reservation.destroy(params[:id])
    redirect_to reservations_path, :notice => 'Reservation has been deleted.'
  end

  private

	  def reservation_params
	  	params.require(:reservation).permit(:table_number, :number_of_people, :date, :time)
	  end

end
