local ReplicatedFirst = game:GetService("ReplicatedFirst")
local packages = ReplicatedFirst:WaitForChild("Packages")

local Fusion = require(packages:WaitForChild("Fusion"))
local Children = Fusion.Children

type DVDScreenProps = {
    Colors: { Color3 },
}

return function(scope: Fusion.Scope<typeof(Fusion)>, props: DVDScreenProps): Frame
    local collisions = scope:Value(0)

    local color = scope:Computed(function(use)
        local c = use(collisions)
        if c == 0 then
            return Color3.new(1, 1, 1)
        end

        local colors = use(props.Colors)
        local index = use(collisions) % #colors
        return colors[index]
    end)

    return scope:New "Frame" {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Name = "DVD Screen",
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),

        [Children] = {
            scope:New "UIStroke" {
                Color = color,
                Thickness = 5,
            },

            scope:New "ImageLabel" {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://9810231043",
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromOffset(50, 50),
            },
        },
    } :: Frame
end