function createNotification(title, message, duration)
    local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    gui.Name = "NotificationGui"

    local frame = Instance.new("Frame", gui)
    frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    frame.Position = UDim2.new(0.5, -150, 1, -120)
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.BorderSizePixel = 0

    local uicorner = Instance.new("UICorner", frame)
    uicorner.CornerRadius = UDim.new(0, 10)

    local titleText = Instance.new("TextLabel", frame)
    titleText.Text = title
    titleText.Position = UDim2.new(0, 10, 0, 10)
    titleText.Size = UDim2.new(1, -20, 0, 25)
    titleText.Font = Enum.Font.SourceSansBold
    titleText.TextSize = 18
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.BackgroundTransparency = 1

    local messageText = Instance.new("TextLabel", frame)
    messageText.Text = message
    messageText.TextScaled = true
    messageText.Position = UDim2.new(0, 10, 0, 35)
    messageText.Size = UDim2.new(1, -20, 0, 25)
    messageText.Font = Enum.Font.SourceSans
    messageText.TextSize = 16
    messageText.TextColor3 = Color3.fromRGB(200, 200, 200)
    messageText.BackgroundTransparency = 1

    gui.Enabled = true
    wait(duration or 5)
    gui:Destroy()
end
