-- \\ If the whitelist API is down make sure to refresh before adding a whitelist! // --
local CometID = {
	[4301887151] = true, --//Solar
    [4407833389] = true; --//Arctis
}

local StarID = {}

local MoonID = {
	[3468728207] = true,
}



function premium()
	for _,v in pairs(game:GetService('Players'):GetChildren()) do
		if CometID[v.UserId] then
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[☄]'..v.DisplayName)
				end
			end
		elseif StarID[v.UserId] then
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[🌠]'..v.DisplayName)
				end
			end
		elseif MoonID[v.UserId] then
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[🌑]'..v.DisplayName)
				end
			end
		elseif v.Character then
			if v.Character.Parent.Name == 'Players' then
				if not v.Character.UpperTorso:FindFirstChild('BodyBackAttachment') then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[🌑]'..v.DisplayName)
				end
			end
		end
	end
end
local success,err = pcall(premium)
return CometID
