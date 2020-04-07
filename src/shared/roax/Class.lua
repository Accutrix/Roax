local Class = { }


function Class.new(Class, Constructor)
	
	if not Constructor then
		Constructor = Class.new
	end
	
	return setmetatable(Class, {
		__call = Constructor;
	})
	
end


return Class.new(Class)