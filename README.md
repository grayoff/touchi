# touchi
Touch input library for Love2D

## Quick start

Place touchi folder inside your project and requiere it (and widgets optionally)"

```lua
Touchi = require('touchi/touchi')
Button = require('touchi/Button')
CircleButton = require('touchi/CircleButton')
```
Create touchi object (usually inside love.load):
```lua
  touchi = Touchi()
```
Add some widgets:
```lua
  touchi:addWidget('left', Button(50, 400, 100, 100))
  touchi:addWidget('A', CircleButton(600, 450, 65))
```
Don't forget to update and draw touchi:
```lua
  touchi:update(dt)
  ...
  touchi:draw()
```

Check for input:
```lua
  if touchi:pressed('A') then ... end
  if touchi:released('left') then ... end
  if touchi:down('right') then ... end
```  
See main.lua for example
