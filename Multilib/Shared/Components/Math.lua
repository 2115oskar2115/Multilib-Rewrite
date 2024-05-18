local Lib = {}

-- Core

function Lib:Chance(percent: number, max: number)
	if math.random(1, max) <= percent then
		return true
	else
		return false
	end
end

function Lib:Choose(table : {any})
	local amount = 0
	local tableOfRanges = {}
	for i, v in ipairs(table) do
		tableOfRanges[i] = NumberRange.new(amount, amount + v.Chance)
		amount += v.Chance	
	end
	local chosenNumber = math.random(1, amount)
	for i, v in ipairs(tableOfRanges) do
		if chosenNumber > v.Min and chosenNumber <= v.Max then
			return table[i]
		end
	end
end 

function Lib:ReturnChance(percent: number, total: number) -- sani
	return math.floor((percent / total * 100) * 10 + 0.5) / 10
end

function Lib:Lerp(a: number, b: number, t: number)
	return a + ((b - a) * t)
end

-- End
function Lib:Init(comments: boolean)
	if comments then
		warn("[Multilib-" .. script.Name .. "]", script.Name, "Lib Loaded & safe to use.")
	end
end

return Lib