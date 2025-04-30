local UI = {}

function UI:CreateWindow()
    local loader = Instance.new("ScreenGui")
    local mainload = Instance.new("Frame")
    local fatal = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")

    loader.Name = "loader"
    loader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    mainload.Name = "mainload"
    mainload.Parent = loader
    mainload.AnchorPoint = Vector2.new(0.5, 0.5)
    mainload.BackgroundColor3 = Color3.fromRGB(22, 26, 32)
    mainload.BorderSizePixel = 0
    mainload.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainload.Size = UDim2.new(0, 250, 0, 200)

    fatal.Name = "fatal"
    fatal.Parent = mainload
    fatal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fatal.BorderSizePixel = 0
    fatal.Size = UDim2.new(1, 0, 1, 0)
    fatal.Image = "rbxassetid://75875530059043"

    UICorner.Parent = fatal
    UICorner_2.Parent = mainload

    -- Fade out after 3 seconds
    local TweenService = game:GetService("TweenService")
    task.delay(3, function()
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

        local frameTween = TweenService:Create(mainload, tweenInfo, {BackgroundTransparency = 1})
        local imageTween = TweenService:Create(fatal, tweenInfo, {ImageTransparency = 1, BackgroundTransparency = 1})

        frameTween:Play()
        imageTween:Play()

        imageTween.Completed:Connect(function()
            loader:Destroy()
        end)
    end)
end

return UI