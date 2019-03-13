# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_12_145206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battle_clusters", force: :cascade do |t|
    t.integer "opponant_id"
    t.integer "simulation_id"
    t.decimal "win_rate", precision: 3, scale: 2
    t.decimal "initiative_rate", precision: 3, scale: 2
    t.decimal "avg_dmg_taken", precision: 3, scale: 2
    t.decimal "avg_dmg_dealt", precision: 3, scale: 2
    t.decimal "avg_dmg_taken_per_turn", precision: 3, scale: 2
    t.decimal "avg_dmg_dealt_per_turn", precision: 3, scale: 2
    t.decimal "avg_turns", precision: 3, scale: 2
    t.decimal "hit_rate", precision: 3, scale: 2
    t.decimal "crit_rate", precision: 3, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battles", force: :cascade do |t|
    t.boolean "win"
    t.boolean "win_initiative"
    t.integer "dmg_taken"
    t.integer "dmg_dealt"
    t.integer "turns"
    t.integer "hits"
    t.integer "misses"
    t.integer "crits"
    t.decimal "atk_1_rate", precision: 3, scale: 2
    t.decimal "atk_2_rate", precision: 3, scale: 2
    t.decimal "atk_3_rate", precision: 3, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cluster_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "player"
    t.string "character_class"
    t.string "race"
    t.string "deity"
    t.integer "max_hp"
    t.integer "hp"
    t.integer "temp_hp"
    t.integer "armor_class"
    t.integer "initiative"
    t.integer "level"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "charisma"
    t.integer "wisdom"
    t.integer "intelligence"
    t.integer "strength_mod"
    t.integer "dextarity_mod"
    t.integer "constitution_mod"
    t.integer "charisma_mod"
    t.integer "wisdom_mod"
    t.integer "intelligence_mod"
    t.integer "speed"
    t.text "feats"
    t.string "flaws"
    t.integer "proficiency_bonus"
    t.integer "deathsaves_successes"
    t.integer "deathsaves_failures"
    t.integer "strength_save_cc"
    t.integer "constitution_save_cc"
    t.integer "wisdom_save_cc"
    t.integer "intimidation_cc"
    t.integer "perception_cc"
    t.integer "acrobatics_cc"
    t.integer "athletics_cc"
    t.integer "animal_handling_cc"
    t.integer "history_cc"
    t.integer "insight_cc"
    t.integer "survival_cc"
    t.integer "persuasion_cc"
    t.integer "deception_cc"
    t.string "weapon_1_name"
    t.integer "weapon_1_attack"
    t.string "weapon_1_dmg"
    t.string "weapon_2_name"
    t.integer "weapon_2_attack"
    t.string "weapon_2_dmg"
    t.string "weapon_3_name"
    t.integer "weapon_3_attack"
    t.string "weapon_3_dmg"
    t.string "background"
    t.string "alignment"
    t.string "hair"
    t.string "eyes"
    t.integer "caster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simulations", force: :cascade do |t|
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
