class CharactersController < ApplicationController
  def index
    render json: Character.where(user: current_user)
  end

  def show
    render json: find_id
  end

  def create
    char = find_character
    if char
      char.update!(basics_applied)
    else
      char = Character.create!(basics_applied)
    end
    render json: char, serializer: NewCharacterSerializer, status: :created
  end

  def finalize_new_character
    char = find_character
    char.update!(stats_params)
    char.update(image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
    char.calculate_hp(hp_params)
    params[:skill_choices].each do |skill| CharacterSkill.create!(character: char, skill: Skill.find_by(name: skill)) end
    char.dnd_class.skills.last(2).each do |save| CharacterSkill.create!(character: char, skill: save) end
    if char.race.skills != []
      char.race.skills.each do |skill| CharacterSkill.create!(character: char, skill: skill) end
    end
    params[:spell_choices].each do |spell| CharacterSpell.create!(character: char, spell: Spell.find_by(name: spell)) end
    render json: char, status: :accepted
  end

  def update
    char = find_character
    char.update!(stats_params)
    char.calculate_hp(hp_params)
    params[:skill_choices].each do |skill|
      CharacterSkill.create(character: char, skill: Skill.find_by(name: skill["name"]))
    end
    render json: char, status: :accepted
  end

  def health
    char = Character.find(params[:id])
    char.update(current_hp: hp_params[:current_hp].clamp(0, char.max_hp))
    render json: char, status: :accepted
  end

  def destroy
    find_id.destroy
    head :no_content
  end

  private

  def find_character
    Character.find_by(name: params[:name], user: current_user)
  end

  def find_id
    Character.find(params[:id])
  end

  def basics_params
    params.permit(:name, :dnd_class, :race, :level)
  end

  def basics_applied
    {
      name: basics_params[:name],
      dnd_class: DndClass.find_by(index: basics_params[:dnd_class]),
      race: Race.find_by(index: basics_params[:race]),
      level: basics_params[:level].to_i,
      user: current_user,
    }
  end

  def stats_params
    params.permit(:name, :level, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma)
  end

  def new_char_params
    params.permit(:skill_choices, :spell_choices)
  end

  def hp_params
    params.permit(:max_hp, :current_hp, :hp_option, :hp_values)
  end
end
