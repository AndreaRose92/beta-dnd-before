class CharactersController < ApplicationController
  def index
    render json: Character.where(user_id: current_user.id)
  end

  def show
    render json: find_character
  end

  def create
    char = Character.create!(char_params)
    char.calculate_hp(params[:hp_option], params[:hp_values])
    params[:proficiency_choices].each do |prof| CharSkill.create!(character_id: char, proficiency_id: Proficiency.find_by(name: prof)) end
    char.dnd_class.proficiencies.each do |prof| CharSkill.create!(character: char, proficiency: prof) end
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
    params.permit(:name, :level, :user_id, :dnd_class_id, :race_id, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma, :hp, :current_hp, :hp_option, :hp_values, :proficiency_choices)
  end
end
