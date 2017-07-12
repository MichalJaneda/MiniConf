class RegistrationsController < Devise::RegistrationsController

  USER_FIELDS = [:first_name, :last_name, :email, :password, :password_confirmation]

  private

  def sign_up_params
    params.require(:user).permit(*USER_FIELDS)
  end

  def account_update_params
    params.require(:user).permit(*USER_FIELDS, :current_password)
  end

end