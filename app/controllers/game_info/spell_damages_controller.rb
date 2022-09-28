class SpellDamagesController < ApplicationController

    def show
        render json: SpellDamage.find_by(spell_id: params[:spell_id])
    end

end
