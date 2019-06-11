Touchi = require('touchi/touchi')
Button = require('touchi/Button')
CircleButton = require('touchi/CircleButton')

function love.load(args)
  if arg[#arg] == "-debug" then require("mobdebug").start() end  
  
  touchi = Touchi()
  
  local gw, gh = love.window.getMode()
  
  touchi:addWidget('left', Button(50, gh - 50 - 100, 100, 100))
  touchi:addWidget('right', Button(50 + 20 + 100, gh - 50 - 100, 100, 100))
  touchi:addWidget('A', CircleButton(gw - 50 - 65, gh - 50 - 65, 65))
  
  x, y = 400, 100
  
end

function love.update(dt)
  touchi:update(dt)
  
  if touchi:pressed('A') then y = y + 10 end
  if touchi:down('left') then x = x - 0.5 end
  if touchi:down('right') then x = x + 0.5 end
  
end

function love.draw()
  touchi:draw()
  love.graphics.circle('line', x, y, 20)
end	

