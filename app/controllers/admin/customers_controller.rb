class Admin::CustomersController < ApplicationController

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "会員情報の変更内容を保存しました。"
      redirect_to '/admin/customers'
    else
      flash[:danger] = "会員情報の変更内容に不備があります/郵便番号はハイフンを使わず7文字で入力してください。"
      render "edit"
    end
  end

  def index
    @customers = Customer.all.page(params[:page]).per(15)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :zip_code, :phone_number, :email, :is_active)
    end

end