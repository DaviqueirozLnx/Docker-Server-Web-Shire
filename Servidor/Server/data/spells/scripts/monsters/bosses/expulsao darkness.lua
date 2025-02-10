local combat0_Brush = createCombatObject()
setCombatParam(combat0_Brush, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat0_Brush, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat0_Brush, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatArea(combat0_Brush,createCombatArea({{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0}}))

setCombatFormula(combat0_Brush, COMBAT_FORMULA_LEVELMAGIC, -230.0, 0, -270.0, 0)
local dfcombat0_Brush = {11,0,1,1,1,1,0,1,-1,0,-1,-1,-1,-1,0,-1,1,-2,1,-2,2,-1,2,0,2,1,2,2,2,2,0,2,1,2,-1,2,-2,1,-2,0,-2,-1,-2,-2,-2,-2,-1,-2,0,1,3,0,3,-1,3,-3,1,-3,0,-3,-1,-1,-3,0,-3,1,-3,3,-1,3,0,3,1,0,4,-4,0,0,-4,4,0}

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Brush,cid,var,dfcombat0_Brush,startPos)
	return true
end