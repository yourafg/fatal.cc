local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local UI = {}

function UI:loadwindow()
    local loader = Instance.new("ScreenGui")
    local mainload = Instance.new("Frame")
    local fatal = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")

    loader.Name = "loader"
    loader.IgnoreGuiInset = true
    loader.ResetOnSpawn = false
    loader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    mainload.Name = "mainload"
    mainload.Parent = loader
    mainload.AnchorPoint = Vector2.new(0.5, 0.5)
    mainload.BackgroundColor3 = Color3.fromRGB(22, 26, 32)
    mainload.BorderSizePixel = 0
    mainload.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainload.Size = UDim2.new(0, 0, 0, 0)
    mainload.BackgroundTransparency = 1

    fatal.Name = "fatal"
    fatal.Parent = mainload
    fatal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fatal.BorderSizePixel = 0
    fatal.Size = UDim2.new(1, 0, 1, 0)
    fatal.Image = "rbxassetid://75875530059043"
    fatal.ImageTransparency = 1
    fatal.BackgroundTransparency = 1
    fatal.Rotation = 0

    UICorner.Parent = fatal
    UICorner_2.Parent = mainload

    TweenService:Create(mainload, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 250, 0, 200),
        BackgroundTransparency = 0
    }):Play()

    TweenService:Create(fatal, TweenInfo.new(0.6), {
        ImageTransparency = 0,
        BackgroundTransparency = 0
    }):Play()

    task.delay(3, function()
        local rotationConnection
        rotationConnection = RunService.RenderStepped:Connect(function()
            fatal.Rotation += 2
        end)

        TweenService:Create(mainload, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()

        local fadeOut = TweenService:Create(fatal, TweenInfo.new(1), {
            ImageTransparency = 1,
            BackgroundTransparency = 1
        })
        fadeOut:Play()

        fadeOut.Completed:Connect(function()
            rotationConnection:Disconnect()
            loader:Destroy()
        end)
    end)
end

return UI
