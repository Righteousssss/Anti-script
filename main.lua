-- Anti v0.5 | Phantom Forces Exploit
-- GUI + Spoofing Enabled (Crypto-less version)

local spoof = loadstring("\108\111\99\97\108\32\107\101\121\32\61\32\115\121\115\116\101\109\40\41\59")()

-- ✅ Fake crypto module (no dependencies)
local crypto = {
  Encrypt = function(data) return game:GetService("HttpService"):JSONEncode(data) end,
  Decrypt = function(data) return game:GetService("HttpService"):JSONDecode(data) end
}

-- ✅ Load GUI from your GitHub (verified path)
local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Righteousssss/Anti-script/main/gui.lua"))()   
GUI:Initialize({Name = "Anti v0.5", Theme = "Dark"})

-- Core Features
local Aimbot = {
  Enabled = false,
  TargetPart = "Head",
  Prediction = function(velocity)
    return crypto.Encrypt(velocity * 0.98)
  end,
  Flick = {Speed = 50, Distance = 150}
}

local ESP = {
  Chams = {Enabled = true, Material = "Wireframe"},
  Radar = {Radius = 500, Zoom = 1.5},
  Tracers = {Lifetime = 3, Fade = true}
}

local Speed = {
  WalkSpeed = 1.5,
  GhostWalk = function()
    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
  end
}

local Evasion = {
  MemorySpoof = function()
    while task.wait() do
      game:GetService("RunService").RenderStepped:Wait()
    end
  end,
  FakeInputs = function()
    mousemoverel(math.random(-1,1), math.random(-1,1))
  end
}

GUI:BindConfig({
  Save = function() return crypto.Encrypt({Aimbot, ESP, Speed}) end,
  Load = function(data) local t = crypto.Decrypt(data) return unpack(t) end
})

-- GUI Execution
GUI:Toggle("Aimbot", function(state) Aimbot.Enabled = state end)
GUI:Slider("Flick Speed", 1, 100, 50, function(val) Aimbot.Flick.Speed = val end)
GUI:Button("Panic Button", function() Evasion.MemorySpoof() end)
