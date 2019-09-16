﻿--[[
    Necrosis LdC
    Copyright (C) 2005-2008  Lom Enfroy

    This file is part of Necrosis LdC.

    Necrosis LdC is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Necrosis LdC is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Necrosis LdC; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
--]]

------------------------------------------------------------------------------------------------------
-- Necrosis LdC
-- Par Lomig (Kael'Thas EU/FR) & Tarcalion (Nagrand US/Oceanic) 
-- Contributions deLiadora et Nyx (Kael'Thas et Elune EU/FR)
--
-- Skins et voix Françaises : Eliah, Ner'zhul
--
-- Version Allemande par Geschan
-- Version Espagnole par DosS (Zul’jin)
-- Version Russe par Komsomolka
--
-- Version $LastChangedDate: 2010-08-04 12:04:27 +1000 (Wed, 04 Aug 2010) $
------------------------------------------------------------------------------------------------------

local new, del
do
	local cache = setmetatable({}, {__mode='k'})
	function new(populate, ...)
		local tbl
		local t = next(cache)
		if ( t ) then
			cache[t] = nil
			tbl = t
		else
			tbl = {}
		end
		if ( populate ) then
			local num = select("#", ...)
			if ( populate == "hash" ) then
				assert(math.fmod(num, 2) == 0)
				local key
				for i = 1, num do
					local v = select(i, ...)
					if not ( math.fmod(i, 2) == 0 ) then
						key = v
					else
						tbl[key] = v
						key = nil
					end
				end
			elseif ( populate == "array" ) then
				for i = 1, num do
					local v = select(i, ...)
					table.insert(tbl, i, v)
				end
			end
		end
		return tbl
	end
	function del(t)
		for k in next, t do
			t[k] = nil
		end
		cache[t] = true
	end
end


-- Fonction pour relocaliser  automatiquemlent des éléments en fonction du client
function Necrosis:SpellLocalize(tooltip) 

	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Relocalisation des Sorts
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if not tooltip then
		self.Spell = {
			[1] = {Name = GetSpellInfo(5784), 	Mana = 50,			    Length = 0,		Type = 0}, -- Felsteed
			[2] = {Name = GetSpellInfo(23161), 	Mana = 50,			 	Length = 0,		Type = 0}, -- Dreadsteed
			[3] = {Name = GetSpellInfo(688), 	Mana = 50,				Length = 0,		Type = 0}, -- Imp || Diablotin 
			[4] = {Name = GetSpellInfo(697),	Mana = 50,				Length = 0,		Type = 0}, -- Voidwalker || Marcheur
			[5] = {Name = GetSpellInfo(712),	Mana = 50,				Length = 0,		Type = 0}, -- Succubus || Succube
			[6] = {Name = GetSpellInfo(691),	Mana = 50,				Length = 0,		Type = 0}, -- Fellhunter
			[7] = {Name = GetSpellInfo(691),	Mana = 50,				Length = 0,		Type = 0}, -- Felguard -- Fellhunter now
			[8] = {Name = GetSpellInfo(1122),	Mana = 50,				Length = 600,	Type = 3}, -- Infernal
			[9] = {Name = GetSpellInfo(18647),	Mana = 50,				Length = 30,	Type = 2}, -- Banish
			[10] = {Name = GetSpellInfo(1098),	Mana = 50,				Length = 300,	Type = 2}, -- Enslave
			[11] = {Name = GetSpellInfo(20707),	Mana = 50,				Length = 1800,	Type = 1}, -- Soulstone Resurrection || Résurrection de pierre d'ame
			[12] = {Name = GetSpellInfo(707),	Mana = 50,				Length = 15,	Type = 6}, -- Immolate
			[13] = {Name = GetSpellInfo(6215),	Mana = 50,				Length = 15,	Type = 6}, -- Fear
			[14] = {Name = GetSpellInfo(6222),	Mana = 50,				Length = 18,	Type = 5}, -- Corruption
			[15] = {Name = GetSpellInfo(18708),	Mana = 50,				Length = 180,	Type = 3}, -- Fel Domination || Domination corrompue
			[16] = {Name = GetSpellInfo(603),	Mana = 50,				Length = 60,	Type = 3}, -- Curse of Doom || Malédiction funeste
			[17] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 20,	Type = 3}, -- NOPE NOT IN Classic Shadowfury || Furie de l'ombre
			[18] = {Name = GetSpellInfo(17924),	Mana = 50,				Length = 60,	Type = 3}, -- Soul Fire || Feu de l'âme
			[19] = {Name = GetSpellInfo(17926),	Mana = 50,				Length = 120,	Type = 3}, -- Death Coil || Voile mortel
			[20] = {Name = GetSpellInfo(18871),	Mana = 50,				Length = 15,	Type = 3}, -- Shadowburn || Brûlure de l'ombre
			[21] = {Name = GetSpellInfo(18932),	Mana = 50,				Length = 10,	Type = 3}, -- Conflagration
			[22] = {Name = GetSpellInfo(11713),	Mana = 50,				Length = 24,	Type = 4}, -- Curse of Agony || Malédiction Agonie
			[23] = {Name = GetSpellInfo(11708),	Mana = 50,				Length = 120,	Type = 4}, -- Curse of Weakness || Malédiction Faiblesse
			[24] = {Name = GetSpellInfo(11717),	Mana = 0 ,              Length = 0,	    Type = 0}, -- Curse of Recklessness - removed in patch 3.1 || Malédiction Témérité || 
			[25] = {Name = GetSpellInfo(11719),	Mana = 50,				Length = 30,	Type = 4}, -- Curse of Tongues || Malédiction Langage
			[26] = {Name = GetSpellInfo(11722),	Mana = 50,				Length = 300,	Type = 4}, -- Curse of the Elements || Malédiction Eléments
			[27] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 180,	Type = 3}, -- NOPE NOT IN Classic  Metamorphosis || Metamorphose
			[28] = {Name = GetSpellInfo(18881),	Mana = 50,				Length = 30,	Type = 6}, -- Siphon Life || Syphon de vie
			[29] = {Name = GetSpellInfo(17928),	Mana = 50,				Length = 40,	Type = 3}, -- Howl of Terror || Hurlement de terreur
			[30] = {Name = GetSpellInfo(18540),	Mana = 50,				Length = 1800,	Type = 3}, -- Ritual of Doom || Rituel funeste
			[31] = {Name = GetSpellInfo(11735),	Mana = 50,				Length = 0,		Type = 0}, -- Demon Armor || Armure démoniaque
			[32] = {Name = GetSpellInfo(5697),	Mana = 50,				Length = 600,		Type = 0}, -- Unending Breath || Respiration interminable
			[33] = {Name = GetSpellInfo(132),	Mana = 50,				Length = 0,		Type = 0}, -- Detect Invisibility || Détection de l'invisibilité
			[34] = {Name = GetSpellInfo(126),	Mana = 50,				Length = 0,		Type = 0}, -- Eye of Kilrogg
			[35] = {Name = GetSpellInfo(1098),	Mana = 50,				Length = 0,		Type = 0}, -- Enslave Demon
			[36] = {Name = GetSpellInfo(696),	Mana = 50,				Length = 0,		Type = 0}, -- Demon Skin || Peau de démon 
			[37] = {Name = GetSpellInfo(698),	Mana = 50,				Length = 120,		Type = 3}, -- Ritual of Summoning || Rituel d'invocation
			[38] = {Name = GetSpellInfo(19028),	Mana = 50,				Length = 0,		Type = 0}, -- Soul Link || Lien spirituel
			[39] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 45,		Type = 3}, -- NOPE NOT IN Classic  Demon Charge || Charge démoniaque
			[40] = {Name = GetSpellInfo(18223),	Mana = 50,				Length = 12,	Type = 4}, -- Curse of Exhaustion || Malédiction de fatigue
			[41] = {Name = GetSpellInfo(11689),	Mana = 50,				Length = 0,	     Type = 0}, -- Life Tap || Connexion
			[42] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 12,	Type = 2}, -- NOPE NOT IN Classic  Haunt || Hanter
			[43] = {Name = GetSpellInfo(28610),	Mana = 50,				Length = 30,	Type = 0}, -- Shadow Ward || Gardien de l'ombre
			[44] = {Name = GetSpellInfo(19443),	Mana = 50,				Length = 60,	Type = 3}, -- Sacrifice || Sacrifice démoniaque 
			[45] = {Name = GetSpellInfo(11661),	Mana = 50,				Length = 0,		Type = 0}, -- Shadow Bolt
			[46] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 18,	Type = 6}, -- NOPE NOT IN Classic  Unstable Affliction || Affliction instable
			[47] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 0,		Type = 0}, -- NOPE NOT IN Classic  Fel Armor || Gangrarmure
			[48] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 18,	Type = 5}, -- NOPE NOT IN Classic  Seed of Corruption || Graine de Corruption
			[49] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 180,	Type = 3}, -- NOPE NOT IN Classic SoulShatter || Brise âme
			[50] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 300,	Type = 3}, -- NOPE NOT IN Classic Ritual of Souls || Rituel des âmes
			[51] = {Name = GetSpellInfo(20755),	Mana = 50,				Length = 0,		Type = 0}, -- Create Soulstone || Création pierre d'âme
			[52] = {Name = GetSpellInfo(5699),	Mana = 50,				Length = 0,		Type = 0}, -- Create Healthstone || Création pierre de soin
			[53] = {Name = GetSpellInfo(2362),	Mana = 50,				Length = 0,		Type = 0}, -- Create Spellstone || Création pierre de sort
			[54] = {Name = GetSpellInfo(17951),	Mana = 50,				Length = 0,		Type = 0}, -- Create Firestone || Création pierre de feu
			[55] = {Name = GetSpellInfo(18938),	Mana = 50,				Length = 0,		Type = 0}, -- Dark Pact || Pacte noir
			[56] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 0,		Type = 0}, -- NOPE NOT IN Classic  Shadow Cleave || Enchainement d'ombre
			[57] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 30,	Type = 3}, -- NOPE NOT IN Classic  Immolation Aura || Aura d'immolation
			[58] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 15,	Type = 3}, --  NOPE NOT IN Classic Challenging Howl || Hurlement de défi
			[59] = {Name = GetSpellInfo(133),	Mana = 50,			    Length = 60,	Type = 3} --NOPE NOT IN Classic   Demonic Empowerment || Renforcement démoniaque
		}
		-- Type 0 = Pas de Timer || no timer
		-- Type 1 = Timer permanent principal || Standing main timer
		-- Type 2 = Timer permanent || main timer
		-- Type 3 = Timer de cooldown || cooldown timer
		-- Type 4 = Timer de malédiction || curse timer
		-- Type 5 = Timer de corruption || corruption timer
		-- Type 6 = Timer de combat || combat timer

		for i in ipairs(self.Spell) do
			self.Spell[i].Rank = " "
			-- print (i .. '  '..self.Spell[i].Name)
		end
	end
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Relocalisation des Tooltips
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	-- stones || Pierres
	local buttonTooltip = new("array",
		"Soulstone",
		"Healthstone",
		"Spellstone",
		"Firestone"
	)
	local colorCode = new("array",
		"|c00FF99FF", "|c0066FF33", "|c0099CCFF", "|c00FF4444"
	)
	for i, button in ipairs(buttonTooltip) do
		if not self.TooltipData[button] then
			self.TooltipData[button] = {}
		end
		self.TooltipData[button].Label = colorCode[i]..self.Translation.Item[button].."|r"
	end
	del(buttonTooltip)
	del(colorCode)
	
	-- Buffs
	local buttonTooltip = new("array",
		"Domination",
		"Enslave",
		"Armor",
		"FelArmor",
		"Invisible",
		"Aqua",
		"Kilrogg",
		"Banish",
		"TP",
		"RoS",
		"SoulLink",
		"ShadowProtection",
		"Renforcement"
	)
	local buttonName = new("array",
		15, 35, 31, 47, 33, 32, 34, 9, 37, 50, 38, 43, 59
	)
	for i, button in ipairs(buttonTooltip) do
		if not self.TooltipData[button] then
			self.TooltipData[button] = {}
		end
		self.TooltipData[button].Label = "|c00FFFFFF"..self.Spell[buttonName[i]].Name.."|r"
	end
	del(buttonTooltip)
	del(colorCode)
	del(buttonName)

	-- Demons
	local buttonTooltip = new("array",
		"Sacrifice",
		"Charge",
		"Enchainement",
		"Immolation",
		"Defi",
		"Renforcement",
		"Enslave"
	)
	local buttonName = new("array",
		44, 39, 56, 57, 58, 59, 35
	)
	for i, button in ipairs(buttonTooltip) do
		if not self.TooltipData[button] then
			self.TooltipData[button] = {}
		end
		self.TooltipData[button].Label = "|c00FFFFFF"..self.Spell[buttonName[i]].Name.."|r"
	end
	del(buttonTooltip)
	del(colorCode)
	del(buttonName)
	
	-- Curses || Malédiction
	local buttonTooltip = new("array",
		"Weakness",
		"Agony",
		"Tongues",
		"Exhaust",
		"Elements",
		"Doom",
		"Corruption"
	)
	local buttonName = new("array",
		23, 22, 25, 40, 26, 16, 14
	)
	for i, button in ipairs(buttonTooltip) do
		if not self.TooltipData[button] then
			self.TooltipData[button] = {}
		end
		self.TooltipData[button].Label = "|c00FFFFFF"..self.Spell[buttonName[i]].Name.."|r"

	end
	del(buttonTooltip)
	del(colorCode)
	del(buttonName)
end

self.spellRefs = {
	[1] = {5784}, -- Felsteed
	[2] = {23161}, -- Dreadsteed
	[3] = {688}, -- Imp || Diablotin 
	[4] = {697}, -- Voidwalker || Marcheur
	[5] = {712}, -- Succubus || Succube
	[6] = {691}, -- Fellhunter
	[7] = {691}, -- Felguard -- Fellhunter now
	[8] = {1122}, -- Infernal
	[9] = {18647,710}, -- Banish
	[10] = {11726,11725,1098}, -- Enslave
	[11] = {20765,20764,20763,20762,20707}, -- Soulstone Resurrection || Résurrection de pierre d'ame
	[12] = {25309,11668,11667,11665,2941,1094,707,348}, -- Immolate
	[13] = {Name = GetSpellInfo(6215),	Mana = 50,				Length = 15,	Type = 6}, -- Fear
	[14] = {Name = GetSpellInfo(6222),	Mana = 50,				Length = 18,	Type = 5}, -- Corruption
	[15] = {Name = GetSpellInfo(18708),	Mana = 50,				Length = 180,	Type = 3}, -- Fel Domination || Domination corrompue
	[16] = {Name = GetSpellInfo(603),	Mana = 50,				Length = 60,	Type = 3}, -- Curse of Doom || Malédiction funeste
	[17] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 20,	Type = 3}, -- NOPE NOT IN Classic Shadowfury || Furie de l'ombre
	[18] = {Name = GetSpellInfo(17924),	Mana = 50,				Length = 60,	Type = 3}, -- Soul Fire || Feu de l'âme
	[19] = {Name = GetSpellInfo(17926),	Mana = 50,				Length = 120,	Type = 3}, -- Death Coil || Voile mortel
	[20] = {Name = GetSpellInfo(18871),	Mana = 50,				Length = 15,	Type = 3}, -- Shadowburn || Brûlure de l'ombre
	[21] = {Name = GetSpellInfo(18932),	Mana = 50,				Length = 10,	Type = 3}, -- Conflagration
	[22] = {Name = GetSpellInfo(11713),	Mana = 50,				Length = 24,	Type = 4}, -- Curse of Agony || Malédiction Agonie
	[23] = {Name = GetSpellInfo(11708),	Mana = 50,				Length = 120,	Type = 4}, -- Curse of Weakness || Malédiction Faiblesse
	[24] = {Name = GetSpellInfo(11717),	Mana = 0 ,              Length = 0,	    Type = 0}, -- Curse of Recklessness - removed in patch 3.1 || Malédiction Témérité || 
	[25] = {Name = GetSpellInfo(11719),	Mana = 50,				Length = 30,	Type = 4}, -- Curse of Tongues || Malédiction Langage
	[26] = {Name = GetSpellInfo(11722),	Mana = 50,				Length = 300,	Type = 4}, -- Curse of the Elements || Malédiction Eléments
	[27] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 180,	Type = 3}, -- NOPE NOT IN Classic  Metamorphosis || Metamorphose
	[28] = {Name = GetSpellInfo(18881),	Mana = 50,				Length = 30,	Type = 6}, -- Siphon Life || Syphon de vie
	[29] = {Name = GetSpellInfo(17928),	Mana = 50,				Length = 40,	Type = 3}, -- Howl of Terror || Hurlement de terreur
	[30] = {Name = GetSpellInfo(18540),	Mana = 50,				Length = 1800,	Type = 3}, -- Ritual of Doom || Rituel funeste
	[31] = {Name = GetSpellInfo(11735),	Mana = 50,				Length = 0,		Type = 0}, -- Demon Armor || Armure démoniaque
	[32] = {Name = GetSpellInfo(5697),	Mana = 50,				Length = 600,		Type = 0}, -- Unending Breath || Respiration interminable
	[33] = {Name = GetSpellInfo(132),	Mana = 50,				Length = 0,		Type = 0}, -- Detect Invisibility || Détection de l'invisibilité
	[34] = {Name = GetSpellInfo(126),	Mana = 50,				Length = 0,		Type = 0}, -- Eye of Kilrogg
	[35] = {Name = GetSpellInfo(1098),	Mana = 50,				Length = 0,		Type = 0}, -- Enslave Demon
	[36] = {Name = GetSpellInfo(696),	Mana = 50,				Length = 0,		Type = 0}, -- Demon Skin || Peau de démon 
	[37] = {Name = GetSpellInfo(698),	Mana = 50,				Length = 120,		Type = 3}, -- Ritual of Summoning || Rituel d'invocation
	[38] = {Name = GetSpellInfo(19028),	Mana = 50,				Length = 0,		Type = 0}, -- Soul Link || Lien spirituel
	[39] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 45,		Type = 3}, -- NOPE NOT IN Classic  Demon Charge || Charge démoniaque
	[40] = {Name = GetSpellInfo(18223),	Mana = 50,				Length = 12,	Type = 4}, -- Curse of Exhaustion || Malédiction de fatigue
	[41] = {Name = GetSpellInfo(11689),	Mana = 50,				Length = 0,	     Type = 0}, -- Life Tap || Connexion
	[42] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 12,	Type = 2}, -- NOPE NOT IN Classic  Haunt || Hanter
	[43] = {Name = GetSpellInfo(28610),	Mana = 50,				Length = 30,	Type = 0}, -- Shadow Ward || Gardien de l'ombre
	[44] = {Name = GetSpellInfo(19443),	Mana = 50,				Length = 60,	Type = 3}, -- Sacrifice || Sacrifice démoniaque 
	[45] = {Name = GetSpellInfo(11661),	Mana = 50,				Length = 0,		Type = 0}, -- Shadow Bolt
	[46] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 18,	Type = 6}, -- NOPE NOT IN Classic  Unstable Affliction || Affliction instable
	[47] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 0,		Type = 0}, -- NOPE NOT IN Classic  Fel Armor || Gangrarmure
	[48] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 18,	Type = 5}, -- NOPE NOT IN Classic  Seed of Corruption || Graine de Corruption
	[49] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 180,	Type = 3}, -- NOPE NOT IN Classic SoulShatter || Brise âme
	[50] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 300,	Type = 3}, -- NOPE NOT IN Classic Ritual of Souls || Rituel des âmes
	[51] = {Name = GetSpellInfo(20755),	Mana = 50,				Length = 0,		Type = 0}, -- Create Soulstone || Création pierre d'âme
	[52] = {Name = GetSpellInfo(5699),	Mana = 50,				Length = 0,		Type = 0}, -- Create Healthstone || Création pierre de soin
	[53] = {Name = GetSpellInfo(2362),	Mana = 50,				Length = 0,		Type = 0}, -- Create Spellstone || Création pierre de sort
	[54] = {Name = GetSpellInfo(17951),	Mana = 50,				Length = 0,		Type = 0}, -- Create Firestone || Création pierre de feu
	[55] = {Name = GetSpellInfo(18938),	Mana = 50,				Length = 0,		Type = 0}, -- Dark Pact || Pacte noir
	[56] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 0,		Type = 0}, -- NOPE NOT IN Classic  Shadow Cleave || Enchainement d'ombre
	[57] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 30,	Type = 3}, -- NOPE NOT IN Classic  Immolation Aura || Aura d'immolation
	[58] = {Name = GetSpellInfo(133),	Mana = 50,				Length = 15,	Type = 3}, --  NOPE NOT IN Classic Challenging Howl || Hurlement de défi
	[59] = {Name = GetSpellInfo(133),	Mana = 50,			    Length = 60,	Type = 3} --NOPE NOT IN Classic   Demonic Empowerment || Renforcement démoniaque
}