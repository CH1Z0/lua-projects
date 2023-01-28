-- Gui to Lua
-- Version: 3.2

-- Instances:

local MainScreenGui = Instance.new("ScreenGui")
local BottomFrame = Instance.new("Frame")
local CashLabel = Instance.new("TextLabel")
local TopFrame = Instance.new("Frame")
local CashImage = Instance.new("ImageLabel")
local TitleLabel = Instance.new("TextLabel")

--Properties:

MainScreenGui.Name = "MainScreenGui"
MainScreenGui.Parent = game.CoreGui
MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BottomFrame.Name = "BottomFrame"
BottomFrame.Parent = MainScreenGui
BottomFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
BottomFrame.BorderSizePixel = 0
BottomFrame.Position = UDim2.new(0.0688360482, 0, 0.193150684, 0)
BottomFrame.Size = UDim2.new(0, 205, 0, 73)

CashLabel.Name = "CashLabel"
CashLabel.Parent = BottomFrame
CashLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CashLabel.BackgroundTransparency = 1.000
CashLabel.Position = UDim2.new(-0.00487804879, 0, 0.424657524, 0)
CashLabel.Size = UDim2.new(0, 205, 0, 42)
CashLabel.Font = Enum.Font.FredokaOne
CashLabel.Text = "</>"
CashLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CashLabel.TextSize = 20.000

TopFrame.Name = "TopFrame"
TopFrame.Parent = BottomFrame
TopFrame.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
TopFrame.BorderSizePixel = 0
TopFrame.Size = UDim2.new(0, 205, 0, 30)

CashImage.Name = "CashImage"
CashImage.Parent = TopFrame
CashImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CashImage.BackgroundTransparency = 1.000
CashImage.Position = UDim2.new(-0.00177112222, 0, 0, 0)
CashImage.Size = UDim2.new(0, 40, 0, 31)
CashImage.Image = "rbxassetid://12295910047"

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TopFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1.000
TitleLabel.Position = UDim2.new(0.193350822, 0, 0, 0)
TitleLabel.Size = UDim2.new(0, 165, 0, 31)
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.Text = "Star's Cash Counter"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20.000

-- Scripts:

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
			CashLabel.Text = "$"..checking(amount).." dropped"
		end)a
	end

local function BCGW_fake_script() -- BottomFrame.Dragify 
	local script = Instance.new('LocalScript', BottomFrame)

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
coroutine.wrap(BCGW_fake_script)()
