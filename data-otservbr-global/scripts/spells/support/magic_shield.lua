local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local condition = Condition(CONDITION_MANASHIELD)
	condition:setParameter(CONDITION_PARAM_TICKS, 180000)
	local player = creature:getPlayer()
	local grade = player:upgradeSpellsWOD("Magic Shield")
	local shield = 1500 + 14.6 * player:getLevel() + 14 * player:getMagicLevel()
	if grade >= WHEEL_GRADE_REGULAR then
		shield = shield * 6.25
	end
	if player then
		condition:setParameter(CONDITION_PARAM_MANASHIELD, math.min(player:getMaxMana(), shield))
	end
	creature:addCondition(condition)
	return combat:execute(creature, var)
end

spell:name("Magic Shield")
spell:words("utamo vita")
spell:group("support")
spell:vocation("druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_MAGIC_SHIELD)
spell:id(44)
spell:cooldown(3 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(14)
spell:mana(50)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
