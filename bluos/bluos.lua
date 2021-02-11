API = require("buttonAPI")
local event = require("event")
local computer = require("computer")
local term = require("term")
local component = require("component")
local gpu = component.gpu
local colors = require("colors")

function API.fillTable()
    API.setTable("Boot", boot, 10,20,3,5)  
    API.setTable("Dev Boot", devBoot, 25,35,3,5)
    API.setTable("Options", options, 40,50,3,5)
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

function boot()
    API.clear()
    os.execute("/bluos/boot")
end

function devBoot()
    API.clear()
    os.execute("/bluos/devBoot")
end

function options()

end

function back()
    API.clear()
    os.exit()
end

term.setCursorBlink(false)
gpu.setResolution(80, 25)
API.clear()
API.fillTable()
API.heading("BluOS Boot Menu")

while true do
    getClick()
end