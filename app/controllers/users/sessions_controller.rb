class Users::SessionsController < Devise::SessionsController
 before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  #def create
  #  super
  #  current_user.latitude = user_params[:latitude]
  #  current_user.longitude = user_params[:longitude]
  #  current_user.save
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
#The path used after sign up.
   


 protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:latitude, :longitude)
    end
  end

end
