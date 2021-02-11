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
print("downloading GUI-API")
os.execute("wget -f https://github.com/ /lib/buttonAPI.lua")
print("download finished")