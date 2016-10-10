local TankRole = class("TankRole", function()
    return cc.Node:create();
end)

function TankRole:ctor()
	self.size=4
    self:onCreate();
end



function TankRole:onCreate()
    print("TankRole")
    local bee = cc.Sprite:create('frog.png')  
    self:addChild(bee)   
end
function TankRole:shot()
    print("shot")
    local bee = cc.Sprite:create('bee.png')

    self:addChild(bee)   
    local actionBy = cc.MoveBy:create(2, cc.p(1000, 0))
    bee:runAction(cc.Sequence:create(actionBy, cc.CallFunc:create(function() bee:removeFromParent() end)))


    
end
function TankRole:dead()
    for i=1 , self.size do
    	local bee = cc.Sprite:create('bee.png')
    	 bee:setPosition(i*20,0) 	
        self:addChild(bee) 
    end
      
end

return TankRole
