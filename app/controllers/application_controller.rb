class ApplicationController < ActionController::Base
 #before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_admin!, if: :admin_url
before_action :authenticate_customer!, if: :customer_url

   private
   def admin_url
     request.fullpath.starts_with?('/admin')
   end
   
   def customer_url
     request.fullpath.starts_with?('/cart_items')
   end

   def after_sign_in_path_for(resource)
     case resource
     when Admin
         admin_root_path
     when Customer
         root_path
     end
   end
   
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
       new_admin_session_path
    elsif resource_or_scope == :customer
       root_path
    end
  end

#   private
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :encrypted_password])
#     devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :phone_number, :zip_code, :address, :first_name_kana, :last_name_kana, :first_name, :last_name])
#     devise_parameter_sanitizer.permit(:account_update, keys:[:email, :phone_number, :zip_code, :address, :first_name_kana, :last_name_kana, :first_name, :last_name])
#   end

end
