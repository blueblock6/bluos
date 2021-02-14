local event = require("event")

io.write("This will permanently delete all BluOS files, are you sure you would like to proceed? (Y/N): ")
local input = io.read()

if string.lower(input) == "y" then
    print("Uninstalling BluOS")
    os.execute("rm /lib/buttonAPI.lua")
    os.execute("rm /home/bluos.lua")
    os.execute("rm /bluos/boot.lua")
    os.execute("rm /bluos/devBoot.lua")
    os.execute("rm /bluos/finishinstall.lua")
    os.execute("rm /bluos/options.lua")
    os.execute("rm /bluos/bootoptions.lua")
    print("Uninstall finished")
else
    print("Canceled.")
    os.exit()
end