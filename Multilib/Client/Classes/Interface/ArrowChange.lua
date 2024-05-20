local Mtypes = require(game:GetService("ReplicatedStorage").Multilib.Types)
local ArrowChange = {}
ArrowChange.__index = ArrowChange

--[=[
	@class ArrowChange
	@client
	Class for ArrowChange object.
]=]

--[=[
	@within ArrowChange
	@return <table> -- [ArrowChange Object]
	Constructor for ArrowChange object.
]=]

function ArrowChange.new(model: any, elements: {GuiObject}, idName: string, settings: Mtypes.ArrowChange?)
	local self = setmetatable({}, ArrowChange)

	if settings == nil then settings = {} end
	if settings.Locked == nil then settings.Locked = false end
	if settings.Cooldown == nil then settings.Cooldown = 0.25 end
	if settings.OverrideDisplayAnimation ~= nil then self._DisplayAnimFunc = settings.OverrideDisplayAnimation end
	if settings.Values == nil then settings.Values = {"first","second","Third"} end
	if settings.StartingIndex == nil then settings.StartingIndex = 1 end

	local model, elements = self:_PerfectClone(model,elements)

	self.modelElements = {}
	for index, value in elements do
		self.modelElements[index] = value
	end

	if settings.StartingIndex < 1 or settings.StartingIndex > #settings.Values then
		settings.StartingIndex = 1
	end

	self.actualIndex = settings.StartingIndex
	self.values = settings.Values

	self._isCooldown = false
	self.initiated = false
	self.elementType = "ArrowChange"
	self.actions = {}

	self.model = model
	self.model.Name = idName
	self.idName = idName

	self._cooldownTime = settings.Cooldown
	self.value = settings.StartingValue
	self.locked = settings.Locked

	self:_DisplayAnimFunc()

	return self
end

--[=[
	@within ArrowChange
	
	should be called only via Form:InitAll().
]=]

function ArrowChange:Init() -- should be called only via Form:InitAll()
	if self.initiated == false then
		self.initiated = true
		self.modelElements.Left.Activated:Connect(function()
			if self.locked == false then
				if self.actualIndex - 1 == 0 then
					self.actualIndex = #self.values
				else
					self.actualIndex -= 1
				end
				self:_DisplayAnimFunc()
				self:_ExecuteActions()
			end
		end)
		self.modelElements.Right.Activated:Connect(function()
			if self.locked == false then
				if self.actualIndex + 1 > #self.values then
					self.actualIndex = 1
				else
					self.actualIndex += 1
				end
				self:_DisplayAnimFunc()
				self:_ExecuteActions()
			end
		end)
	end
end

--[=[
	@within ArrowChange
	
	Updates the values and index (optional).
]=]

function ArrowChange:UpdateValues(values: any, index: number?)
	if index == nil then index = self.actualIndex end

	if index < 1 or index > #values then
		index = 1
	else
		index = self.actualIndex
	end

	self.values = values
	self.actualIndex = index
	self:_DisplayAnimFunc()
	self:_ExecuteActions()
end

--[=[
	@within ArrowChange
	@return <boolean,string> -- [value and idName of the object]
	Returns value and idName of the object.
]=]

function ArrowChange:ReturnValues()
	return self.values[self.actualIndex], self.idName
end

--[=[
	@within ArrowChange
	
	Changes the ArrowChange.locked property.
]=]

function ArrowChange:LockStatus(status: boolean)
	self.locked = status
end

--[=[
	@within ArrowChange
	
	Sets the Parent of the ArrowChange.model.
]=]

function ArrowChange:Append(where: any)
	self.model.Parent = where
end

--[=[
	@within ArrowChange
	@private
	Private Function, should not be called.
]=]

function ArrowChange:_DisplayAnimFunc() -- internal private function, do not call
	self.modelElements.TextLabel.Text = self.values[self.actualIndex]
end

--[=[
	@within ArrowChange
	
	Adds action that will be executed on every value change.
]=]

function ArrowChange:AddAction(actionName: string, action: any)
	self.actions[actionName] = action
end

--[=[
	@within ArrowChange
	
	Removes action that would be executed on every value change.
]=]

function ArrowChange:RemoveAction(actionName: string)
	table.remove(self.actions,actionName)
end

--[=[
	@within ArrowChange
	@private
	Private Function, should not be called.
]=]

function ArrowChange:_ExecuteActions()
	for index, action in self.actions do
		action()
	end
end


--[=[
	@within ArrowChange
	@private
	Private Function, should not be called.
]=]

function ArrowChange:_PerfectClone(trueModel: any, trueElements: {GuiObject}) -- internal private function, do not call (also; not quite perfect)
	local model = trueModel:Clone()
	local elements = {}
	for index, element in trueElements do
		local path = string.split(element,".")
		local followedPath = model
		for Index2, value in path do
			followedPath = followedPath[value]
		end
		elements[index] = followedPath
	end
	return model, elements
end

--[=[
	@within ArrowChange
	Destructor for ArrowChange object.
]=]

function ArrowChange:Destroy()
	self.model:Destroy()
	for _, value in self do
		value = nil
	end
end


return ArrowChange