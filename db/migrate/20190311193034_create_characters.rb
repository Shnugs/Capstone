class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.string :name
      t.string :player
      t.string :class
      t.string :race
      t.string :deity
      t.integer :max_hp
      t.integer :hp
      t.integer :temp_hp
      t.integer :armor_class
      t.integer :initiative
      t.integer :level
      t.integer :strength
      t.integer :dextarity
      t.integer :constitution
      t.integer :charisma
      t.integer :wisdom
      t.integer :intelligence
      t.integer :strength_mod
      t.integer :dextarity_mod
      t.integer :constitution_mod
      t.integer :charisma_mod
      t.integer :wisdom_mod
      t.integer :intelligence_mod
      t.integer :speed
      t.text :feats
      t.string :flaws
      t.integer :proficiency_bonus
      t.integer :deathsaves_successes
      t.integer :deathsaves_failures
      t.integer :strength_save_cc
      t.integer :constitution_save_cc
      t.integer :wisdom_save_cc
      t.integer :intimidation_cc
      t.integer :perception_cc
      t.integer :acrobatics_cc
      t.integer :athletics_cc
      t.integer :animal_handling_cc
      t.integer :history_cc
      t.integer :insight_cc
      t.integer :survival_cc
      t.integer :persuasion_cc
      t.integer :deception_cc
      t.string :weapon_1_name
      t.integer :weapon_1_attack
      t.string :weapon_1_dmg
      t.string :weapon_2_name
      t.integer :weapon_2_attack
      t.string :weapon_2_dmg
      t.string :weapon_3_name
      t.integer :weapon_3_attack
      t.string :weapon_3_dmg
      t.string :background
      t.string :alignment
      t.string :hair
      t.string :eyes
      t.integer :caster

      t.timestamps
    end
  end
end
