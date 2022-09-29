class DndClassesController < ApplicationController
     require './db/reference_data.rb'
  skip_before_action :authorize

  def index
    render json: JSON.parse(RestClient.get("#{api_url}/classes"))["results"]
  end

  def show
    dc = DndClass.find_by(api_index: params[:dnd_class])
    if !dc
      dc = parse_class_fetch
      levels = []
      20.times do |c|
        levels << parse_level_show(c + 1)
      end
      dc[:levels] = levels
    end
    render json: dc
  end

  def create
    dc = DndClass.find_or_create_by(api_index: params[:dnd_class]) do |dc|
      dc.update(parse_class_fetch)
    end
    params[:level].to_i.times do |c|
     dcl = DndClassLevel.find_or_create_by(dnd_class_id: dc.id, level: c+1) do |dcl|
          dcl.update(parse_level_fetch)
          features ? dcl.feature_filter(features) : nil
          class_specifics ? dcl.parse_class_specifics(class_specifics) : nil
          dc.create_proficiencies
        end
    end
    render json: dc
  end

  def proficiencies
    amount = DndClass.find(params[:dnd_class]).starting_proficiencies
    skills = DndClass.find(params[:dnd_class]).proficiencies
    data = [skills, amount]
    render json: data
  end

  private

  def fetch_data
    JSON.parse(RestClient.get("#{api_url}/classes/#{params[:dnd_class]}"))
  end

  def fetch_level
    JSON.parse(RestClient.get("#{api_url}/classes/#{params[:dnd_class]}/levels/#{params[:level].to_i}"))
  end

  def parse_class_fetch
    dnd_class_data = {
      name: fetch_data["name"],
      api_index: fetch_data["index"],
      url: fetch_data["url"],
      hit_die: fetch_data["hit_die"],
      recommended_stat_one: parse_stat(fetch_data["saving_throws"][0]["name"]),
      recommended_stat_two: parse_stat(fetch_data["saving_throws"][1]["name"]),
      starting_proficiencies: fetch_data["proficiency_choices"][0]["choose"],
    }
    dnd_class_data
  end

  def parse_level_fetch
    level_data = {
      api_index: fetch_level["index"],
      level: fetch_level["level"],
      ability_score_bonuses: fetch_level["ability_score_bonuses"],
      prof_bonus: fetch_level["prof_bonus"],
    }
    level_data
  end

  def parse_level_show
    level_data = {
      api_index: fetch_level["index"],
      level: fetch_level["level"],
      ability_score_bonuses: fetch_level["ability_score_bonuses"],
      prof_bonus: fetch_level["prof_bonus"],
      features: stringify_fetch(fetch_level["features"]),
      class_specific: fetch_level["class_specific"].map { |k, v| "#{k}: #{v}" },
    }
    level_data
  end

  def features
    fetch_level["features"]
  end

  def class_specifics
    fetch_level["class_specific"]
  end

  def max_spell_level(spellcasting_level)
    if spellcasting_level.lvl_9 > 0
      return 9
    elsif spellcasting_level.lvl_8 > 0
      return 8
    elsif spellcasting_level.lvl_7 > 0
      return 7
    elsif spellcasting_level.lvl_6 > 0
      return 6
    elsif spellcasting_level.lvl_5 > 0
      return 5
    elsif spellcasting_level.lvl_4 > 0
      return 4
    elsif spellcasting_level.lvl_3 > 0
      return 3
    elsif spellcasting_level.lvl_2 > 0
      return 2
    elsif spellcasting_level.lvl_1 > 0
      return 1
    end
  end
end
