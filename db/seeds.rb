# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({
              email: 'dylan@gmail.com',
              password: 'password'
              })

Character.create({
                  user_id: 1,
                  name: "Test Hero",
                  max_hp: 100, 
                  hp: 100,
                  temp_hp: 0, 
                  armor_class: 17, 
                  initiative: 3, 
                  level: 5,
                  strength: 18, 
                  dexterity: 16, 
                  constitution: 18,
                  charisma: 8,
                  wisdom: 8,
                  intelligence: 8,
                  strength_mod: 4,
                  dextarity_mod: 3,
                  constitution_mod: 4,
                  charisma_mod: -1,
                  wisdom_mod: -1,
                  intelligence_mod: -1,
                  speed: 30,
                  weapon_1_name: "Sword",
                  weapon_1_attack: 4,
                  weapon_1_dmg: "2d6 + 2",
                  strength_save_cc: 4,
                  constitution_save_cc: 3,
                  wisdom_save_cc: -1
                  })

Character.create({
                  user_id: nil,
                  name: "Test Villain",
                  max_hp: 100, 
                  hp: 100,
                  temp_hp: 0, 
                  armor_class: 17, 
                  initiative: 3, 
                  level: 5,
                  strength: 18, 
                  dexterity: 16, 
                  constitution: 18,
                  charisma: 8,
                  wisdom: 8,
                  intelligence: 8,
                  strength_mod: 4,
                  dextarity_mod: 3,
                  constitution_mod: 4,
                  charisma_mod: -1,
                  wisdom_mod: -1,
                  intelligence_mod: -1,
                  speed: 30,
                  weapon_1_name: "Sword",
                  weapon_1_attack: 4,
                  weapon_1_dmg: "2d6 + 2",
                  strength_save_cc: 4,
                  constitution_save_cc: 3,
                  wisdom_save_cc: -1
                  })
