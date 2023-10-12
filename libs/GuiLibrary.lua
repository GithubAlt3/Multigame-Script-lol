repeat task.wait() until game:IsLoaded()

local lplr = game.Players.LocalPlayer
local char = lplr.Character
local hum = char.Humanoid
local hrp = char.HumanoidRootPart
local prp = char.PrimaryPart
local light = game.Lighting
local l1 = light.Ambience
local l2 = light.OutdoorAmbience
local ts = game.TweenService
local textsrvce = game.TextChatService
local animations = hum.Animator
local rs = game.ReplicatedStorage

local newgui = Instance.new("ScreenGui", lplr.StarterGui)
newgui.ResetOnSpawn = false
newgui.IgnoreGuiInset = true
newgui.Name = math.random(1, 9e9)

local funcs = {
    StartAnimations = function(animid)
        if rs.AnimFolder then

        else
            local folder = Instance.new("Folder", rs)
            folder.Name = "AnimFolder"
        end
        local anim = Instance.new("Animation", folder)
        local playanim = animations:LoadAnimation(anim)
        playanim:Play()
    end,
}

local entity = {
    getplrs = function()
        return game.Players
    end,
    getlplr = function()
        return game.Players.LocalPlayer
    end,
    plrhrp = function()
        return game.Players.LocalPlayer.Character.PrimaryPart
    end
}

local tabvalue = 0
function newTab(v)
    local newframe = Instance.new("Frame", newgui)
    newframe.Position = Uidm2.fromScale(0.01 * (tabvalue + 0.05), 0.15)
    newframe.Size = Uidm2.fromScale(0.07, 0.2)
    newframe.BackgroundColor3 = Color3.fromRGB(40,40,40)
    newframe.BorderSizePixel = 0
    newframe.Name = v
    local newlab = Instance.new("TextLabel", newframe)
    newlab.Position = Uidm2.fromScale(0, 0)
    newlab.Size = Uidm2.fromScale(1, 0.03)
    newlab.BackgroundColor3 = Color3.fromRGB(40,40,40)
    newlab.BorderSizePixel = 0
    newlab.Text = v
    newlab.BackgroundTransparency = 1
    tabvalue += 1
    local sortmods = Instance.new("UILayoutSorter", newframe)
    sortmods.Name = math.random()
end
function newButton(tab)
    local keybind = nil
    local newbutton = Instance.new("TextButton", entity.getlplr().StarterGui.newgui[tab.Tab])
    newbutton.Position = Uidm2.fromScale(0,0)
    newbutton.Size = Uidm2.fromScale(1, .1)
    newbutton.BackgroundColor3 = Color3.fromRGB(40,40,40)
    newbutton.BorderSizePixel = 0
    newbutton.Name = tab.Name
    newbutton.Text = tab.Name
    local HiddenFrame = Instance.new("Frame", newbutton)
    HiddenFrame.Position = Uidm2.fromScale(0.01 * (tabvalue + 0.05), 0.15)
    HiddenFrame.Size = Uidm2.fromScale(0.07, 0.2)
    HiddenFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
    HiddenFrame.BorderSizePixel = 0
    HiddenFrame.Visible = false
    local newbutton2 = Instance.new("TextBox", HiddenFrame)
    newbutton2.Position = Uidm2.fromScale(0,0)
    newbutton2.Size = Uidm2.fromScale(1, .1)
    newbutton2.BackgroundColor3 = Color3.fromRGB(40,40,40)
    newbutton2.BorderSizePixel = 0
    newbutton2.Name = "KeybindLol"
    newbutton2.Text = "Keybind: "..tostring(keybind)
    newbutton2.MouseLeave:Connect(function()
        keybind = game.UserInputService.InputBegan:Connect(function(key, gpe)
            if gpe then return end
            keybind = key
            return end
        end)
    end)
    local btnfuncs = {
        Enabled = false,
        ToggleBtn = function()
            btnfuncs.Enabled = not btnfuncs.Enabled
            tab.Function(btnfuncs.Enabled)
        end,
        createToggle = function(v)
            local enabled = false
            local newbutton3 = Instance.new("TextButton", HiddenFrame)
            newbutton3.Position = Uidm2.fromScale(0,0)
            newbutton3.Size = Uidm2.fromScale(1, .1)
            newbutton3.BackgroundColor3 = Color3.fromRGB(40,40,40)
            newbutton3.BorderSizePixel = 0
            newbutton3.Name = v.Name
            newbutton3.Text = v.Name
            newbutton3.Mouse1ButtonDown:Connect(function()
                enabled = not enabled
                v.Function(enabled)
            end)
        end,
    }
    newbutton.Mouse1ButtonDown:Connect(function()
        btnfuncs.ToggleBtn()
        if btnfuncs.Enabled then
            ts:Create(newbutton, TweenInfo.new(.8), {BackgroundColor3 = Color3.fromRGB(0,0,0)})
        else
            ts:Create(newbutton, TweenInfo.new(.8), {BackgroundColor3 = Color3.fromRGB(40,40,40)})
        end
    end)
    local gettabPath = entity.getlplr().StarterGui.newgui[tab.Tab].newlab
    newbutton.Mouse2ButtonDown:Connect(function()
        HiddenFrame.Visible = not HiddenFrame.Visible
        gettabPath.Visible = not gettabPath.Visible
        for i,v in pairs(gettabPath:GetChildren()) do
            v.Visible = not v.Visible 
        end
    end)
end
