local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "KiraFPS_Final_Clean"
ScreenGui.ResetOnSpawn = false

local fpsLabel = Instance.new("TextLabel", ScreenGui)
fpsLabel.Size = UDim2.new(0, 150, 0, 40)
fpsLabel.Position = UDim2.new(0, 80, 0, 5) 
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
fpsLabel.TextStrokeTransparency = 0.8
fpsLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = 22 
fpsLabel.Font = Enum.Font.Code
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Text = "" 

local frameCount = 0
local lastUpdate = tick()

RunService.RenderStepped:Connect(function() 
    frameCount = frameCount + 1 
    if tick() - lastUpdate >= 1 then 
        fpsLabel.Text = "FPS: " .. frameCount
        frameCount = 0
        lastUpdate = tick() 
    end 
end)
