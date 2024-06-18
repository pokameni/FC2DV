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

RegisterNetEvent('murtaza:fix')
AddEventHandler('murtaza:fix', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        SetVehicleEngineHealth(vehicle, 1000.0)
        SetVehicleEngineOn(vehicle, true, true)
        SetVehicleFixed(vehicle)
        GTAONotification("~g~Your vehicle has been fixed!")
    else
        GTAONotification("~o~You're not in a vehicle! There is no vehicle to fix!")
    end
end)

RegisterNetEvent('murtaza:clean')
AddEventHandler('murtaza:clean', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        SetVehicleDirtLevel(vehicle, 0.0)
        GTAONotification("~b~Your vehicle has been cleaned!")
    else
        GTAONotification("~o~You're not in a vehicle! There is no vehicle to clean!")
    end
end)

RegisterNetEvent('murtaza:dirt')
AddEventHandler('murtaza:dirt', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        SetVehicleDirtLevel(vehicle, 15.0)
        GTAONotification("~o~Your vehicle is now dirty!")
    else
        GTAONotification("~o~You're not in a vehicle! There is no vehicle to make dirty!")
    end
end)

RegisterNetEvent('murtaza:destroy')
AddEventHandler('murtaza:destroy', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        SetVehicleEngineHealth(vehicle, 0.0)
        SetVehicleBodyHealth(vehicle, 0.0)
		-- SetVehiclePetrolTankHealth(vehicle, 600.0) -- || Fuel Leak || For a reason I don't know, this is not working. But I would like to implement it.
        for i = 0, 7 do -- || Tires
            SetVehicleTyreBurst(vehicle, i, true, 1000.0)
        end
        GTAONotification("~r~Your vehicle has been destroyed!")
    else
        GTAONotification("~o~You're not in a vehicle! There is no vehicle to destroy!")
    end
end)

RegisterNetEvent('murtaza:noPerms')
AddEventHandler('murtaza:noPerms', function()
    GTAONotification("~r~You don't have permissions to do this to your vehicle.")
end)

function GTAONotification(msg)
    SetGTAONotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawGTAONotification(false, false)
end
