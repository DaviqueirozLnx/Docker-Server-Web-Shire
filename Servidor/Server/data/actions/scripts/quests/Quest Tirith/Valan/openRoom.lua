
function onUse(cid, item, frompos, item2, topos)
portafechada = 5134 -- coloque aqui o ID da porta fechada
portaaberta = 5136 -- coloque aqui o ID da porta aberta
uidporta = 1805 -- coloque aqui o UID da porta
idkey = 2091 -- coloque aqui o id da key
   if item.itemid == idkey and item2.itemid == portafechada and item2.uid == uidporta then
	  doTransformItem(item2.uid,portaaberta)
   else
	  doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
   end
   return 1
end

