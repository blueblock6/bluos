API = require("buttonAPI")
local event = require("event")
local computer = require("computer")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local colors = require("colors")
if not component.isAvailable("internet") then
    print("You need a internet card, quit with any key.")
    local inp=io.read()
    os.exit()
end
if not component.internet.isHttpEnabled() then
    print("Http is not enabled, please ask your admin! quit with any key.")
    local inp=io.read()
    os.exit()
end

API.heading("BluOS Booting")
computer.beep()
os.sleep(1)
API.heading("Installing finishinstall.lua")
os.execute("wget -f https://github.com/blueblock6/bluos/raw/master/bluos/finishinstall.lua /bluos/finishinstall.lua")

os.execute("/bluos/finishinstall.lua")

function API.fillTable()
    API.setTable("Back", back, 65,75,20,22)
    API.screen()
end

function getClick()
    local _, _, x, y = event.pull(1,touch)
    if x == nil or y == nil then
      local h, w = gpu.getResolution()
      gpu.set(h, w, ".")
      gpu.set(h, w, " ")
    else 
      API.checkxy(x,y)
    end
end

function back()
    API.clear()
    os.exit()
end

term.setCursorBlink(false)
gpu.setResolution(80, 25)
API.clear()
API.fillTable()

while true do
    getClick()
end