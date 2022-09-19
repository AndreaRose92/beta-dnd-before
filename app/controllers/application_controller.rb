class ApplicationController < ActionController::API
    include ActionController::Cookies
    require 'rest-client'

    before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def api_url endpoint
        return "http://www.dnd5eapi.co#{endpoint}"
    end

    def current_user
        user = User.find_by(id: session[:user_id])
        user
    end

    def render_not_found invalid
        render json: {error: invalid.message}, status: :not_found
    end

    def render_invalid invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authorize
        return render json: {error: 'Not Authorized'}, status: :unauthorized unless current_user
    end

end
