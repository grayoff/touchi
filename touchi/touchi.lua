--[[
Copyright (c) 2019 Andrey Serikov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]--

local Touchi = {}
Touchi.__index = Touchi

function Touchi.new()
  local self = {}

  self.widgets = {}

  return setmetatable(self, Touchi)
end

function Touchi:update(dt)
  for key, widget in pairs(self.widgets) do
    local prev_down = widget.down
    local mx, my = love.mouse.getPosition()
    widget.down = widget:contains(mx, my)
    
    widget.pressed = widget.down and not prev_down
    widget.released = not widget.down and prev_down
    
    if widget.pressed and widget.on_pressed then widget.on_pressed() end
    if widget.down and widget.on_down then widget.on_down() end
    if widget.released and widget.on_released then widget.on_released() end
  
    widget:update(dt)
  end
end

function Touchi:draw()
  local r, g, b, a = love.graphics.getColor()
  for key, widget in pairs(self.widgets) do
    widget:draw()
  end
  love.graphics.setColor(r, g, b, a)
end

function Touchi:addWidget(key, w)
  self.widgets[key] = w
end

function Touchi:pressed(key)
  return self.widgets[key].pressed
end

function Touchi:released(key)
  return self.widgets[key].released
end

function Touchi:down(key)
  return self.widgets[key].down
end

return setmetatable({}, {__call = function(_, ...) return Touchi.new(...) end})
