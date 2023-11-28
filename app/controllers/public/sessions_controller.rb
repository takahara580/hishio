class Public::SessionsController < Devise::SessionsController
  # ... (existing code)

  # POST /resource/sign_in
  def create
    super do |resource|
      if resource.persisted?
        flash[:success] = "ログインに成功しました。"
      else
        flash[:alert] = "ログインに失敗しました。"
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do
      flash[:danger] = "ログアウトしました。"
    end
  end

  # ... (existing code)
  
  protected
    def customer_state
      @customer = Customer.find_by(email: params[:customer][:email])
      return if !@customer

      if @customer.valid_password?(params[:customer][:password]) && @customer.is_active == false
        redirect_to new_customer_session_path
      end
    end
end
