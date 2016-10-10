
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"

local function main()
    --require("app.MyApp"):create():run()
    
    local scene = require("app/scenes/TankScene").new()
    
    display.runScene(scene)
     

end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
