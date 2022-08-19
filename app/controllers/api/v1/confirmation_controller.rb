class Api::V1::ConfirmationController < Api::V1::ApiController
  skip_before_action :authenticate_request
  
  def create
    user = User.find(params[:id])
    user.confirmed = true
    user.save
    render json: "Your account has been confirmed successfully!"
  end

end