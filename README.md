# README

Battle Pseudo Code
==Initiative==
1.) Define Hero and Villain
2.) Roll d20 for each character and apply initiative bonus. 
3.) If the sum of the rolls are equal, check who has the higher initiative bonus. 
4.) If the bonuses are the same, redo steps 2 and 3. 
5.) Assign combat priority based on outcome of initiative roll. 

==Combat==
0.) 'Combat' continues until 1 combatant's hp drops below 1. 
1.) Attacker adds d20 and their modifier for their composite 'to_hit'
2.) If the d20 is a natural 20, it is a critical hit. The defender's health is reduced by the sum of the roll and modifier
    Damage is calculated using 2x dice. e.x. if standard damage is 2d6 + 3, critical damage is calculated as 4d6 + 3
3.) If the d20 is not a natural 20 and the 'to_hit' is >= the Defenders Armor Class, it is a standard hit. The defender's health is reduced by the sum of the roll and modifier
    Damage is calculated based on the damage. e.x. 1d8 + 3
4.) If the 'to_hit' roll is less than the defenders Armor Class, it is a miss and no damage is dealt.
5.) Any time damage is dealt, check to see if the defender's hp is at or below 0.
6.) If it is, the fight is over and the surviving fighter is the victor.
7.) If not, either the current attacker makes their next attack (if they have any left) and repeats all 'Combat' steps 
    - or - 
    turn order switches and 'Combat' starts again but with attacker and defender rolls reversed. 


