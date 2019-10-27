# dh_alarms

This resource gives an alarm interface, it is an API not a standalone resource.

---

## Install

If you do not know this step, this isn't a resource for you.

## Configuration

Open config.lua and fill out the Config.Alarms table, the layout should the alarm name as the index and URL as a value. IE:

industrial: "sounds/industrial.mp3", residential: "https://some.url.here/file.mp3"

For relative paths, it should be relative to ui/index.html not the config file or this README.

## Usage

To start an alarm, trigger client event "dh/alarms:activate". Arguments are "id", "type", "volume".
ID is how you will reference that specific alarm instance later on, type is the alarm name you specified in the config, volume is the volume you want the alarm to sound at and will default at 100%. It is written as a percentage in numerical form, so if you want it set to 50%, pass 0.5.

To change the volume of an alarm, trigger "dh/alarms:volume" with arguments "id", and "volume".
ID should be the same as the one passed with activate, and volume is the same format as activation.

To stop an alarm, trigger "dh/alarms:stop" with the argument of "id".

To add an alarm type during run time from other scripts, trigger "dh/alarms:addAlarmType" with arguments of "type" and "path".

***Example***

```
TriggerEvent("dh/alarms:activate", "PinkCageRoom2", "industrial", 0.5)
TriggerEvent("dh/alarms:volume", "PinkCageRoom2", 1.0)
TriggerEvent("dh/alarms:stop", "PinkCageRoom2")
TriggerEvent("dh/alarms:addAlarmType", "safealarm", "https://some.url.example/safealarm.mp3")
```

---

## Shameless Plug

Check out the [Inferno Collection](https://inferno-collection.com) for some quality FiveM addons.