--//made this fast so the ui is trash
--//never gonna touch this again so feel free to steal

local CashCounter = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TitleLabel = Instance.new("TextLabel")
local CashLabel = Instance.new("TextLabel")

--Properties:

CashCounter.Name = "CashCounter"
CashCounter.Parent = game.CoreGui
CashCounter.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = CashCounter
MainFrame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
MainFrame.Position = UDim2.new(0.289110422, 0, 0.283227861, 0)
MainFrame.Size = UDim2.new(0.161042944, 0, 0.112341769, 0)

UICorner.CornerRadius = UDim.new(0, 9)
UICorner.Parent = MainFrame

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1.000
TitleLabel.Size = UDim2.new(1, 0, 0.267605633, 0)
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.Text = "Nachito's cash counter"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.TextSize = 14.000
TitleLabel.TextWrapped = true

CashLabel.Name = "CashLabel"
CashLabel.Parent = MainFrame
CashLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CashLabel.BackgroundTransparency = 1.000
CashLabel.Position = UDim2.new(0, 0, 0.267605633, 0)
CashLabel.Size = UDim2.new(1, 0, 0.732394338, 0)
CashLabel.Font = Enum.Font.FredokaOne
CashLabel.Text = "NIL"
CashLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CashLabel.TextSize = 30.000
CashLabel.TextWrapped = true

-- Scripts:

local function CWJI_fake_script() -- CashLabel.CashDroppedSript 
	local script = Instance.new('LocalScript', CashLabel)

	while wait() do
		pcall(function()
			local amount = 0
			for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
				if v.Name == "MoneyDrop" then
					local cash = string.split(v.BillboardGui.TextLabel.Text,"$")[2]
					if string.match(cash,',') then
						amount = amount + cash:gsub("%,","")
					else
						amount = amount + cash
					end
				end
			end
			local function checking(amount)
				amount = tostring(amount)
				return amount:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
			end
			script.Parent.Text = "$"..checking(amount).." dropped"
		end)
	end
end
coroutine.wrap(CWJI_fake_script)()
local function PVHNOTC_fake_script() -- MainFrame.Dragify 
	local script = Instance.new('LocalScript', MainFrame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(PVHNOTC_fake_script)()
