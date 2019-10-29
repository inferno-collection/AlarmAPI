![channels4_banner|690x114](https://i.ibb.co/CHMD8y6/channels4-banner.jpg) 
# Inferno Collection: AlarmAPI

This resource gives an alarm interface, it is an API not a standalone resource.

---

## Install

If you do not know this step, this isn't a resource for you.

## Configuration

Open config.lua and fill out the Config.Alarms table, the layout should the alarm name as the index and URL as a value. IE:

industrial: "sounds/industrial.mp3", residential: "https://some.url.here/file.mp3"

For relative paths, it should be relative to ui/index.html not the config file or this README.

## Usage

To start an alarm, trigger client event "inferno/AlarmAPI:activate". Arguments are "id", "type", "volume".
ID is how you will reference that specific alarm instance later on, type is the alarm name you specified in the config, volume is the volume you want the alarm to sound at and will default at 100%. It is written as a percentage in numerical form, so if you want it set to 50%, pass 0.5.

To change the volume of an alarm, trigger "inferno/AlarmAPI:volume" with arguments "id", and "volume".
ID should be the same as the one passed with activate, and volume is the same format as activation.

To stop an alarm, trigger "inferno/AlarmAPI:stop" with the argument of "id".

To add an alarm type during run time from other scripts, trigger "inferno/AlarmAPI:addAlarmType" with arguments of "type" and "path".

***Example***

```
TriggerEvent("inferno/AlarmAPI:activate", "PinkCageRoom2", "industrial", 0.5)
TriggerEvent("inferno/AlarmAPI:volume", "PinkCageRoom2", 1.0)
TriggerEvent("inferno/AlarmAPI:stop", "PinkCageRoom2")
TriggerEvent("inferno/AlarmAPI:addAlarmType", "safealarm", "https://some.url.example/safealarm.mp3")
```

---

## Shameless Plug

Check out the [Inferno Collection](https://inferno-collection.com) for some quality FiveM addons.

### The Inferno Collection Team
* @ChristopherM
* @Scott_UK 
* @FrozenN00b

Interested in keeping up-to-date with what we are working on? [Check out our roadmap](https://inferno-collection.com/roadmap)