local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Madztcx HUB",
   LoadingTitle = "Direct Access Mode",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Fishing", 4483345998)

MainTab:CreateToggle({
   Name = "Auto Fish Mode",
   CurrentValue = false,
   Callback = function(Value)
      _G.Fishing = Value
      while _G.Fishing do
         local args = {
            "Caught",
            2
         }
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteHandler"):WaitForChild("Fishing"):FireServer(unpack(args))
         task.wait(0.5)
      end
   end,
})

Rayfield:Notify({
   Title = "Madztcx HUB Active",
   Content = "Selamat mancing, Bos!",
   Duration = 5
})
