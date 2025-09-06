class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
    @shop.open_time = Time.now
    @shop.close_time = Time.now + 1.hour
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: "新規店舗を登録しました。"
    else
      render :new
    end
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shops_path, notice: "店舗情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path, notice: "店舗を削除しました。"
  end


  private

  def shop_params
    params.require(:shop).permit(:title, :description, :category, :open_time, :close_time)
  end

  
end
