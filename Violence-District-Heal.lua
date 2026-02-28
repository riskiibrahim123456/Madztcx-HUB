-- [[ DARK-GPT STABLE UI - MADZTCX HUB HEAL & REVIVE ]] --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local HealBtn = Instance.new("TextButton")
local ReviveBtn = Instance.new("TextButton")
local HideBtn = Instance.new("TextButton")

-- PROTEKSI BIAR UI MUNCUL (Sesuai Standar Madztcx HUB)
ScreenGui.Name = "MadztcxStable_V4"
pcall(function()
    if game:GetService("RunService"):IsStudio() then
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    else
        ScreenGui.Parent = game.CoreGui
    end
end)

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 150) -- Ukuran pas buat 2 tombol + title
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "MADZTCX HUB TOOLS"
Title.TextColor3 = Color3.fromRGB(0, 255, 136) -- Gue ganti hijau neon biar makin keren
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1

local function style(btn, pos, text, color)
    btn.Parent = MainFrame
    btn.Position = pos
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    Instance.new("UICorner", btn)
end

-- Setup Tombol Sesuai Script Murni Madztcx HUB
style(HealBtn, UDim2.new(0.05, 0, 0.3, 0), "FORCE HEAL", Color3.fromRGB(40, 40, 40))
style(ReviveBtn, UDim2.new(0.05, 0, 0.58, 0), "REVIVE", Color3.fromRGB(40, 40, 40))
style(HideBtn, UDim2.new(0.05, 0, 0.85, 0), "MINIMIZE", Color3.fromRGB(150, 0, 0))

-- LOGIKA HEAL (SCRIPT MURNI MADZTCX)
HealBtn.MouseButton1Click:Connect(function()
    local args = {
        game:GetService("Players"):WaitForChild("KeceCaldwell").Character:WaitForChild("HumanoidRootPart"),
        true
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Healing"):WaitForChild("HealEvent"):FireServer(unpack(args))
end)

-- LOGIKA REVIVE (SCRIPT MURNI MADZTCX)
ReviveBtn.MouseButton1Click:Connect(function()
    local args = {
        true,
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Bandage"):WaitForChild("Right Arm"):WaitForChild("Bandage")
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Items"):WaitForChild("Bandage"):WaitForChild("Fire"):FireServer(unpack(args))
end)

-- HIDE LOGIC (Sesuai Request Madztcx HUB)
local m = false
HideBtn.MouseButton1Click:Connect(function()
    m = not m
    HealBtn.Visible, ReviveBtn.Visible = not m, not m
    MainFrame.Size = m and UDim2.new(0, 200, 0, 40) or UDim2.new(0, 200, 0, 150)
    HideBtn.Text = m and "OPEN" or "MINIMIZE"
    HideBtn.Position = m and UDim2.new(0.05, 0, 0.4, 0) or UDim2.new(0.05, 0, 0.85, 0)
    HideBtn.BackgroundTransparency = m and 1 or 0
end)
