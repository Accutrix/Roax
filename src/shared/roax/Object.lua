local Objects = script.Parent
local Class = require(Objects:WaitForChild("Class"))

local Object = { }



function Object.new(ClassName, Properties, Methods, OnCall)
	
	if not Properties then
		Properties = { }
	end
	
	if not Methods then
		Methods = { }
	end
	
	local CreatedObject = {
		Properties = Properties;
		Methods = Methods;
	}
	
	
	return setmetatable({}, {
		
		__index = function(self, Index)
			if CreatedObject.Properties[Index] then
				return CreatedObject.Properties[Index]
			elseif CreatedObject.Methods[Index] then
				return CreatedObject.Methods[Index]
			elseif Index == "ClassName" then
				return ClassName
			end
		end;
		
		__newindex = function(self, Index, Value)
			if CreatedObject.Properties[Index] then
				CreatedObject.Properties[Index] = Value
			elseif Methods[Index] then
				error(ClassName .. " methods cannot be modified")
			end
		end;
		
		__pairs = function(self)
			--[[return function(Table, Index)
				local Value
				repeat
					Index, Value = next(Table, Index)
				until Index == nil
				return Index, Value
			end, self, nil]]
		end;
		
		__call = function(...)
			if OnCall then
				return OnCall(...)
			end
		end;
		
	})
	
end



return Class.new(Object)