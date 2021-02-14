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
    API.setTable("Boot", boot, 20, 40, 6, 10, 0, Green, Red)  
    API.setTable("Dev Boot", devBoot, 50, 70, 6, 10, 1, Green, Red)
    API.setTable("Options", options, 80, 100, 6, 10, 1, Green, Red)
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

function boot()
    API.flash("Boot", 0.1)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    if not pcall(os.execute("/bluos/boot")) then
        print("Oops! There was an error! Must be a missing file!")
        os.exit()
    end
end

function devBoot()
    API.flash("Dev Boot", 0.1)
    os.sleep(0.2)
    API.clear()
    API.clearTable()
    os.execute("/bluos/devBoot")
end

function options()
    os.sleep(0.2)
    API.flash("Options", 0.1)
end

function back()
    API.flash("Back", 0.1)
    os.sleep(0.2)
    API.clear()
    os.exit()
end

term.setCursorBlink(false)
gpu.setResolution(160, 50)
API.clear()
API.fillTable()
API.heading("BluOS Boot Menu")

while true do
    getClick()
end