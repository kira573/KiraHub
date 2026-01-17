-- [[ 
--    PROJECT: TITANIUM BOOSTER V1
--    SECURITY: GOOGLE CLOUD KEY SYSTEM
--    VERSION: SECURE_CORE_FINAL
--    AUTHOR: KIRA573
-- ]]

local SCRIPT_URL = "https://script.google.com/macros/s/AKfycbxLWkFeYYJPw-NUxTe5-2UMjI4uhYGAeI7xcuzynbh-hX_dD4YCCivhPp6WI4RUBMuAnA/exec"

local _0xP = game.Players.LocalPlayer
local _0xG = _0xP:WaitForChild("PlayerGui")

-- 1. License Verification Engine
local function CheckLicense(userKey)
    local success, result = pcall(function()
        return game:HttpGet(SCRIPT_URL .. "?key=" .. userKey)
    end)
    
    if success then
        return result 
    end
    return "ERROR"
end

-- 2. Authentication UI
local function CreateLoginUI()
    if _0xG:FindFirstChild("TitaniumAuth") then _0xG.TitaniumAuth:Destroy() end
    local sg = Instance.new("ScreenGui", _0xG); sg.Name = "TitaniumAuth"
    
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 340, 0, 190); main.Position = UDim2.new(0.5, -170, 0.5, -95)
    main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); main.BorderSizePixel = 2; main.BorderColor3 = Color3.new(1, 1, 0)
    main.Active = true; main.Draggable = true

    local close = Instance.new("TextButton", main)
    close.Size = UDim2.new(0, 30, 0, 30); close.Position = UDim2.new(1, -35, 0, 5)
    close.Text = "X"; close.TextColor3 = Color3.new(1, 0, 0); close.BackgroundTransparency = 1; close.TextSize = 25
    close.MouseButton1Click:Connect(function() sg:Destroy() end)

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0, 50); title.Text = "SYSTEM AUTHENTICATION"; title.TextColor3 = Color3.new(1, 1, 0)
    title.BackgroundTransparency = 1; title.TextSize = 18; title.Font = Enum.Font.LuckiestGuy

    local input = Instance.new("TextBox", main)
    input.Size = UDim2.new(0.8, 0, 0, 40); input.Position = UDim2.new(0.1, 0, 0.35, 0)
    input.PlaceholderText = "Enter Key Here..."; input.Text = ""; input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    input.TextColor3 = Color3.new(1, 1, 1); input.TextSize = 16

    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0.8, 0, 0, 40); btn.Position = UDim2.new(0.1, 0, 0.7, 0)
    btn.Text = "VERIFY LICENSE"; btn.BackgroundColor3 = Color3.new(1, 1, 0); btn.TextColor3 = Color3.new(0, 0, 0)
    btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 18

    btn.MouseButton1Click:Connect(function()
        local key = input.Text
        btn.Text = "CONNECTING..."; btn.BackgroundColor3 = Color3.new(0.5, 0.5, 0)
        
        local status = CheckLicense(key)
        
        if status == "Success" then
            btn.Text = "ACCESS GRANTED!"; btn.BackgroundColor3 = Color3.new(0, 1, 0)
            task.wait(1); sg:Destroy()
            StartBooster() 
        elseif status == "Expired" then
            btn.Text = "KEY EXPIRED!"; btn.BackgroundColor3 = Color3.new(1, 0, 0)
        elseif status == "LimitReached" then
            btn.Text = "MAX LIMIT REACHED!"; btn.BackgroundColor3 = Color3.new(1, 0.5, 0)
        else
            btn.Text = "INVALID LICENSE KEY!"; btn.BackgroundColor3 = Color3.new(1, 0, 0)
        end
        task.wait(2); btn.Text = "VERIFY LICENSE"; btn.BackgroundColor3 = Color3.new(1, 1, 0)
    end)
end

-- 3. Booster Logic
function StartBooster()
    local _0xR = game:GetService("RunService")
    task.spawn(function()
        local gui = Instance.new("ScreenGui", _0xG); gui.Name = "SystemLoading"
        local f = Instance.new("Frame", gui)
        f.Size = UDim2.new(0, 260, 0, 130); f.Position = UDim2.new(0.5, -130, 0.5, -65)
        f.BackgroundColor3 = Color3.new(0,0,0); f.BorderSizePixel = 3; f.BorderColor3 = Color3.new(1, 1, 0)
        local t = Instance.new("TextLabel", f)
        t.Size = UDim2.new(1, 0, 0.6, 0); t.BackgroundTransparency = 1; t.Text = "TITANIUM BOOSTER"; t.TextColor3 = Color3.new(1, 1, 0); t.TextSize = 25; t.Font = Enum.Font.LuckiestGuy
        task.wait(2.5); gui:Destroy()
    end)
    
    task.spawn(function()
        while true do
            settings().Rendering.QualityLevel = 1
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("BasePart") then v.Material = Enum.Material.Plastic; v.CastShadow = false end
                if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
            end
            task.wait(1)
        end
    end)
end

CreateLoginUI()
