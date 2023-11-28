# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super do |resource|
      flash[:success] = "ログインに成功しました。" if resource.persisted?
    end

    # ログインに失敗した場合の処理
    flash[:alert] = "ログインに失敗しました。" if resource.persisted?
  end

  # DELETE /resource/sign_out
  def destroy
    super do
      flash[:danger] = "ログアウトしました。"
    end
  end

  # Other actions and configurations...
end

