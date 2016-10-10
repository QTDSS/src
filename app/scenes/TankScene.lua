local TankScene = class("TankScene", function()
    return display.newScene("TankScene");
end)

function TankScene:ctor()
    self:onCreate();
end

function TankScene:beereset()
    print("beereset()")
  
  --self.bee:runAction(action)
end

function TankScene:onCreate()

    local winSize = cc.Director:getInstance():getWinSize();
   
    display.newSprite("background1.png"):move(display.center):addTo(self)
   
    local tank1 =require("app/scenes/TankRole").new()
    tank1:setPosition(100,200)
    self:addChild(tank1)
    
    local tank2 =require("app/scenes/TankRole").new()
    tank2:setPosition(800,200)
    tank2:setRotationSkewY(180)
    self:addChild(tank2)
    
    
    
   
  
   
    
    local function eyeEvent(sender,eventType)
       tank1:shot()
       tank2:shot()
    end
     local eye = ccui.Button:create()
    eye:setTouchEnabled(true)
    eye:setPressedActionEnabled(true)
    eye:loadTextures("close.png", "open.png")
    eye:setPosition(80,80)
    eye:addClickEventListener(eyeEvent)
    self:addChild(eye)
end



return TankScene
