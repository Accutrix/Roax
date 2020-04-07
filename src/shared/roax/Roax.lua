local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Module = script

local CustomClasses = { }

local Roax = {

	Classes = setmetatable({ }, {
		__index = function(self, Index)
			if Module:FindFirstChild(Index) then
				local Object = Module:FindFirstChild(Index)
				if Object:IsA("ModuleScript") then
					Object = require(Object)
				end
				return Object
			elseif CustomClasses[Index] then
				return CustomClasses[Index]
			end
		end
	});
	
}



function Roax:AddClass(ClassName, Class)
	
	CustomClasses[ClassName] = Class
	return CustomClasses[ClassName]
	
end


function Roax:RemoveClass(ClassName)
	
	if CustomClasses[ClassName] then
		CustomClasses[ClassName] = nil
	end
	
end


function Roax:Init()
	warn("Roax - Initiated")
end



return setmetatable(Roax, {
	
	__index = function(self, Index)
		if self.Classes[Index] then
			return self.Classes[Index]
		end
	end;
	
	__newindex = function(self, Index, Value)
		if not Roax[Index] then
			warn("Roax - Additional indexes cannot be created")
		end
	end;
	
	__call = function(...)
		Roax:Init(...)
		return Roax
	end;
	
})