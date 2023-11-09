local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	
	local min = (level / 5) + (skill + 4 * attack) * 4.1
	local max = (level / 10) + (skill + 4 * attack) * 10

	return -min * 1.4, -max * 1.4 -- TODO : Use New Real Formula instead of an %
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(105)
spell:name("Fierce Berserk")
spell:words("exori gran")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FIERCE_BERSERK)
spell:level(90)
spell:mana(340)
spell:isPremium(false)
spell:needWeapon(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()