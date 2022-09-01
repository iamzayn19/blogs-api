
require "jwt"
module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secret_key_base

  def jwt_confirmation_encode(payload,exp = ((2).minutes.from_now.to_i))
    payload[:exp] = exp.to_i
    JWT.encode(payload,SECRET_KEY)
  end 

  def jwt_session_encode(payload,exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload,SECRET_KEY)
  end 

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    rescue JWT::ExpiredSignature, JWT::DecodeError
    false
    HashWithIndifferentAccess.new decoded
  end 
end 