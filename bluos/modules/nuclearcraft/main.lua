API = require("buttonAPI")
local event = require("event")
local computer = require("computer")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local colors = require("colors")
local Green = 0x00AA00
local Red = 0xAA0000

local fusionA = 1
local fissionA = 1
local molten_saltA = 1
local heat_exchangerA = 1

if component.isAvailable("nc_fusion_reactor") then fusionA = 0 end
if component.isAvailable("nc_fission_reactor") then fissionA = 0 end
if component.isAvailable("nc_salt_fission_reactor") then molten_saltA = 0 end
if component.isAvailable("nc_heat_exchanger") then heat_exchangerA = 0 end

function API.fillTable()
    API.setTable("Fusion", fusion, 20, 40, 6, 10, fusionA, Green, Red)  
    API.setTable("Fission", fission, 50, 70, 6, 10, fissonA, Green, Red)
    API.setTable("Molten Salt", moltensalt, 80, 100, 6, 10, molten_saltA, Green, Red)
    API.setTable("Heat Exchanger", heatexchanger, 110, 130, 6, 10, heat_exchangerA, Green, Red)
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

function fusion()
    API.flash("Fusion", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/nuclearcraft/fusion")
end

function fission()
    API.flash("Fission", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/nuclearcraft/fission")
end

function moltensalt()
    API.flash("Molten Salt", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/nuclearcraft/moltensalt")
end

function heatexchanger()
    API.flash("Heat Exchanger", 0.3)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/modules/nuclearcraft/heatexchanger")
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