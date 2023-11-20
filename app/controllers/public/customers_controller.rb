class Public::CustomersController < ApplicationController
  def  index
  end

  def show
    @customer = current_customer
  end

  def  edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_information_path
  end

  def check
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.is_active = false
    if @customer.save
      reset_session
      redirect_to root_path
    end
  end 


private
def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email)
end
  def check
  end
end