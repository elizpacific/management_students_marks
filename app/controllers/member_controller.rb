# frozen_string_literal: true
class MemberController < ApplicationController
  before_action :authenticate_user!

  def show
    user = get_from_user_token
    render json: {
      message: "If you see this, you`re in!",
      user: user
    }
  end

  private
  def get_from_user_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    user = User.find(user_id.to_s)
  end
end
