local LF_AIMBOT_GUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local PlrToAimAt = Instance.new("TextBox")
local StartAiming = Instance.new("TextButton")
local StopAiming = Instance.new("TextButton")
local Border1 = Instance.new("Frame")
local Border2 = Instance.new("Frame")
local Border3 = Instance.new("Frame")
local Border4 = Instance.new("Frame")
local FixCamera = Instance.new("TextButton")

-- Properties:
LF_AIMBOT_GUI.Name = "LF_AIMBOT_GUI"
LF_AIMBOT_GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
LF_AIMBOT_GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = LF_AIMBOT_GUI
Frame.Active = true
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BackgroundTransparency = 0.7
Frame.BorderSizePixel = 5
Frame.Position = UDim2.new(0.15, 0, 0.65, 0)
Frame.Size = UDim2.new(0, 233, 0, 132)

PlrToAimAt.Name = "PlrToAimAt"
PlrToAimAt.Parent = Frame
PlrToAimAt.BackgroundColor3 = Color3.new(0.57, 0.57, 0.57)
PlrToAimAt.BackgroundTransparency = 0.3
PlrToAimAt.Position = UDim2.new(0.07, 0, 0.06, 0)
PlrToAimAt.Size = UDim2.new(0, 200, 0, 30)
PlrToAimAt.Font = Enum.Font.SourceSans
PlrToAimAt.PlaceholderText = "Player Name"
PlrToAimAt.TextColor3 = Color3.new(0, 0, 0)
PlrToAimAt.TextSize = 14

StartAiming.Name = "StartAiming"
StartAiming.Parent = Frame
StartAiming.BackgroundColor3 = Color3.new(0, 0, 0)
StartAiming.Position = UDim2.new(0.03, 0, 0.35, 0)
StartAiming.Size = UDim2.new(0, 200, 0, 30)
StartAiming.Font = Enum.Font.SourceSans
StartAiming.Text = "Turn Aimbot ON"
StartAiming.TextColor3 = Color3.new(0, 1, 1)
StartAiming.TextSize = 14

StopAiming.Name = "StopAiming"
StopAiming.Parent = Frame
StopAiming.BackgroundColor3 = Color3.new(0, 0, 0)
StopAiming.Position = UDim2.new(0.03, 0, 0.52, 0)
StopAiming.Size = UDim2.new(0, 200, 0, 30)
StopAiming.Font = Enum.Font.SourceSans
StopAiming.Text = "Turn Aimbot OFF"
StopAiming.TextColor3 = Color3.new(0, 1, 1)
StopAiming.TextSize = 14

FixCamera.Name = "FixCamera"
FixCamera.Parent = Frame
FixCamera.BackgroundColor3 = Color3.new(0, 0, 0)
FixCamera.Position = UDim2.new(0.54, 0, 0.77, 0)
FixCamera.Size = UDim2.new(0, 90, 0, 30)
FixCamera.Font = Enum.Font.SourceSans
FixCamera.Text = "Fix Camera"
FixCamera.TextColor3 = Color3.new(0, 1, 1)
FixCamera.TextSize = 14

Border1.Name = "Border1"
Border1.Parent = Frame
Border1.BackgroundColor3 = Color3.new(1, 1, 1)
Border1.BorderSizePixel = 0
Border1.Position = UDim2.new(-0.03, 0, 0, 0)
Border1.Size = UDim2.new(0, 6, 0, 132)

Border2.Name = "Border2"
Border2.Parent = Frame
Border2.BackgroundColor3 = Color3.new(1, 1, 1)
Border2.BorderSizePixel = 0
Border2.Position = UDim2.new(1, 0, 0, 0)
Border2.Size = UDim2.new(0, 6, 0, 132)

Border3.Name = "Border3"
Border3.Parent = Frame
Border3.BackgroundColor3 = Color3.new(1, 1, 1)
Border3.BorderSizePixel = 0
Border3.Position = UDim2.new(-0.03, 0, -0.05, 0)
Border3.Size = UDim2.new(0, 245, 0, 6)

Border4.Name = "Border4"
Border4.Parent = Frame
Border4.BackgroundColor3 = Color3.new(1, 1, 1)
Border4.BorderSizePixel = 0
Border4.Position = UDim2.new(-0.03, 0, 1, 0)
Border4.Size = UDim2.new(0, 245, 0, 6)

-- Functions:

function makeAimPart(name)
    local SetParent = game.Workspace[name]
    local AimPart_1 = Instance.new("Part")
    AimPart_1.Size = Vector3.new(1, 1, 1)
    AimPart_1.Material = Enum.Material.Plastic
    AimPart_1.CFrame = CFrame.new(2, 8, 7)
    AimPart_1.BrickColor = BrickColor.new("Medium stone grey")
    AimPart_1.Locked = false
    AimPart_1.CastShadow = true
    AimPart_1.Transparency = 1
    AimPart_1.Reflectance = 0
    AimPart_1.Name = "AimPart"
    AimPart_1.Anchored = true
    AimPart_1.Archivable = true
    AimPart_1.CanCollide = false
    AimPart_1.CollisionGroupId = 0
    AimPart_1.Massless = false
    AimPart_1.Shape = Enum.PartType.Block
    AimPart_1.TopSurface = Enum.SurfaceType.Smooth
    AimPart_1.BottomSurface = Enum.SurfaceType.Smooth
    AimPart_1.RightSurface = Enum.SurfaceType.Smooth
    AimPart_1.LeftSurface = Enum.SurfaceType.Smooth
    AimPart_1.FrontSurface = Enum.SurfaceType.Smooth
    AimPart_1.BackSurface = Enum.SurfaceType.Smooth
    AimPart_1.Parent = SetParent
    return game.Workspace[name]:WaitForChild("AimPart")
end

-- Draggable Frame Logic:
local UIS = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Event connections:

StartAiming.MouseButton1Click:Connect(function()
    local username = PlrToAimAt.Text
    if username == "" then
        return -- Don't proceed if the player name field is empty
    end
    local CC = game.Workspace.CurrentCamera
    local AimAt = makeAimPart(username)
    CC.CameraType = Enum.CameraType.Scriptable
    local fixedCam = false
    
    while true do
        if not fixedCam then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local cam = workspace.CurrentCamera
                cam.CameraSubject = player.Character.Humanoid
                cam.CameraType = Enum.CameraType.Custom
            end
            fixedCam = true
        else
            CC.CFrame = CFrame.new(CC.CFrame.p, AimAt.CFrame.p)
            local aimPart = game.Workspace[username].AimPart
            local qb = game.Players.LocalPlayer.Character
            local wr = game.Workspace[username]
            local mag = (qb.HumanoidRootPart.Position - wr.HumanoidRootPart.Position).magnitude
            local set = mag / 6
            local x = wr.Head.Position.X
            local y = wr.Head.Position.Y + set
            local z = wr.Head.Position.Z
            aimPart.Position = Vector3.new(x, y, z)
        end
        wait()
    end
end)

StopAiming.MouseButton1Click:Connect(function()
    local CC = game.Workspace.CurrentCamera
    CC:Destroy()
    wait(0.1)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local cam = workspace.CurrentCamera
        cam.CameraSubject = player.Character.Humanoid
        cam.CameraType = Enum.CameraType.Custom
    end
end)

FixCamera.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local cam = workspace.CurrentCamera
        cam.CameraSubject = player.Character.Humanoid
        cam.CameraType = Enum.CameraType.Custom
    end
end)
