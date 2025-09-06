class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @shops = Shop.all
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

  


end
