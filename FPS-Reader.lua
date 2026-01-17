local _0xR = game:GetService("RunService")
local _0xP = game.Players.LocalPlayer
local _0xG = _0xP:WaitForChild("PlayerGui")

local sg = Instance.new("ScreenGui", _0xG)
sg.Name = "KiraFPS_Final_v2"
sg.ResetOnSpawn = false

local fpsLabel = Instance.new("TextLabel", sg)
fpsLabel.Size = UDim2.new(0, 120, 0, 35)
fpsLabel.Position = UDim2.new(0, 80, 0, 5) 
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
fpsLabel.TextSize = 22 
fpsLabel.Font = Enum.Font.Code
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Text = "" 

local f = 0
local t = tick()

_0xR.RenderStepped:Connect(function() 
    f = f + 1 
    if tick() - t >= 1 then 
        fpsLabel.Text = "FPS: " .. f
        f = 0
        t = tick() 
    end 
end)
