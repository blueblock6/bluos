API = require("buttonAPI")
local event = require("event")
local computer = require("computer")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local colors = require("colors")
local filesystem = component.filesystem
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

API.heading("BluOS Boot Options")

function API.fillTable()
    API.setTable("Back", back, 130, 150, 40, 44)
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
gpu.setResolution(160, 50)
API.clear()
API.fillTable()

while true do
    getClick()
end