API = require("buttonAPI")
local event = require("event")
local computer = require("computer")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local colors = require("colors")
local filesystem = component.filesystem
local Green = 0x00AA00
local Red = 0xAA0000

API.heading("BluOS Booting")
computer.beep()
os.sleep(1)

function API.fillTable()
    API.setTable("Back", back, 130, 150, 40, 44, 0, Green, Red)
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
  API.flash("Back", 0.3)
  os.sleep(0.2)
  API.clear()
  os.exit()
end

term.setCursorBlink(false)
gpu.setResolution(160, 50)
API.clear()
API.fillTable()

os.sleep(3)
API.clear()
API.clearTable()
os.execute("/bluos/menu")

while true do
    getClick()
end