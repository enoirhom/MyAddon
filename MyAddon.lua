
local function getQualityNumber(bagID, slot)
	local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bagID, slot);
	--local itemId = GetContainerItemID(bagID, slot);
	--DEFAULT_CHAT_FRAME:AddMessage(itemId);
	--local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemId);
	return  quality;
end

local function getItemLink(bagID, slot)
	local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bagID, slot);
	return  itemLink;
end

local function checkBags(self, event, ...)
	for bagID = 0, 4 do
		local nbSlot = GetContainerNumSlots(bagID);
		
		for slot = 1, nbSlot do
			local quality = getQualityNumber(bagID, slot);
			
			if quality == 0 then
				UseContainerItem(bagID, slot);
			end
		end
		
	end
end

DEFAULT_CHAT_FRAME:AddMessage("Hello " .. UnitName("player") .. " beau gosse");
--local link = getItemLink(0, 2);
--local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(link);
--DEFAULT_CHAT_FRAME:AddMessage(itemName);

local itemId = GetContainerItemID(0, 2);
DEFAULT_CHAT_FRAME:AddMessage(itemId);

local frame = CreateFrame("FRAME", "MyAddon");
frame:RegisterEvent("MERCHANT_SHOW");
frame:SetScript("OnEvent", checkBags);


