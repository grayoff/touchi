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

local Button = {}
Button.__index = Button

Button.color_up = {255, 255, 255, 32}
Button.color_down = {255, 255, 255, 64}
Button.rx = 5

function Button.new(x, y, w, h)
  local self = {}

  self.x = x
  self.y = y
  self.w = w
  self.h = h
  
  self.down = false
  self.pressed = false
  self.released = false

  return setmetatable(self, Button)
end

function Button:update(dt)
end

function Button:draw()
  love.graphics.setColor(self.down and Button.color_down or Button.color_up)
  love.graphics.rectangle('fill', self.x, self.y, self.w, self.h, Button.rx, Button.rx)
end

function Button:contains(mx, my)
    return mx >= self.x and mx <= self.x + self.w and my >= self.y and my <= self.y + self.h
end

return setmetatable({}, {__call = function(_, ...) return Button.new(...) end})