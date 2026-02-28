-- [[ MADZTCX HUB: COPY AVATAR + KEY SYSTEM ]] --
local MY_KEY = "AHJDI-KBSUWU-JQBUD" -- KEY KHUSUS BOS MADZTCX

local Lplr = game.Players.LocalPlayer
local PlayerGui = Lplr:WaitForChild("PlayerGui")

-- 1. UI UNTUK MASUKIN KEY
if PlayerGui:FindFirstChild("MadztcxKeySystem") then PlayerGui.MadztcxKeySystem:Destroy() end
local KeyGui = Instance.new("ScreenGui", PlayerGui)
KeyGui.Name = "MadztcxKeySystem"

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Size = UDim2.new(0, 250, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -125, 0.4, 0)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", KeyFrame)

local Title = Instance.new("TextLabel", KeyFrame)
Title.Text = "MADZTCX HUB - ENTER KEY"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.PlaceholderText = "Input Key Here..."
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyInput)

local CheckBtn = Instance.new("TextButton", KeyFrame)
CheckBtn.Text = "ACTIVATE"
CheckBtn.Size = UDim2.new(0.8, 0, 0, 35)
CheckBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
CheckBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", CheckBtn)

-- 2. LOGIKA VERIFIKASI KEY
CheckBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == MY_KEY then
        KeyGui:Destroy()
        
        -- JALANKAN SCRIPT COPY AVATAR
        local ScreenGui = Instance.new("ScreenGui", PlayerGui)
        ScreenGui.Name = "MadztcxAntiParasit"
        local Button = Instance.new("TextButton", ScreenGui)
        Button.Size = UDim2.new(0, 160, 0, 50)
        Button.Position = UDim2.new(0.4, 0, 0.1, 0)
        Button.BackgroundColor3 = Color3.fromRGB(0, 50, 20)
        Button.Text = "COPY AVATAR"
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Draggable = true
        Button.Active = true
        Instance.new("UICorner", Button)

        Button.MouseButton1Click:Connect(function()
            local Target = nil
            local Dist = math.huge
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= Lplr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local Mag = (Lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Mag < Dist then Dist = Mag Target = v end
                end
            end

            if Target and Target.Character then
                local Char = Lplr.Character
                for _, obj in pairs(Char:GetChildren()) do
                    if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("BodyColors") then
                        obj:Destroy()
                    end
                end

                for _, obj in pairs(Target.Character:GetChildren()) do
                    if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("BodyColors") then
                        local clone = obj:Clone()
                        for _, sub in pairs(clone:GetDescendants()) do
                            if sub:IsA("Weld") or sub:IsA("WeldConstraint") or sub:IsA("ManualWeld") then
                                sub:Destroy()
                            end
                        end
                        clone.Parent = Char
                    end
                end

                local Hum = Char:FindFirstChildOfClass("Humanoid")
                if Hum then
                    task.wait(0.1)
                    Hum:BuildRigFromAttachments()
                end
            end
        end)
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "WRONG KEY!"
        task.wait(1)
        KeyInput.PlaceholderText = "Input Key Here..."
    end
end)
