class ApplicationController < ActionController::API
    include ActionController::Cookies
    require 'rest-client'

    before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def api_url
        return "http://www.dnd5eapi.co/api"
    end

    def current_user
        User.find_by(id: session[:user_id])
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

    def stringify_fetch array
        array.pluck("name").join(", ")
      end
    
      def parse_stat string
        case string
        when "STR"
          "Strength"
        when "DEX"
          "Dexterity"
        when "CON"
          "Constitution"
        when "INT"
          "Intelligence"
        when "WIS"
          "Wisdom"
        when "CHA"
          "Charisma"
        end
      end
    
      def find_abi array
        stat_bonuses = {
          Strength: 0,
          Dexterity: 0,
          Constitution: 0,
          Intelligence: 0,
          Wisdom: 0,
          Charisma: 0,
        }
        array.each { |stat| 
          stat_bonuses[parse_stat(stat["ability_score"]["name"])] = stat["bonus"]
        }
        stat_bonuses
      end

end
