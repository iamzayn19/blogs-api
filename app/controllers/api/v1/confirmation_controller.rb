class Api::V1::ConfirmationController < Api::V1::ApiController
  include JsonWebToken
  skip_before_action :authenticate_request

  def create
    @token = params["token"]
    decoded = jwt_decode(@token)
    if decoded.empty?
      user = User.find(params[:id])
      token = jwt_confirmation_encode(user_id: user.id)
      UserMailer.resend_confirmation(user,token).deliver
      render json: "Your token has expired. Please wait for the new confirmation token."
    else 
      @current_user = User.find(decoded["user_id"])
      @current_user.confirmed = true
      @current_user.save
      render json: "Your account has been confirmed successfully!"
    end
  end

end