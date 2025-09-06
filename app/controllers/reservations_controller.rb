class ReservationsController < ApplicationController
  before_action :set_shop
 
  def index
    @reservations = Reservation.all
    @shops = Shop.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
        redirect_to @reservation, notice: "予約情報を作成しました。"
    else
        render :new
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "予約情報を削除しました。"
  end


  private

  def set_shop
    @shop = Shop.find(params[:shop_id]) if params[:shop_id]
  end

  def set_reservation
    @reservation = @shop.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :shop_id, :reservation_time)
  end


end
