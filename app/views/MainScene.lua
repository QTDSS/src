
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

--MainScene.RESOURCE_FILENAME = "MainScene.csb"

function MainScene:onCreate()
    printf("resource node = %s", tostring(self:getResourceNode()))
    
    display.newSprite("background1.png"):move(display.center):addTo(self)
    local point = {
      cc.p(100, 300),
      cc.p(400, 300),
      cc.p(700, 300),
      cc.p(750, 400),
      cc.p(850, 550),
    }
    self.point=point
    local bee = cc.Sprite:create('bee.png')
    bee:setAnchorPoint(0.5,0.5)
    bee:setPosition(100 ,300)
    self:addChild(bee,200)

    local frog = cc.Sprite:create('frog.png')
    frog:setAnchorPoint(0.5,0.5)
    frog:setPosition(100,300)
    self:addChild(frog,100)
    
    local leaf1 = cc.Sprite:create('leaf1.png')
    leaf1:setAnchorPoint(0.5,0.5)
    leaf1:setPosition(100,200)
    self:addChild(leaf1)
    
    local leaf2 = cc.Sprite:create('leaf2.png')
    leaf2:setAnchorPoint(0.5,0.5)
    leaf2:setPosition(400 ,200)
    self:addChild(leaf2)
    
    

    local leaf3 = cc.Sprite:create('leaf3.png')
    leaf3:setAnchorPoint(0.5,0.5)
    leaf3:setPosition(700,200)
    self:addChild(leaf3)
    
    local leaf4 = cc.Sprite:create('leaf3.png')
    leaf4:setAnchorPoint(0.5,0.5)
    leaf4:setPosition(750,300)
    self:addChild(leaf4)
    
    local bezier = {
    point[1],
    cc.p(point[1].x+150, point[1].y),
    point[2],
    }
  -- 以持续时间和贝塞尔曲线的配置结构体为参数创建动作
  local bezierForward = cc.BezierBy:create(3, bezier)
  local bezierBack = bezierForward:reverse()
  -- 无限循环执行序列
  local rep = cc.RepeatForever:create(cc.Sequence:create(bezierForward, bezierBack))
 
  -- sprite 2
  --tamara:setPosition(cc.p(80,160))
  --[[
  local bezier2 = ccBezierConfig()
  bezier2.controlPoint_1 = cc.p(100, size.height / 2)
  bezier2.controlPoint_2 = cc.p(200, - size.height / 2)
  bezier2.endPosition = cc.p(240, 160)
  ]]--
  local bezier1 ={
    point[1],
    cc.p(point[1].x+150, point[1].y+200),
    point[2],
  }
  local bezier2 ={
    point[2],
    cc.p(point[2].x+150, point[2].y+200),
    point[3],
  }
  local bezier3 ={
    point[3],
    cc.p(point[3].x/2+point[4].x/2, point[3].y/2+point[4].y/2),
    point[4],
  }
  local bezier4 ={
    point[4],
    cc.p(point[4].x/2+point[5].x/2, point[5].y/2+point[5].y/2),
    point[5],
  }
  -- 创建贝塞尔曲线动作，第一个参数为持续时间，第二个参数为贝塞尔曲线结构
  local bezierTo1 = cc.BezierTo:create(2, bezier1)
  local bezierTo2 = cc.BezierTo:create(2, bezier2)
  local bezierTo3 = cc.BezierTo:create(2, bezier3)
  local bezierTo4 = cc.BezierTo:create(2, bezier4)
  local action = cc.Sequence:create(bezierTo1, bezierTo2, bezierTo3,bezierTo4)
  -- sprite 3
  --kathia:setPosition(cc.p(400,160))
  --local bezierTo2 = cc.BezierTo:create(2, bezier2)
 
  -- 运行动作
  bee:runAction(action)
  --local order＝{}
    local function touchEvent1(sender,eventType)
        print("fdsfsdfsdfsdfsdfsdfsdfsdf")
  
    end
      
    local button1 = ccui.Button:create()
    button1:setTouchEnabled(true)
    button1:setPressedActionEnabled(true)
    button1:loadTextures("leaf1.png", "leaf1.png")
    button1:setPosition(100，200)
    button1:addClickEventListener(touchEvent1)
    self:addChild(button1)

    
end

return MainScene
