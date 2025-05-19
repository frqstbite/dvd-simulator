-- Services
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local StarterGui = game:GetService("StarterGui")

-- Imports
local components = script:WaitForChild("Components")
local packages = ReplicatedFirst:WaitForChild("Packages")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Requires
local Fusion = require(packages:WaitForChild("Fusion"))
local Children = Fusion.Children

-- Disable CoreGUI
task.spawn(function()
    repeat
        local success = pcall(function()
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
            StarterGui:SetCore("ResetButtonCallback", false)
        end)
        task.wait()
    until success
end)

-- UI
local scope = Fusion.scoped(Fusion, {
    DVDScreen = require(components:WaitForChild("DVDScreen")),
})
  
scope:New "ScreenGui" {
    ClipToDeviceSafeArea = false,
    Name = "DVD Player",
    Parent = playerGui,
    SafeAreaCompatibility = Enum.SafeAreaCompatibility.None,
    ScreenInsets = Enum.ScreenInsets.None,

    [Children] = scope:New "Frame" {
        Name = "Background",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0,

        [Children] = scope:New "Frame" {
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundTransparency = 1,
            Name = "Content",
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.new(1, 0, 1, -36),

            [Children] = scope:DVDScreen {
                Colors = {
                    Color3.fromRGB(221, 40, 40),
                    Color3.fromRGB(11, 0, 220),
                    Color3.fromRGB(236, 126, 0),
                    Color3.fromRGB(24, 90, 19),
                    Color3.fromRGB(170, 20, 97),
                    Color3.fromRGB(255, 238, 0),
                    Color3.fromRGB(229, 0, 218),
                },
            }
        }
    }
}