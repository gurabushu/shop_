class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :shop_not_found

  def index
    @shops = Shop.all
  end

  def new
    now = Time.zone.now
    @shop = Shop.new(open_time: now, close_time: now + 1.hour)
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: "新規店舗を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @shop.update(shop_params)
      redirect_to shops_path, notice: "店舗情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
  respond_to do |format|
    format.turbo_stream                 # ← これを追加
    format.html { redirect_to shops_path, notice: "店舗を削除しました。" }
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:title, :description, :category, :open_time, :close_time)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_not_found
    redirect_to shops_path, alert: "指定の店舗が見つかりません（削除済みの可能性）"
  end
end