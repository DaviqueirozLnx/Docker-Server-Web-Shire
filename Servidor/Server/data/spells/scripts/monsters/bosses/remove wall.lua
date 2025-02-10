local combat1 = createCombatObject()

local area1 = createCombatArea({
   {0, 0, 0, 0, 0},
   {0, 1, 1, 1, 0},
   {0, 1, 2, 1, 0},
   {0, 1, 1, 1, 0},
   {0, 0, 0, 0, 0}
})
setCombatArea(combat1, area1)


local function clean_wood(position)
   local fromPosition = {x = position.x - 1, y = position.y - 1, z = position.z}
   local toPosition = {x = position.x + 1, y = position.y + 1, z = position.z}
   for x = fromPosition.x, toPosition.x do
       for y = fromPosition.y, toPosition.y do
           local tile = {x = x, y = y, z = fromPosition.z}
           for itemid = 1497, 1499 do
               local wood = getTileItemById(tile, itemid)
               if wood.uid > 0 then
                   doRemoveItem(wood.uid, 1)
                   doSendMagicEffect(tile, CONST_ME_POFF)
               end
           end
       end
   end
end

function onCastSpell(cid, var)
   doCombat(cid, combat1, var)
   addEvent(clean_wood, 1 * 1, getThingPosition(cid))
   return true
end