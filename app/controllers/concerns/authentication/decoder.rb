# frozen_string_literal: true

module Authentication
  module Decoder
    def authenticate!
      status = decode_token(access_token) 
      if @payload.nil?
        render json: { error: I18n.t("jwt.#{status}") }, status: status
        return 
      end
      current_user
    end

    def current_user
      return if @payload.nil?
      
      @current_user ||= User.find_by(id: @payload['id'])
    end

    def decode_token(token)
      @payload = JWT.decode(token, 
                            SECRETS[:secret_key_base].to_s,
                            true,
                            algorithm: User::ALGORITHM).first
      :success 
    rescue JWT::ExpiredSignature
      :unauthorized
    rescue JWT::ImmatureSignature, JWT::DecodeError
      :unauthorized  
    end

    def access_token
      @access_token ||= request.headers['Authorization']&.gsub('Bearer ', '')
    end
  end
end
