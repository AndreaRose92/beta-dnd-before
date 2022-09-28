class CharactersController < ApplicationController
  def index
    render json: Character.where(user_id: current_user.id)
  end

  def show
    render json: find_character
  end

  def create
    # char = Character.create!(char_params)
    char = Character.create!(
      name: params[:name],
      level: params[:level],
      Strength: params[:Strength],
      Dexterity: params[:Dexterity],
      Constitution: params[:Constitution],
      Intelligence: params[:Intelligence],
      Wisdom: params[:Wisdom],
      Charisma: params[:Charisma],
      user: User.find_by(username: params[:user]),
      dnd_class: DndClass.find_by(name: params[:dnd_class]),
      race: Race.find_by(name: params[:race]),
    )
    # char.update!(char_params)
    char.calculate_hp(params[:hp_option], params[:hp_values])
    params[:proficiency_choices].each do |prof| CharSkill.create!(character_id: char.id, proficiency_id: Proficiency.find_by(name: prof).id) end
    char.dnd_class.proficiencies.last(2).each do |prof| CharSkill.create!(character_id: char.id, proficiency_id: prof.id) end
    params[:starting_spells].each do |spell| CharSpell.create!(character_id: char.id, spell_id: Spell.find_by(name: spell).id) end
    render json: char, status: :created
  end

  def update
    char = find_character
    char.update!(char_params)
    
    render json: char, status: :accepted
  end

  def destroy
    find_character.destroy
    head :no_content
  end

  private

  def find_character
    Character.find(params[:id])
  end

  def char_params
    params.permit(:name, :level, :user_id, :dnd_class_id, :race_id, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma, :hp, :current_hp, :hp_option, :hp_values, :proficiency_choices, :user, :dnd_class, :race, :starting_spells)
  end
end
