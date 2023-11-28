class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @addresses = current_customer.addresses

    if @address.save
      flash[:success] = '配送先を登録しました'
      redirect_to addresses_path
    else
      flash[:danger] = '必要情報を入力してください/郵便番号はハイフンを使わず7文字で入力してください。'
      render "index"
    end
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      flash[:success] = "配送先の変更内容を保存しました。"
      redirect_to addresses_path
    else
      flash[:danger] = "配送先の変更内容に不備があります/郵便番号はハイフンを使わず7文字で入力してください。"
      redirect_to addresses_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:success] = '削除しました'
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :address, :zip_code)
  end
end