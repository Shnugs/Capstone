class Character < ApplicationRecord
  require "http"
  belongs_to :user, optional: true
  has_many :simulations
  has_many :battle_clusters, through: :simulations
  has_many :battles, through: :battle_clusters

  def roll(d)
    rand(1..d)
  end

  def roll_initiative
    initiative + roll(20)
  end

  def to_hit(opponent_stats)
    base = roll(20)
    if base == 20
      return {crit: true, hit: true}
    elsif base + weapon_1_attack >= opponent_stats.armor_class
      return {crit: false, hit: true}
    end
    {crit: false, hit: false}
  end

  def calc_dmg(params)
    # {crit: true, dmg: attacker.weapon_1_dmg}
    rolls = params[:dmg][0...(/d|D/ =~ params[:dmg])].to_i
    if params[:crit]
      rolls *= 2
    end
    die = params[:dmg][((/d|D/ =~ params[:dmg]) + 1)...(/\+|\-/ =~ params[:dmg])].to_i
    mod = params[:dmg][((/\+|\-/ =~ params[:dmg]) + 1), params[:dmg].length].to_i
    sign = params[:dmg][/\+|\-/ =~ params[:dmg]]
    total = 0
    rolls.times do 
      var_dmg = rand(1..die)
      if sign == "+"
        composite_total = var_dmg + mod
      elsif sign == "-"
        composite_total = var_dmg - mod
      end
      if composite_total < 0
        composite_total = 0
      end
      total += composite_total
    end
    total
  end

  def assign_dmg(dmg)
    self.hp -= dmg
  end

  def dead?
    hp <= 0
  end

  def new_simulation(villain_array, n_times)
    new_sim = Simulation.new 
    new_sim.character_id = id
    new_sim.run_simulation(self, villain_array, n_times)
    if new_sim.save
      puts "Successfully saved the Simulation"
    else
      puts "Failed to save Simulation"
    end
  end

  # The following section parses out the API data from dnd5eapi.co and adds monsters to the Character Table. 

  # def self.add_monsters
  #   325.times do |index|
  #     response = HTTP.get("http://www.dnd5eapi.co/api/monsters/#{index + 1}").parse
  #     weapon = {}
      
  #     unless response["actions"] == nil || response["actions"].length < 1
  #       response["actions"].length.times do |action_index|
  #         unless response["actions"][action_index]["damage_dice"] == nil
  #           if response["actions"][action_index]["damage_bonus"] == nil
  #             response["actions"][action_index]["damage_bonus"] = 0
  #           end
  #           if response["actions"][action_index]["damage_bonus"] >= 0
  #             weapon["dmg"] = response["actions"][action_index]["damage_dice"] + " + " + response["actions"][action_index]["damage_bonus"].to_s
  #           else
  #             weapon["dmg"] = response["actions"][action_index]["damage_dice"] + " - " + response["actions"][action_index]["damage_bonus"].to_s
  #           end
  #           weapon["name"] = response["actions"][action_index]["name"]
  #           weapon["attack"] = response["actions"][action_index]["attack_bonus"]
  #         end
  #       end
        
  #       response["charisma"] = response["charisma"] || 10

  #        new_character = Character.new(
  #         user_id: 0,
  #         name: response["name"],
  #         max_hp: response["hit_points"],
  #         hp: response["hit_points"],
  #         temp_hp: 0,
  #         armor_class: response["armor_class"],
  #         initiative: ((response["dexterity"] - 10) / 2),
  #         strength: response["strength"],
  #         dexterity: response["dexterity"],
  #         constitution: response["constitution"],
  #         charisma: response["charisma"],
  #         wisdom: response["wisdom"],
  #         intelligence: response["intelligence"],
  #         strength_mod: ((response["strength"] - 10) / 2),
  #         dextarity_mod: ((response["dexterity"] - 10) / 2),
  #         constitution_mod: ((response["constitution"] - 10) / 2),
  #         charisma_mod: ((response["charisma"] - 10) / 2),
  #         wisdom_mod: ((response["wisdom"] - 10) / 2),
  #         intelligence_mod: ((response["intelligence"] - 10) / 2),
  #         speed: response["speed"],
  #         weapon_1_name: weapon["name"],
  #         weapon_1_attack: weapon["attack"],
  #         weapon_1_dmg: weapon["dmg"],
  #         alignment: response["alignment"]
  #         )
  #       if new_character.save
  #         puts "Character successfully created!"
  #       else 
  #         puts "Boo, the Character didn't save :("
  #       end
  #       puts ""
  #     end
  #   end
  # end
end
