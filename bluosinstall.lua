local component=require"component"
if not component.isAvailable("internet") then
    print("You need a internet card, quit with any key")
    local inp=io.read()
    os.exit()
end
if not component.internet.isHttpEnabled() then
    print("Http is not enabled, please ask your admin! quit with any key")
    local inp=io.read()
    os.exit()
end

os.execute("mkdir /bluos")

print("Downloading BluOS")
os.execute("wget -f https://github.com/blueblock6/bluos/raw/master/bluos/lib/buttonAPI.lua /lib/buttonAPI.lua")
os.execute("wget -f https://github.com/blueblock6/bluos/raw/master/bluos/bluos.lua /home/bluos.lua")
os.execute("wget -f https://github.com/blueblock6/bluos/raw/master/bluos/boot.lua /bluos/boot.lua")
print("download finished")