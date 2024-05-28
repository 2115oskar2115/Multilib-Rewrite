local Lib = {}

-- Core
function Lib:ReturnCustomValue()
	return self.CustomValue
end

-- useSettings
function Lib:SetCustomValue(value: string)
	self.CustomValue = value
end

-- End
function Lib:Init(comments: boolean)
	self.CustomValue = "Change Me!"
	if comments then
		warn("[Multilib-" .. script.Name .. "]", script.Name, "Lib Loaded & safe to use.")
	end
end

return Lib