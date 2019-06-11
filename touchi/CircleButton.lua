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

local CircleButton = {}
CircleButton.__index = CircleButton

Button.color_up = {255, 255, 255, 32}
Button.color_down = {255, 255, 255, 64}

function CircleButton.new(x, y, r)
  local self = {}

  self.x = x
  self.y = y
  self.r = r
  
  self.down = false
  self.pressed = false
  self.released = false

  return setmetatable(self, CircleButton)
end

function CircleButton:update(dt)
end

function CircleButton:draw()
  love.graphics.setColor(self.down and CircleButton.color_down or CircleButton.color_up)
  love.graphics.circle('fill', self.x, self.y, self.r)
end

function CircleButton:contains(mx, my)
    local dx, dy = self.x - mx, self.y - my
    return dx * dx + dy * dy <= self.r * self.r 
end

return setmetatable({}, {__call = function(_, ...) return CircleButton.new(...) end})