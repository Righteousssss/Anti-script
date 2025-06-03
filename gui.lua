-- gui.lua replacement module
local GUI = {}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AntiGUI"
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = MainFrame
UIListLayout.Padding = UDim.new(0, 6)

function GUI:Initialize(cfg)
	local title = Instance.new("TextLabel")
	title.Text = cfg.Name or "Anti GUI"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, 0, 0, 30)
	title.Font = Enum.Font.SourceSansBold
	title.Parent = MainFrame
end

function GUI:Toggle(name, callback)
	local toggle = Instance.new("TextButton")
	toggle.Text = "[OFF] " .. name
	toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	toggle.Size = UDim2.new(1, 0, 0, 30)
	toggle.Font = Enum.Font.SourceSans
	toggle.TextScaled = true
	toggle.Parent = MainFrame

	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = (state and "[ON] " or "[OFF] ") .. name
		callback(state)
	end)
end

function GUI:Slider(name, min, max, default, callback)
	local slider = Instance.new("TextButton")
	slider.Text = name .. ": " .. tostring(default)
	slider.TextColor3 = Color3.fromRGB(255, 255, 255)
	slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	slider.Size = UDim2.new(1, 0, 0, 30)
	slider.Font = Enum.Font.SourceSans
	slider.TextScaled = true
	slider.Parent = MainFrame

	local value = default
	slider.MouseButton1Click:Connect(function()
		value = value + 1
		if value > max then value = min end
		slider.Text = name .. ": " .. tostring(value)
		callback(value)
	end)
end

function GUI:Button(name, callback)
	local button = Instance.new("TextButton")
	button.Text = name
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	button.Size = UDim2.new(1, 0, 0, 30)
	button.Font = Enum.Font.SourceSans
	button.TextScaled = true
	button.Parent = MainFrame

	button.MouseButton1Click:Connect(callback)
end

function GUI:BindConfig(cfg)
	-- Optional config stub
end

return GUI
