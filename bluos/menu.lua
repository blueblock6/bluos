API = require("buttonAPI")
local event = require("event")
local computer = require("computer")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local colors = require("colors")
local Green = 0x00AA00
local Red = 0xAA0000

function API.fillTable()
    API.setTable("NuclearCraft", nuclearcraft, 20, 40, 6, 10, 0, Green, Red)  
    API.setTable("Mekanism", mekanism, 50, 70, 6, 10, 1, Green, Red)
    API.setTable("Applied Energistics", appliedenergistics, 80, 100, 6, 10, 1, Green, Red)
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

function nuclearcraft()
    API.flash("NuclearCraft", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/nuclearcraft/main")
end

function mekanism()
    API.flash("Mekanism", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/mekanism/main")
end

function appliedenergistics()
    API.flash("Applied Energistics", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/appliedenergistics/main")
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
API.heading("BluOS Selection Menu")

while true do
    getClick()
end