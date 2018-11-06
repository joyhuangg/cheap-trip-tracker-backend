class ApplicationController < ActionController::API
  # include Keys
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, ENV['KEY'])
  end

  def auth_header
      # { 'Authorization': '<token>' }
      request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header
      # headers: { 'Authorization': '<token>' }
      begin
        JWT.decode(token, ENV['KEY'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end



  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      return @user = User.find_by(id: user_id)
    else
      return
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
