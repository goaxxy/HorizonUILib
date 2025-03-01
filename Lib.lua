local startArgs = {...} or {}

if not game.Loaded then
    repeat game.Loaded:Wait() until game:IsLoaded()
end

local Lib = {}

do
    Lib = {
        IsOpen = true,
        Categories = {},
        Sections = {},
        Notifications = {},
        AccentObjects = {},
        Keybinds = {
            [Enum.KeyCode.Space] = "Space",
            [Enum.KeyCode.Zero] = "0",
            [Enum.KeyCode.One] = "1",
            [Enum.KeyCode.Two] = "2",
            [Enum.KeyCode.Three] = "3",
            [Enum.KeyCode.Four] = "4",
            [Enum.KeyCode.Five] = "5",
            [Enum.KeyCode.Six] = "6",
            [Enum.KeyCode.Seven] = "7",
            [Enum.KeyCode.Eight] = "8",
            [Enum.KeyCode.Nine] = "9",
            [Enum.KeyCode.BackSlash] = "Backslash",
            [Enum.KeyCode.QuotedDouble] = '"',
            [Enum.KeyCode.Hash] = "#",
            [Enum.KeyCode.Quote] = "'",
            [Enum.KeyCode.Plus] = "+",
            [Enum.KeyCode.Minus] = "-",
            [Enum.KeyCode.Comma] = ",",
            [Enum.KeyCode.Period] = ".",
            [Enum.KeyCode.Colon] = ":",
            [Enum.KeyCode.Semicolon] = ";",
            [Enum.KeyCode.Equals] = "=",
            [Enum.KeyCode.LeftBracket] = "[",
            [Enum.KeyCode.RightBracket] = "]",
            [Enum.KeyCode.LeftAlt] = "LAlt",
            [Enum.KeyCode.RightAlt] = "RAlt",
            [Enum.KeyCode.Backquote] = "`",
            [Enum.KeyCode.Tilde] = "~",
            [Enum.KeyCode.Delete] = "Del",
            [Enum.KeyCode.CapsLock] = "Caps",
            [Enum.KeyCode.LeftControl] = "LCtrl",
            [Enum.KeyCode.RightControl] = "RCtrl",
        },
        ScreenGui = nil,
        Main = nil,
        FontSize = 14,
        UIOpenKey = Enum.KeyCode.RightShift,
        CheatName = startArgs.CheatName or "Horizon",
        FolderName = startArgs.FolderName or "Horizon",
        Game = startArgs.Game or "FallenSurvival",
        Logo = startArgs.Logo,
        Accent = startArgs.Accent or Color3.fromRGB(0, 218, 151),
    }

    if not isfolder(Lib.FolderName) then
        makefolder(Lib.FolderName)
    end

    if not isfolder(Lib.FolderName .. "/Configs") then
        makefolder(Lib.FolderName .. "/Configs")
    end

    if not isfolder(Lib.FolderName .. "/Configs/" .. Lib.Game) then
        makefolder(Lib.FolderName .. "/Configs/" .. Lib.Game)
    end

    Lib.__index = Lib
    Lib.Categories.__index = Lib.Categories
    Lib.Sections.__index = Lib.Sections
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local UserInputService = game:GetService("UserInputService")

    do
        function Lib:SetConfig(Config)
            
        end
        --
        function Lib:GetConfig(Config)

        end
        --
        function Lib:SetUIOpen(bool)
            if typeof(bool) == 'boolean' then
                Lib.IsOpen = bool
                if Lib.IsOpen then
                    Lib.Main.Visible = true
                else
                    Lib.Main.Visible = false
                end
            end
        end
        --
    end

    function Lib:Notificate(msg, dur)
        local notif = {Objects = {}, Container = nil}

        local NewIndex = Instance.new("TextLabel")
        NewIndex.Size = UDim2.new(0,0,0,0)
        --NewIndex.Position = UDim2.new(0.5,0,0.5,0)
        NewIndex.Parent = Lib.ScreenGui
        NewIndex.Text = msg
        notif.Container = NewIndex

        function notif:remove(item)
            table.remove(Lib.Notifications, table.find(Lib.Notifications, notif))
            task.wait(0.5)
            NewIndex:Destroy()
        end

        task.delay(dur + 0.1,function()
            notif:remove(notif)
        end)

        task.spawn(function()
            game:GetService("TweenService"):Create(NewIndex, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = UDim2.new(0.3,0,0.3,0)}):Play()

            task.wait(dur)

            game:GetService("TweenService"):Create(NewIndex, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = UDim2.new(0,0,0,0)}):Play()
        end)

        table.insert(Lib.Notifications, notif)
        return notif
    end

    local ScreenGui = cloneref(Instance.new("ScreenGui", gethui()))

    ScreenGui.DisplayOrder = 1000
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Lib.ScreenGui = ScreenGui
end

return Lib
