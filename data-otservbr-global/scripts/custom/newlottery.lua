local decayItems = {
	[2772] = 2773, [2773] = 2772
}
local slots = {
	-- aqui sao os slots da esteira, por onde os itens vao ir passando... podem ser adicionados quantos quiser...
	Position(31930, 32042, 5), Position(31931, 32042, 5), Position(31932, 32042, 5), Position(31933, 32042, 5),	Position(31934, 32042, 5),
	Position(31935, 32042, 5), Position(31936, 32042, 5), Position(31937, 32042, 5), Position(31938, 32042, 5)
}

local itemtable = {
	--aqui pode ter ate 100 itens.. a chance nunca pode se repetir, ela deve ser de 1 a 100...
	-- inserir os itens respeitando a ordem: [1], [2], [3], ...  ate o ultimo [100]
	[1] = {id = 3013, chance = 1},
	[2] = {id = 29286, chance = 5},
	[3] = {id = 3366, chance = 10},
	[4] = {id = 3365, chance = 15},
	[5] = {id = 33388, chance = 20},
	[6] = {id = 892, chance = 25},
	[7] = {id = 570, chance = 30},
	[8] = {id = 35607, chance = 35},
	[9] = {id = 5958, chance = 40},
	[10] = {id = 3035, chance = 45},
	[11] = {id = 3043, chance = 50},
	[12] = {id = 3043, chance = 1200},
	[13] = {id = 653, chance = 1000},
	[14] = {id = 21203, chance = 1200},
	[15] = {id = 37611, chance = 1125},
	[16] = {id = 2991, chance = 1300},
	[17] = {id = 19369, chance = 1000},
	[18] = {id = 34109, chance = 1000},
	[19] = {id = 6509, chance = 1200},
	[20] = {id = 6510, chance = 1200},
	[21] = {id = 6505, chance = 1145},
	[22] = {id = 39546, chance = 1150},
	[23] = {id = 43895, chance = 1115},
	[24] = {id = 3555, chance = 100},
	[25] = {id = 43886, chance = 400},
	[26] = {id = 43880, chance = 400},
	[27] = {id = 43865, chance = 400},
	[28] = {id = 43878, chance = 400},
	[29] = {id = 43883, chance = 400},
	[30] = {id = 43869, chance = 400},
	[31] = {id = 43867, chance = 400},
	[32] = {id = 3043, chance = 400},
}

local function ender(cid, position)
	local player = Player(cid)
	local posicaofim = Position(31934, 32042, 5) -- AQUI VAI APARECER A SETA, que define o item que o player ganhou
	local item = Tile(posicaofim):getTopDownItem()
	if item then
		local itemId = item:getId()
		posicaofim:sendMagicEffect(CONST_ME_TUTORIALARROW)
		player:addItem(itemId, 1)
	end
	local alavanca = Tile(position):getTopDownItem()
	if alavanca then
		alavanca:setActionId(18562) -- aqui volta o actionid antigo, para permitir uma proxima jogada...
	end
	if itemId == 3031 or itemId == 3043 then --checar se é o ID do item LENDARIO
		broadcastMessage("O player "..player:getName().." ganhou "..item:getName().."", MESSAGE_EVENT_ADVANCE) -- se for item raro mandar no broadcast
		
		for _, pid in ipairs(getPlayersOnline()) do
			if pid ~= cid then
				pid:say("O player "..player:getName().." ganhou "..item:getName().."", TALKTYPE_MONSTER_SAY) -- se nao for lendario, mandar uma mensagem comum
			end
		end
	end
end

local function delay(position, aux)
	local item = Tile(position):getTopDownItem()
	if item then
		local slot = aux + 1
		item:moveTo(slots[slot])
	end	
end

local function exec(cid)
	--calcular uma chance e atribuir um item
	local rand = math.random(1, 100)
	local aux, memo = 0, 0
	if rand >= 1 then
		for i = 1, #itemtable do
			local randitemid = itemtable[i].id
			local randitemchance = itemtable[i].chance
			if rand >= randitemchance then
				aux = aux + 1
				memo = randitemchance
			end
			
		end
	end
	-- Passo um: Criar um item no primeiro SLOT, e deletar se houver o item do ultimo slot.
	Game.createItem(itemtable[aux].id, 1, slots[1])
	slots[1]:sendMagicEffect(CONST_ME_POFF)
	local item = Tile(slots[#slots]):getTopDownItem()
	if item then
		item:remove()
	end
	--Passo dois: Mover itens para o proximo slot em todos os slots de 1 a 9 para o 2 > 10
	local maxslot = #slots-1
	local lastloop = 0
	for i = 1, maxslot do
		
		addEvent(delay, 1*1*60, slots[i], i)
	end
end

local newLottery = Action()

function newLottery.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if not player:removeItem(43732, 1) then -- PARA JOGAR o player precisa ter o item 5091, que representa um bilhete vendido na store ou em um npc....
		return false
	end
	
	item:transform(decayItems[item.itemid])
	item:decay()	
	--muda actionid do item para nao permitir executar duas instancias
	item:setActionId(18563)
	
	local segundos = 30
	local loopsize = segundos*2
	
	for i = 1, loopsize do
		addEvent(exec, 1*i*500, cid.uid)
	end
	addEvent(ender, (1*loopsize*500)+1000, cid.uid, fromPosition)
	
	return true
end

newLottery:aid(18562)
newLottery:register()
