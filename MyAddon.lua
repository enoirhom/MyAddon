local function checkBags(self, event, ...)
	local totalAmount = 0;

	for bagID = 0, 4 do
		local nbSlot = GetContainerNumSlots(bagID);

		for slot = 1, nbSlot do
			local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bagID, slot);

			if itemLink ~= nil then
				local itemName, iLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				if quality == 0 then
					UseContainerItem(bagID, slot);
					totalAmount = totalAmount + itemCount * itemSellPrice;
				end
			end
		end
	end

	if totalAmount ~= 0 do
		local gold = totalAmount / 10000;
		local roundedGold = gold - (gold % 1);
		local silver = (gold - roundedGold) * 100;
		local roundedSilver = silver - (silver % 1);
		local copper = (silver - roundedSilver) * 100;

		DEFAULT_CHAT_FRAME:AddMessage("Recettes: " .. roundedGold .. "g " .. roundedSilver .. "s " .. copper .. "c!");
	end
end

DEFAULT_CHAT_FRAME:AddMessage("Hello " .. UnitName("player") .. " beau gosse");

local frame = CreateFrame("FRAME", "MyAddon");
frame:RegisterEvent("MERCHANT_SHOW");
frame:SetScript("OnEvent", checkBags);
