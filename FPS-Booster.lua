-- [[ 
--    PROJECT: TITANIUM BOOSTER V1
--    STATUS: EXTREME PERFORMANCE MODE
--    AUTHOR: KIRA573
-- ]]

local _0xR = game:GetService("RunService")
local _0xP = game.Players.LocalPlayer
local _0xG = _0xP:WaitForChild("PlayerGui")

-- 1. INTRO UI (SYSTEM INITIALIZATION)
local function _0xINTRO_FINAL()
    if _0xG:FindFirstChild("SystemLoading") then _0xG.SystemLoading:Destroy() end
    local gui = Instance.new("ScreenGui", _0xG); gui.Name = "SystemLoading"
    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 260, 0, 130); frame.Position = UDim2.new(0.5, -130, 0.5, -65)
    frame.BackgroundColor3 = Color3.new(0,0,0); frame.BorderSizePixel = 3; frame.BorderColor3 = Color3.new(1, 1, 0)
    
    local t = Instance.new("TextLabel", frame)
    t.Size = UDim2.new(1, 0, 0.6, 0); t.BackgroundTransparency = 1; t.Text = "TITANIUM BOOSTER"; t.TextColor3 = Color3.new(1, 1, 0); t.TextSize = 25; t.Font = Enum.Font.LuckiestGuy
    
    local barBg = Instance.new("Frame", frame); barBg.Size = UDim2.new(0.8, 0, 0.1, 0); barBg.Position = UDim2.new(0.1, 0, 0.7, 0); barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local bar = Instance.new("Frame", barBg); bar.Size = UDim2.new(0, 0, 1, 0); bar.BackgroundColor3 = Color3.new(1, 1, 0)
    
    for i = 0, 1, 0.2 do bar:TweenSize(UDim2.new(i, 0, 1, 0), "Out", "Linear", 0.08, true); task.wait(0.1) end
    task.wait(0.4); gui:Destroy()
end

-- 2. FPS COUNTER (HUD SYSTEM)
local function _0xSTATS()
    if _0xG:FindFirstChild("SystemStats") then _0xG.SystemStats:Destroy() end
    local sg = Instance.new("ScreenGui", _0xG); sg.Name = "SystemStats"; sg.ResetOnSpawn = false
    local l = Instance.new("TextLabel", sg)
    l.Size = UDim2.new(0, 150, 0, 30); l.Position = UDim2.new(0, 55, 0, 10); l.BackgroundTransparency = 1; l.TextColor3 = Color3.new(0, 0, 0); l.TextSize = 22; l.Font = Enum.Font.Code; l.TextXAlignment = Enum.TextXAlignment.Left
    
    local f = 0; local t = tick()
    _0xR.RenderStepped:Connect(function() f = f + 1 if tick() - t >= 1 then l.Text = "FPS: " .. f; f = 0; t = tick() end end)
end

-- 3. EXTREME OPTIMIZATION ENGINE
local function _0xFORCE_DESTRUCTION()
    -- Global Optimization Settings
    settings().Rendering.QualityLevel = 1
    game:GetService("MaterialService").Use2022Materials = false
    
    local lit = game:GetService("Lighting")
    lit.GlobalShadows = false
    lit.Brightness = 0
    
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.CastShadow = false
            v.Reflectance = 0
            if v:IsA("MeshPart") then
                v.TextureId = ""
                v.RenderFidelity = Enum.RenderFidelity.Performance
            end
        elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("SurfaceAppearance") then
            v:Destroy()
        elseif v:IsA("SpecialMesh") then
            v:Destroy()
        end
    end

    -- Terrain Optimization
    local ter = workspace:FindFirstChildOfClass("Terrain")
    if ter then
        ter.WaterWaveSize = 0; ter.WaterWaveSpeed = 0; ter.WaterReflectance = 0; ter.WaterTransparency = 1
    end
end

-- Execution Initialization
task.spawn(_0xINTRO_FINAL)
task.spawn(_0xSTATS)
task.spawn(function()
    while true do
        _0xFORCE_DESTRUCTION()
        task.wait(0.5)
    end
end)
