class Api::CharactersController < ApplicationController
  def index
    @characters = Character.all 
    render 'index.json.jbuilder'
  end

  def create
    @character = Character.new(
      user_id: paramas[:user_id],
      name: paramas[:name],
      player: paramas[:player],
      character_class: paramas[:character_class],
      race: paramas[:race],
      deity: paramas[:deity],
      max_hp: paramas[:max_hp],
      hp: paramas[:hp],
      temp_hp: paramas[:temp_hp],
      armor_class: paramas[:armor_class],
      initiative: paramas[:initiative],
      level: paramas[:level],
      strength: paramas[:strength],
      dexterity: paramas[:dexterity],
      constitution: paramas[:constitution],
      charisma: paramas[:charisma],
      wisdom: paramas[:wisdom],
      intelligence: paramas[:intelligence],
      strength_mod: paramas[:strength_mod],
      dextarity_mod: paramas[:dextarity_mod],
      constitution_mod: paramas[:constitution_mod],
      charisma_mod: paramas[:charisma_mod],
      wisdom_mod: paramas[:wisdom_mod],
      intelligence_mod: paramas[:intelligence_mod],
      speed: paramas[:speed],
      feats: paramas[:feats],
      flaws: paramas[:flaws],
      proficiency_bonus: paramas[:proficiency_bonus],
      deathsaves_successes: paramas[:deathsaves_successes],
      deathsaves_failures: paramas[:deathsaves_failures],
      strength_save_cc: paramas[:strength_save_cc],
      constitution_save_cc: paramas[:constitution_save_cc],
      wisdom_save_cc: paramas[:wisdom_save_cc],
      intimidation_cc: paramas[:intimidation_cc],
      perception_cc: paramas[:perception_cc],
      acrobatics_cc: paramas[:acrobatics_cc],
      athletics_cc: paramas[:athletics_cc],
      animal_handling_cc: paramas[:animal_handling_cc],
      history_cc: paramas[:history_cc],
      insight_cc: paramas[:insight_cc],
      survival_cc: paramas[:survival_cc],
      persuasion_cc: paramas[:persuasion_cc],
      deception_cc: paramas[:deception_cc],
      weapon_1_name: paramas[:weapon_1_name],
      weapon_1_attack: paramas[:weapon_1_attack],
      weapon_1_dmg: paramas[:weapon_1_dmg],
      weapon_2_name: paramas[:weapon_2_name],
      weapon_2_attack: paramas[:weapon_2_attack],
      weapon_2_dmg: paramas[:weapon_2_dmg],
      weapon_3_name: paramas[:weapon_3_name],
      weapon_3_attack: paramas[:weapon_3_attack],
      weapon_3_dmg: paramas[:weapon_3_dmg],
      background: paramas[:background],
      alignment: paramas[:alignment],
      hair: paramas[:hair],
      eyes: paramas[:eyes],
      caster: paramas[:caster]
      )

    if @character.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @character.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @character = Character.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @character = Character.find(params[:id])

    @character.user_id = params[:user_id] || @character.user_id
    @character.name = params[:name] || @character.name
    @character.player = params[:player] || @character.player
    @character.character_class = params[:character_class] || @character.character_class
    @character.race = params[:race] || @character.race
    @character.deity = params[:deity] || @character.deity
    @character.max_hp = params[:max_hp] || @character.max_hp
    @character.hp = params[:hp] || @character.hp
    @character.temp_hp = params[:temp_hp] || @character.temp_hp
    @character.armor_class = params[:armor_class] || @character.armor_class
    @character.initiative = params[:initiative] || @character.initiative
    @character.level = params[:level] || @character.level
    @character.strength = params[:strength] || @character.strength
    @character.dexterity = params[:dexterity] || @character.dexterity
    @character.constitution = params[:constitution] || @character.constitution
    @character.charisma = params[:charisma] || @character.charisma
    @character.wisdom = params[:wisdom] || @character.wisdom
    @character.intelligence = params[:intelligence] || @character.intelligence
    @character.strength_mod = params[:strength_mod] || @character.strength_mod
    @character.dextarity_mod = params[:dextarity_mod] || @character.dextarity_mod
    @character.constitution_mod = params[:constitution_mod] || @character.constitution_mod
    @character.charisma_mod = params[:charisma_mod] || @character.charisma_mod
    @character.wisdom_mod = params[:wisdom_mod] || @character.wisdom_mod
    @character.intelligence_mod = params[:intelligence_mod] || @character.intelligence_mod
    @character.speed = params[:speed] || @character.speed
    @character.feats = params[:feats] || @character.feats
    @character.flaws = params[:flaws] || @character.flaws
    @character.proficiency_bonus = params[:proficiency_bonus] || @character.proficiency_bonus
    @character.deathsaves_successes = params[:deathsaves_successes] || @character.deathsaves_successes
    @character.deathsaves_failures = params[:deathsaves_failures] || @character.deathsaves_failures
    @character.strength_save_cc = params[:strength_save_cc] || @character.strength_save_cc
    @character.constitution_save_cc = params[:constitution_save_cc] || @character.constitution_save_cc
    @character.wisdom_save_cc = params[:wisdom_save_cc] || @character.wisdom_save_cc
    @character.intimidation_cc = params[:intimidation_cc] || @character.intimidation_cc
    @character.perception_cc = params[:perception_cc] || @character.perception_cc
    @character.acrobatics_cc = params[:acrobatics_cc] || @character.acrobatics_cc
    @character.athletics_cc = params[:athletics_cc] || @character.athletics_cc
    @character.animal_handling_cc = params[:animal_handling_cc] || @character.animal_handling_cc
    @character.history_cc = params[:history_cc] || @character.history_cc
    @character.insight_cc = params[:insight_cc] || @character.insight_cc
    @character.survival_cc = params[:survival_cc] || @character.survival_cc
    @character.persuasion_cc = params[:persuasion_cc] || @character.persuasion_cc
    @character.deception_cc = params[:deception_cc] || @character.deception_cc
    @character.weapon_1_name = params[:weapon_1_name] || @character.weapon_1_name
    @character.weapon_1_attack = params[:weapon_1_attack] || @character.weapon_1_attack
    @character.weapon_1_dmg = params[:weapon_1_dmg] || @character.weapon_1_dmg
    @character.weapon_2_name = params[:weapon_2_name] || @character.weapon_2_name
    @character.weapon_2_attack = params[:weapon_2_attack] || @character.weapon_2_attack
    @character.weapon_2_dmg = params[:weapon_2_dmg] || @character.weapon_2_dmg
    @character.weapon_3_name = params[:weapon_3_name] || @character.weapon_3_name
    @character.weapon_3_attack = params[:weapon_3_attack] || @character.weapon_3_attack
    @character.weapon_3_dmg = params[:weapon_3_dmg] || @character.weapon_3_dmg
    @character.background = params[:background] || @character.background
    @character.alignment = params[:alignment] || @character.alignment
    @character.hair = params[:hair] || @character.hair
    @character.eyes = params[:eyes] || @character.eyes
    @character.caster = params[:caster] || @character.caster

    if @character.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @character.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy
    render json: {message: "Successfully removed character."}
  end
end
