local LogoScene = class("LogoScene", function()
    return display.newScene("LogoScene");
end)

function LogoScene:ctor()
    self:onCreate();
end

function LogoScene:beereset()
    print("beereset()")
  
  --self.bee:runAction(action)
end

function LogoScene:onCreate()


    local winSize = cc.Director:getInstance():getWinSize();
    local worry=false
    local beeflying=false
    local complete=false
    display.newSprite("background1.png"):move(display.center):addTo(self)
    local point = {
      cc.p(150, 150),
      cc.p(400, 150),
      cc.p(550, 300),
      cc.p(400, 450),
      cc.p(600, 500),
      cc.p(850, 550),
    }
    self.point=point
    local bee = cc.Sprite:create('bee.png')
    bee:setAnchorPoint(0.5,0.5)
    bee:setPosition(point[1].x,point[1].y)
    self:addChild(bee,200)
    self.bee=bee
    local frog = cc.Sprite:create('frog.png')
    frog:setAnchorPoint(0.5,0.5)
    frog:setPosition(point[1].x,point[1].y+100)
    self:addChild(frog,100)
    
    local leaf1 = cc.Sprite:create('leaf1.png')
    leaf1:setAnchorPoint(0.5,0.5)
    leaf1:setPosition(point[1].x,point[1].y)
    self:addChild(leaf1)
    
    local errord = cc.Sprite:create('error.png')
    errord:setAnchorPoint(0.5,0.5)
    errord:setPosition(100,200)
    errord:setVisible(false)
    self:addChild(errord,100)

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
  local bezier5 ={
    point[5],
    cc.p(point[5].x/2+point[6].x/2, point[5].y/2+point[6].y/2),
    point[6],
  }
  -- 创建贝塞尔曲线动作，第一个参数为持续时间，第二个参数为贝塞尔曲线结构
  
  local function beefly()
    if beeflying== false then
        beeflying=true
        bee:setPosition(100 ,300)
        local bezierTo1 = cc.BezierTo:create(2, bezier1)
        local bezierTo2 = cc.BezierTo:create(2, bezier2)
        local bezierTo3 = cc.BezierTo:create(1, bezier3)
        local bezierTo4 = cc.BezierTo:create(2, bezier4)
        local bezierTo5 = cc.BezierTo:create(2, bezier5)
        local action = cc.Sequence:create(bezierTo1, bezierTo2, 
            cc.CallFunc:create(function() bee:setRotationSkewY(180) end),
            bezierTo3,
            cc.CallFunc:create(function() bee:setRotationSkewY(0) end),
            bezierTo4,
            bezierTo5,cc.CallFunc:create(function() worry=false beeflying=false end))
        bee:runAction(action)
     end   
  end

  beefly()
  local function frogReset()
        local action1 = cc.FadeOut:create(0.2)
        local action1Back = action1:reverse()    
        local reset=cc.MoveTo:create(1, cc.p(point[1].x,point[1].y+100))
        frog:runAction(cc.Sequence:create( action1, reset,action1Back,cc.CallFunc:create(beefly)))
  end 
  local function showError(x,y)
     worry=true
     errord:setPosition(x,y)
     errord:setVisible(true)
     local scheduler = cc.Director:getInstance():getScheduler()  
     local schedulerID = nil 
            schedulerID = scheduler:scheduleScriptFunc(function()  
               errord:setVisible(false)  
               cc.Director:getInstance():getScheduler():unscheduleScriptEntry(schedulerID)
               frogReset()   
            end,1,false)
  end
  
  local order=0
   

 
    local frogMove=false
    local function touchEvent2(sender,eventType)
    if complete==true then return end
       if worry== false and beeflying==false and  frogMove==false then
        if order==0 then
           frogMove=true
           order=order+1
           print("setp :"..order)
           local bezierTo2 = cc.BezierTo:create(0.5, bezier1)           
           frog:runAction(cc.Sequence:create( bezierTo2, cc.CallFunc:create(function() frogMove=false end)))
        else
           print("setp error")
           order=0

           showError(point[2].x,point[2].y)         
        end
       end
    end
      
    local button2 = ccui.Button:create()
    button2:setTouchEnabled(true)
    button2:setPressedActionEnabled(true)
    button2:loadTextures("leaf2.png", "leaf2.png")
    button2:setPosition(point[2].x,point[2].y-100)
    button2:addClickEventListener(touchEvent2)
    button2:setTag(1)
    self:addChild(button2)
 
     local function touchEvent3(sender,eventType)
     if complete==true then return end
     if worry== false and beeflying==false and frogMove==false then
        if order==1 then
           order=order+1
           print("setp :"..order)
           local bezierTo2 = cc.BezierTo:create(0.5, bezier2)
           frog:runAction(cc.Sequence:create( bezierTo2, cc.CallFunc:create(function() frogMove=false end)))
        else
            print("setp error")
            
            order=0
            showError(point[3].x,point[3].y)    
         end
       end
    end
      
    local button3 = ccui.Button:create()
    button3:setTouchEnabled(true)
    button3:setPressedActionEnabled(true)
    button3:loadTextures("leaf3.png", "leaf3.png")
    button3:setPosition(point[3].x,point[3].y-100)
    button3:addClickEventListener(touchEvent3)
    self:addChild(button3)
    
     local function touchEvent4(sender,eventType)
       if complete==true then return end
       if worry== false and beeflying==false and frogMove==false then
        if order==2 then
           
           print("setp :"..order)
           local bezierTo2 = cc.BezierTo:create(0.5, bezier3)
           frog:setRotationSkewY(180)
           frog:runAction(cc.Sequence:create( bezierTo2, cc.CallFunc:create(function() frogMove=false end)))
          
        else
            print("setp error")

           order=0
           showError(point[4].x,point[4].y) 
        end
      end
    end
     local button4 = ccui.Button:create()
    button4:setTouchEnabled(true)
    button4:setPressedActionEnabled(true)
    button4:loadTextures("leaf3.png", "leaf3.png")
    button4:setPosition(point[4].x,point[4].y-100)
    button4:addClickEventListener(touchEvent4)
    self:addChild(button4)

     local function touchEvent5(sender,eventType)
       if complete==true then return end
       if worry== false and beeflying==false and frogMove==false then
        if order==2 then
           
           print("setp :"..order)
           local bezierTo2 = cc.BezierTo:create(0.5, bezier4)
           local actionTo = cc.SkewTo:create(0.5, 180, 0)
           frog:setRotationSkewY(0)
           frog:runAction(cc.Sequence:create( bezierTo2, cc.CallFunc:create(function() frogMove=false end)))
           
           complete=true
        else
            print("setp error")

           order=0
           showError(point[5].x,point[5].y) 
        end
      end
    end
     local button5 = ccui.Button:create()
    button5:setTouchEnabled(true)
    button5:setPressedActionEnabled(true)
    button5:loadTextures("leaf3.png", "leaf3.png")
    button5:setPosition(point[5].x,point[5].y-100)
    button5:addClickEventListener(touchEvent5)
    self:addChild(button5)
    
     local function eyeEvent(sender,eventType)
       beefly()
    end
     local eye = ccui.Button:create()
    eye:setTouchEnabled(true)
    eye:setPressedActionEnabled(true)
    eye:loadTextures("close.png", "open.png")
    eye:setPosition(80,80)
    eye:addClickEventListener(eyeEvent)
    self:addChild(eye)
end



return LogoScene
