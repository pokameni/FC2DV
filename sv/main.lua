--[[Fix/Clean Vehicle Script -- Fix and clean vehicles with a command
    Copyright (C) 2017-2024  Murtaza

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>. ]]--

-- Created by Murtaza  || https://forum.cfx.re/u/murfasa/summary
-- Updated by Pokameni || https://forum.cfx.re/u/pokameni/summary

-- Fix-Clean Vehicle Script v2

-- SERVERSIDE

----- CONFIG -----
local everyoneAllowed = false -- true = everyone is allowed || false = use steamIDs and IPs listed in allowed

local allowed = 
{
    "steam:110000115c5095e", -- || Pokameni SteamID64 / Hex || https://www.steamidfinder.com/
    "ip:192.168.1.1", -- || Local IP Address
    "steam:000000000000003" -- ||
}

-- CODE! Do not touch unless you know what you're doing ;) If you have any suggestions or need help, go on the GitHub.

RegisterCommand('fix', function(source, args, rawCommand)
    local identifier = GetPlayerIdentifiers(source)[1]
    if everyoneAllowed == true then
        TriggerClientEvent('murtaza:fix', source)
    else
        if checkAllowed(identifier) then
            TriggerClientEvent('murtaza:fix', source)
        else
            TriggerClientEvent('murtaza:noPerms', source)
        end
    end
end, false)

RegisterCommand('clean', function(source, args, rawCommand)
    local identifier = GetPlayerIdentifiers(source)[1]
    if everyoneAllowed == true then
        TriggerClientEvent('murtaza:clean', source)
    else
        if checkAllowed(identifier) then
            TriggerClientEvent('murtaza:clean', source)
        else
            TriggerClientEvent('murtaza:noPerms', source)
        end
    end
end, false)

RegisterCommand('dirt', function(source, args, rawCommand)
    local identifier = GetPlayerIdentifiers(source)[1]
    if everyoneAllowed == true then
        TriggerClientEvent('murtaza:dirt', source)
    else
        if checkAllowed(identifier) then
            TriggerClientEvent('murtaza:dirt', source)
        else
            TriggerClientEvent('murtaza:noPerms', source)
        end
    end
end, false)

RegisterCommand('destroy', function(source, args, rawCommand)
    local identifier = GetPlayerIdentifiers(source)[1]
    if everyoneAllowed == true then
        TriggerClientEvent('murtaza:destroy', source)
    else
        if checkAllowed(identifier) then
            TriggerClientEvent('murtaza:destroy', source)
        else
            TriggerClientEvent('murtaza:noPerms', source)
        end
    end
end, false)

function checkAllowed(id)
    for k, v in pairs(allowed) do
        if id == v then
            return true
        end
    end
    
    return false
end
