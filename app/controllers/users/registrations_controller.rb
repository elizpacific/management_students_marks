# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private
  def respond_with(_resource, _opts = {})
    register_success && return if _resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up successfully',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: {
      message: 'Something went wrong',
    }, status: :unprocessable_entity
  end
end
