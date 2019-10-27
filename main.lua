--[[
dh_alarms, FiveM Resource
Copyright (C) 2019 Daniel A. Hawton <daniel@hawton.org>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

RegisterNetEvent("dh/alarms:activate")
AddEventHandler("dh/alarms:activate", function(id, type, volume)
  SendNUIMessage({
    type = "ActivateAlarm",
    alarm = id,
    alarmtype = type,
    volume = volume
  })
end)

RegisterNetEvent("dh/alarms:stop")
AddEventHandler("dh/alarms:stop", function(id)
  SendNUIMessage({
    type = "StopAlarm",
    alarm = id
  })
end)

RegisterNetEvent("dh/alarms:volume")
AddEventHandler("dh/alarms:volume", function(id, volume)
  if volume > 1 then
    volume = volume / 100
  end

  SendNUIMessage({
    type = "SetAlarmVolume",
    alarm = id,
    volume = volume
  })
end)

RegisterCommand("activatealarm", function(source, args, user)
  SendNUIMessage({
    type = "ActivateAlarm",
    alarm = args[1],
    alarmtype = args[2],
    volume = args[3]
  })
end)

RegisterCommand("stopalarm", function(source, args, user)
  SendNUIMessage({
    type = "StopAlarm",
    alarm = args[1]
  })
end)

RegisterCommand("setalarmvolume", function(source, args, user)
  SendNUIMessage({
    type = "SetAlarmVolume",
    alarm = args[1],
    volume = args[2]
  })
end)

AddEventHandler("playerSpawned", function()
  if Config.Alarms ~= nil then
    SendNUIMessage({
      type = "init",
      alarms = Config.Alarms
    })
  end
end)

RegisterNetEvent("dh/alarms:addAlarmType")
AddEventHandler("dh/alarms:addAlarmType", function(type, path)
  Config.Alarms[type] = path
  SendNUIMessage({
    type = "init",
    alarms = Config.Alarms
  })
end)