User.create!([
  {email: "dylan@gmail.com", password: "password"}
])
Character.create!([
  {user_id: 1, name: "Test Hero", player: nil, character_class: nil, race: nil, deity: nil, max_hp: 100, hp: 100, temp_hp: 0, armor_class: 17, initiative: 3, level: 5, strength: 18, dexterity: 16, constitution: 18, charisma: 8, wisdom: 8, intelligence: 8, strength_mod: 4, dextarity_mod: 3, constitution_mod: 4, charisma_mod: -1, wisdom_mod: -1, intelligence_mod: -1, speed: 30, feats: nil, flaws: nil, proficiency_bonus: nil, deathsaves_successes: nil, deathsaves_failures: nil, strength_save_cc: 4, constitution_save_cc: 3, wisdom_save_cc: -1, intimidation_cc: nil, perception_cc: nil, acrobatics_cc: nil, athletics_cc: nil, animal_handling_cc: nil, history_cc: nil, insight_cc: nil, survival_cc: nil, persuasion_cc: nil, deception_cc: nil, weapon_1_name: "Sword", weapon_1_attack: 4, weapon_1_dmg: "2d6 + 2", weapon_2_name: nil, weapon_2_attack: nil, weapon_2_dmg: nil, weapon_3_name: nil, weapon_3_attack: nil, weapon_3_dmg: nil, background: nil, alignment: nil, hair: nil, eyes: nil, caster: nil},
  {user_id: nil, name: "Test Villain", player: nil, character_class: nil, race: nil, deity: nil, max_hp: 100, hp: 100, temp_hp: 0, armor_class: 17, initiative: 3, level: 5, strength: 18, dexterity: 16, constitution: 18, charisma: 8, wisdom: 8, intelligence: 8, strength_mod: 4, dextarity_mod: 3, constitution_mod: 4, charisma_mod: -1, wisdom_mod: -1, intelligence_mod: -1, speed: 30, feats: nil, flaws: nil, proficiency_bonus: nil, deathsaves_successes: nil, deathsaves_failures: nil, strength_save_cc: 4, constitution_save_cc: 3, wisdom_save_cc: -1, intimidation_cc: nil, perception_cc: nil, acrobatics_cc: nil, athletics_cc: nil, animal_handling_cc: nil, history_cc: nil, insight_cc: nil, survival_cc: nil, persuasion_cc: nil, deception_cc: nil, weapon_1_name: "Sword", weapon_1_attack: 4, weapon_1_dmg: "2d6 + 2", weapon_2_name: nil, weapon_2_attack: nil, weapon_2_dmg: nil, weapon_3_name: nil, weapon_3_attack: nil, weapon_3_dmg: nil, background: nil, alignment: nil, hair: nil, eyes: nil, caster: nil}
])
Simulation.create!([
  {character_id: 1}
])
BattleCluster.create!([
  {opponent_id: 2, simulation_id: 1, win_rate: "0.0", initiative_rate: "0.0", avg_dmg_taken: "0.0", avg_dmg_dealt: "0.0", avg_dmg_taken_per_turn: "0.0", avg_dmg_dealt_per_turn: "0.0", avg_turns: "0.0", hit_rate: "0.0", crit_rate: "0.0"}
])
Battle.create!([
  {win: true, win_initiative: true, dmg_taken: 47, dmg_dealt: 102, turns: 9, hits: 8, misses: 10, crits: 2, atk_1_rate: "0.0", atk_2_rate: "0.0", atk_3_rate: "0.0", battle_cluster_id: nil}
])
