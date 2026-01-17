-- [[ KIRA HUB - TITANIUM EDITION ]]
-- SECURITY: GOOGLE CLOUD KEY SYSTEM
-- VERSION: 1.0.2

local SCRIPT_URL = "https://script.google.com/macros/s/AKfycbw-fLoXMan1Dl-5ZlTvx5Wp1Hpk6O1HbhSQKgryuvbbABghlyW_af52pad8ygXsiAGByA/exec"

-- FPS Booster Logic
local function ActivateFPSBooster()
    print("Titanium System: FPS Booster Activated!")
    
    settings().Rendering.QualityLevel = 1
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.CastShadow = false
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "TITANIUM HUB",
        Text = "System Optimized Successfully!",
        Duration = 5
    })
end

-- Authentication UI
local function CreateLoginUI()
    local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
    sg.Name = "KiraAuthSystem"
    
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 300, 0, 160)
    main.Position = UDim2.new(0.5, -150, 0.5, -80)
    main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    main.BorderSizePixel = 2
    main.BorderColor3 = Color3.new(1, 1, 0)
    
    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "TITANIUM KEY SYSTEM"
    title.TextColor3 = Color3.new(1, 1, 0)
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.BackgroundTransparency = 1
    
    local input = Instance.new("TextBox", main)
    input.Size = UDim2.new(0.8, 0, 0, 35)
    input.Position = UDim2.new(0.1, 0, 0.35, 0)
    input.PlaceholderText = "Enter Key..."
    input.Text = ""
    input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    input.TextColor3 = Color3.new(1, 1, 1)
    
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0.7, 0)
    btn.Text = "VERIFY LOGIN"
    btn.BackgroundColor3 = Color3.new(1, 1, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.new(0, 0, 0)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "CHECKING..."
        local key = input.Text
        
        local success, result = pcall(function()
            return game:HttpGet(SCRIPT_URL .. "?key=" .. key)
        end)
        
        if success and result == "Success" then
            btn.Text = "ACCESS GRANTED"
            btn.BackgroundColor3 = Color3.new(0, 1, 0)
            task.wait(1)
            sg:Destroy()
            ActivateFPSBooster()
        else
            btn.Text = "INVALID KEY"
            btn.BackgroundColor3 = Color3.new(1, 0, 0)
            task.wait(2)
            btn.Text = "VERIFY LOGIN"
            btn.BackgroundColor3 = Color3.new(1, 1, 0)
        end
    end)
end

CreateLoginUI()
