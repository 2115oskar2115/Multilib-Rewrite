local Multilib = require(game:GetService("ReplicatedStorage").Multilib)
local CheckBox = {}
CheckBox.__index = CheckBox

--[=[
	@class CheckBox
	@client
	Class for CheckBox object.
]=]

--[=[
	@within CheckBox
	@return <table> -- [Checkbox Object]
	Constructor for CheckBox object.
]=]

function CheckBox.new(model: any, elements: {GuiObject}, idName: string, settings: Multilib.CheckBox?)
	local self = setmetatable({}, CheckBox)

	if settings == nil then settings = {} end
	if settings.Locked == nil then settings.Locked = false end
	if settings.Cooldown == nil then settings.Cooldown = 0.25 end
	if settings.OverrideDisplayAnimation ~= nil then self.DisplayAnimFunc = settings.OverrideDisplayAnimation end

	local model, elements = self:PerfectClone(model,elements)

	self.modelElements = {}
	for index, value in pairs(elements) do
		self.modelElements[index] = value
	end


	self.isCooldown = false
	self.initiated = false
	self.elementType = "Checkbox"
	self.actions = {}

	self.model = model
	self.model.Name = idName
	self.idName = idName

	self.cooldownTime = settings.Cooldown
	self.value = settings.StartingValue
	self.locked = settings.Locked

	return self
end

--[=[
	@within CheckBox
	
	should be called only via Form:InitAll().
]=]

function CheckBox:Init() -- should be called only via Form:InitAll()
	if self.initiated == false then
		self.initiated = true
		self.modelElements.Button.Activated:Connect(function()
			if self.locked == false and self.isCooldown == false then
				self.isCooldown = true
				task.delay(self.cooldownTime,function()
					self.isCooldown = false
				end)
				if self.value == false then
					self.value = true
					self:DisplayAnimFunc(true)
					self:ExecuteActions()
				else
					self.value = false
					self:DisplayAnimFunc(false)
					self:ExecuteActions()
				end
			end
		end)
	end
end

--[=[
	@within CheckBox
	@return <boolean,string> -- [value and idName of the object]
	Returns value and idName of the object.
]=]

function CheckBox:ReturnValues()
	return self.value, self.idName
end

--[=[
	@within CheckBox
	
	Changes the CheckBox.locked property.
]=]

function CheckBox:LockStatus(status: boolean)
	self.locked = status
end

--[=[
	@within CheckBox
	
	Sets the Parent of the CheckBox.model.
]=]

function CheckBox:Append(where: any)
	self.model.Parent = where
end

--[=[
	@within CheckBox
	@private
	Private Function, should not be called.
]=]

function CheckBox:DisplayAnimFunc(value: boolean) -- internal private function, do not call
	self.modelElements.Check.Visible = value
end

--[=[
	@within CheckBox
	
	Adds action that will be executed on every value change.
]=]

function CheckBox:AddAction(actionName: string, action: any)
	self.actions[actionName] = action
end

--[=[
	@within CheckBox
	
	Removes action that would be executed on every value change.
]=]

function CheckBox:RemoveAction(actionName: string)
	table.remove(self.actions,actionName)
end

--[=[
	@within CheckBox
	@private
	Private Function, should not be called.
]=]

function CheckBox:ExecuteActions()
	for index, action in pairs(self.actions) do
		action()
	end
end


--[=[
	@within CheckBox
	@private
	Private Function, should not be called.
]=]

function CheckBox:PerfectClone(trueModel: any, trueElements: {GuiObject}) -- internal private function, do not call (also; not quite perfect)
	local model = trueModel:Clone()
	local elements = {}
	for index, element in pairs(trueElements) do
		local path = string.split(element,".")
		local followedPath = model
		for Index2, value in pairs(path) do
			followedPath = followedPath[value]
		end
		elements[index] = followedPath
	end
	return model, elements
end

--[=[
	@within CheckBox
	Destructor for CheckBox object.
]=]

function CheckBox:Destroy()
	self.model:Destroy()
	for index, value in pairs(self) do
		value = nil
	end
end


return CheckBox
