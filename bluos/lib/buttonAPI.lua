local API = {}
local button={}
 
local component = require("component")
local colors = require("colors")
local term = require("term")
local mon = component.gpu
local w, h = mon.getResolution()
local Black = 0x000000
local Gray = 0xA9A9A9
 
buttonStatus = nil
 
function API.clear()
  mon.setBackground(Black)
  mon.fill(1, 1, w, h, " ")
end
 
function API.clearTable()
  button = {}
  API.clear()
end
               
function API.setTable(name, func, xmin, xmax, ymin, ymax, unav, oncolor, offcolor)
  button[name] = {}
  button[name]["func"] = func
  button[name]["active"] = false
  button[name]["xmin"] = xmin
  button[name]["ymin"] = ymin
  button[name]["xmax"] = xmax
  button[name]["ymax"] = ymax
  button[name]["unav"] = unav
  button[name]["oncolor"] = oncolor
  button[name]["offcolor"] = offcolor
end
 
function API.fill(text, color, bData)
  local yspot = math.floor((bData["ymin"] + bData["ymax"]) /2)
  local xspot = math.floor((bData["xmax"] + bData["xmin"] - string.len(text)) /2)+1
  local oldColor = mon.setBackground(color)
  mon.fill(bData["xmin"], bData["ymin"], (bData["xmax"]-bData["xmin"]+1), (bData["ymax"]-bData["ymin"]+1), " ")
  mon.set(xspot, yspot, text)
  mon.setBackground(oldColor)
end
     
function API.screen()
  local currColor
  for name,data in pairs(button) do
    local on = data["active"]
    if data["unav"] == 0 then if on == true then currColor = data["oncolor"] else currColor = data["offcolor"] end end
    if data["unav"] == 1 then currColor = Gray end
    API.fill(name, currColor, data)
  end
end
 
function API.toggleButton(name)
  button[name]["active"] = not button[name]["active"]
  buttonStatus = button[name]["active"]
  API.screen()
end     
 
function API.flash(name,length)
  API.toggleButton(name)
  API.screen()
  os.sleep(length)
  API.toggleButton(name)
  API.screen()
end
                                             
function API.checkxy(x, y)
  for name, data in pairs(button) do
    if y>=data["ymin"] and  y <= data["ymax"] then
      if x>=data["xmin"] and x<= data["xmax"] then
        if data["unav"] == 0 then
          data["func"]()
          return true
        end
      end
    end
  end
  return false
end
     
function API.heading(text)
  w, h = mon.getResolution()
  term.setCursor((w-string.len(text))/2+1, 1)
  term.write(text)
end
     
function API.label(w, h, text)
  term.setCursor(w, h)
  term.write(text)
end
 
return API
 
 
 
 
 
-- THIS API WAS MADE BY EOF -> https://oc.cil.li/topic/255-button-api-now-for-oc-updated-9-6-2014/