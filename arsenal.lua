if getgenv().XenonLoaded then
    if getgenv().XenonScreenGui then getgenv().XenonScreenGui:Destroy() end
    if getgenv().MobileButton then getgenv().MobileButton:Destroy() end
end
getgenv().XenonLoaded = true

-- ==========================================
-- СИСТЕМА КЛЮЧЕЙ
-- ==========================================
local VALID_KEY = "Jkfq12lvwfwg51vdc"
local GETKEY_LINK = "https://discord.gg/WZp4DZ9QZs"
local hasAccess = false

if not hasAccess then
    local TweenService = game:GetService("TweenService")
    local gui = Instance.new("ScreenGui")
    gui.Name = "XenonKeyUI"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = game:GetService("CoreGui")

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")
    TweenService:Create(blur, TweenInfo.new(0.4), {Size = 20}):Play()

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 1
    bg.Parent = gui
    TweenService:Create(bg, TweenInfo.new(0.4), {BackgroundTransparency = 0.4}):Play()

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5,0,0.5,0)
    main.AnchorPoint = Vector2.new(0.5,0.5)
    main.BackgroundColor3 = Color3.fromRGB(15,15,15)
    main.Parent = gui

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    local grad = Instance.new("UIGradient", main)
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20,20,20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,10))
    }

    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 340, 0, 220)}):Play()

    local line = Instance.new("Frame", main)
    line.Size = UDim2.new(1,0,0,2)
    line.BackgroundColor3 = Color3.fromRGB(0,160,255)

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1,0,0,50)
    title.BackgroundTransparency = 1
    title.Text = "XENON"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255,255,255)

    local sub = Instance.new("TextLabel", main)
    sub.Size = UDim2.new(1,0,0,20)
    sub.Position = UDim2.new(0,0,0,35)
    sub.BackgroundTransparency = 1
    sub.Text = "Premium Access Required"
    sub.Font = Enum.Font.Gotham
    sub.TextSize = 12
    sub.TextColor3 = Color3.fromRGB(130,130,130)

    local input = Instance.new("TextBox", main)
    input.Size = UDim2.new(0.8,0,0,40)
    input.Position = UDim2.new(0.1,0,0.45,0)
    input.BackgroundColor3 = Color3.fromRGB(25,25,25)
    input.Text = ""
    input.PlaceholderText = "Enter your key..."
    input.Font = Enum.Font.Gotham
    input.TextSize = 14
    input.TextColor3 = Color3.new(1,1,1)

    Instance.new("UICorner", input).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", input).Color = Color3.fromRGB(40,40,40)

    local unlock = Instance.new("TextButton", main)
    unlock.Size = UDim2.new(0.8,0,0,35)
    unlock.Position = UDim2.new(0.1,0,0.68,0)
    unlock.Text = "Unlock"
    unlock.Font = Enum.Font.GothamBold
    unlock.TextSize = 14
    unlock.TextColor3 = Color3.new(1,1,1)

    Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,10)
    local unlockGrad = Instance.new("UIGradient", unlock)
    unlockGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,160,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,90,200))
    }
    Instance.new("UIStroke", unlock).Color = Color3.fromRGB(0,160,255)

    local getkey = Instance.new("TextButton", main)
    getkey.Size = UDim2.new(0.8,0,0,28)
    getkey.Position = UDim2.new(0.1,0,0.85,0)
    getkey.Text = "Get Key"
    getkey.Font = Enum.Font.Gotham
    getkey.TextSize = 12
    getkey.TextColor3 = Color3.fromRGB(200,200,200)
    getkey.BackgroundColor3 = Color3.fromRGB(30,30,30)

    Instance.new("UICorner", getkey).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", getkey).Color = Color3.fromRGB(60,60,60)

    local status = Instance.new("TextLabel", main)
    status.Size = UDim2.new(1,0,0,18)
    status.Position = UDim2.new(0,0,1,-18)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.Font = Enum.Font.Gotham
    status.TextSize = 12
    status.TextColor3 = Color3.fromRGB(255,80,80)

    getkey.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(GETKEY_LINK)
            status.TextColor3 = Color3.fromRGB(100,255,100)
            status.Text = "Link copied!"
        else
            status.Text = "Clipboard not supported"
        end
    end)

    local unlocked = false
    unlock.MouseButton1Click:Connect(function()
        if input.Text == VALID_KEY then
            status.TextColor3 = Color3.fromRGB(100,255,100)
            status.Text = "Access granted"
            unlocked = true
            TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0,0,0,0)}):Play()
            task.wait(0.3)
            gui:Destroy()
            blur:Destroy()
        else
            status.Text = "Invalid key"
        end
    end)
    repeat task.wait() until unlocked
end

-- ==========================================
-- ИНИЦИАЛИЗАЦИЯ XENON
-- ==========================================
local XenonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xenon150/Xenon-GUI/refs/heads/main/GUI.lua"))()
local Notification = XenonLib:CreateNotification()

local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local autoScale = isMobile and XenonLib.Scales.Mobile or XenonLib.Scales.Default

local window = XenonLib:CreateWindow({
    Logo = XenonLib.GlobalLogo,
    Name = "Xenon Hub", -- ИЗМЕНЕНО НАЗВАНИЕ
    Content = "Arsenal", -- ИЗМЕНЕНО ОПИСАНИЕ
    Size = autoScale,
    ConfigFolder = "FeatherXenon",
    Enable3DRenderer = false,
    Keybind = "RightShift"
})

getgenv().XenonScreenGui = XenonLib.ScreenGui

if isMobile then
    task.wait(0.2)
    window:SetSize(XenonLib.Scales.Mobile)
    
    local mobileButton = Instance.new("ScreenGui")
    mobileButton.Name = "XenonMobileButton"
    mobileButton.ResetOnSpawn = false
    mobileButton.Parent = game:GetService("CoreGui")
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60, 0, 60)
    button.Position = UDim2.new(0.5, -30, 0.9, -30)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BackgroundTransparency = 0.3
    button.Text = "Menu"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 20
    button.Font = Enum.Font.SourceSansBold
    button.BorderSizePixel = 0
    button.Parent = mobileButton
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 30)
    
    local dragToggle = nil
    local dragStart = nil
    local startPos = nil
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true; dragStart = input.Position; startPos = button.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragToggle = false end end)
        end
    end)
    button.InputChanged:Connect(function(input)
        if dragToggle and input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    button.MouseButton1Click:Connect(function() window:ToggleInterface() end)
    getgenv().MobileButton = mobileButton
end

-- ==========================================
-- ПЕРЕМЕННЫЕ
-- ==========================================
local Camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local toggled = {
	esp = false,
	teamCheck = false,
	fov = true,
	infJump = false,
	aimbot = false,
	teamCheck2 = true,
	silentAim = false,
	speedHack = false,
	ammoMod = false,
	fireRate = false,
	recoil = false
}

_G.sizeof = 55
_G.AimOn = false
_G.TeamCheckOn = true
_G.Aimpart = "Head"
_G.Sensitivity = 0.03
_G.CircleSides = 64
_G.CircleVisible = true
_G.fovTransparency = 0.5
_G.WS = "100"

-- ==========================================
-- ПОСТРОЕНИЕ ВКЛАДОК GUI
-- ==========================================
local MainTab = window:AddTab({ Icon = "home", Name = "Main" })
local WepTab = window:AddTab({ Icon = "gun", Name = "Normal" }) -- ИЗМЕНЕНО С "WEAPONS" НА "NORMAL"

-- СЕКЦИЯ ESP
local EspSection = MainTab:AddSection({ Name = "ESP Settings" })
EspSection:AddLabel("Player ESP"):AddToggle({ Default = false, Callback = function(v) toggled.esp = v end })
EspSection:AddLabel("Team Check"):AddToggle({ Default = false, Callback = function(v) toggled.teamCheck = v end })

-- СЕКЦИЯ AIMBOT
local AimSection = MainTab:AddSection({ Name = "Aimbot Settings" })
AimSection:AddLabel("Draw FOV"):AddToggle({ Default = true, Callback = function(v) 
    _G.CircleVisible = v
    toggled.fov = _G.CircleVisible
end })
AimSection:AddLabel("Blatant Aimbot"):AddToggle({ Default = false, Callback = function(v) 
    _G.AimOn = v
    toggled.aimbot = _G.AimOn
    _G.fovTransparency = _G.AimOn and 1 or 0.5
end })
AimSection:AddLabel("Team Check (Aim)"):AddToggle({ Default = true, Callback = function(v) 
    _G.TeamCheckOn = v
    toggled.teamCheck2 = _G.TeamCheckOn
end })

-- СЕКЦИЯ PLAYER MODS
local PlrSection = MainTab:AddSection({ Name = "Player Mods" })
PlrSection:AddLabel("Infinite Jump"):AddToggle({ Default = false, Callback = function(v) 
    toggled.infJump = v
    if toggled.infJump then
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if InfiniteJumpEnabled and toggled.infJump then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
end })

PlrSection:AddLabel("Speed Hack"):AddToggle({ Default = false, Callback = function(v) 
    toggled.speedHack = v
    if toggled.speedHack then
        _G.WS = "100"
        local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
        Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            Humanoid.WalkSpeed = _G.WS
        end)
        Humanoid.WalkSpeed = _G.WS
    end
end })

PlrSection:AddLabel("OP Silent Aim"):AddToggle({ Default = false, Callback = function(v) 
    toggled.silentAim = v
    if toggled.silentAim then
        function getplrsname()
            for i,v in pairs(game:GetChildren()) do
                if v.ClassName == "Players" then
                    return v.Name
                end
            end
        end
        local players = getplrsname()
        local plr = game[players].LocalPlayer
        coroutine.resume(coroutine.create(function()
            while wait(1) and toggled.silentAim do
                coroutine.resume(coroutine.create(function()
                    for _,v in pairs(game[players]:GetPlayers()) do
                        if v.Name ~= plr.Name and v.Character then
                            v.Character.RightUpperLeg.CanCollide = false
                            v.Character.RightUpperLeg.Transparency = 10
                            v.Character.RightUpperLeg.Size = Vector3.new(13,13,13)

                            v.Character.LeftUpperLeg.CanCollide = false
                            v.Character.LeftUpperLeg.Transparency = 10
                            v.Character.LeftUpperLeg.Size = Vector3.new(13,13,13)

                            v.Character.HeadHB.CanCollide = false
                            v.Character.HeadHB.Transparency = 10
                            v.Character.HeadHB.Size = Vector3.new(13,13,13)

                            v.Character.HumanoidRootPart.CanCollide = false
                            v.Character.HumanoidRootPart.Transparency = 10
                            v.Character.HumanoidRootPart.Size = Vector3.new(13,13,13)
                        end
                    end
                end))
            end
        end))
    end
end })

-- СЕКЦИЯ NORMAL (Ранее Weapon Mods)
local WeaponModsSection = WepTab:AddSection({ Name = "Normal Mods" })
WeaponModsSection:AddLabel("Infinite Ammo"):AddToggle({ Default = false, Callback = function(v) 
    toggled.ammoMod = v
    if toggled.ammoMod then
        spawn(function()
            while wait() and toggled.ammoMod do
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
                    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
                end)
            end
        end)
    end
end })

WeaponModsSection:AddLabel("Fire Rate Mod"):AddToggle({ Default = false, Callback = function(v) 
    toggled.fireRate = v
    if toggled.fireRate then
        spawn(function()
            while wait(5) and toggled.fireRate do
                pcall(function()
                    local replicationstorage = game.ReplicatedStorage
                    for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
                        if v.Name == "Auto" then
                            v.Value = true
                        end
                        if v.Name == "FireRate" then
                            v.Value = 0.02
                        end
                    end
                end)
            end
        end)
    end
end })

WeaponModsSection:AddLabel("No Recoil"):AddToggle({ Default = false, Callback = function(v) 
    toggled.recoil = v
    if toggled.recoil then
        spawn(function()
            while wait(5) and toggled.recoil do
                pcall(function()
                    local replicationstorage = game.ReplicatedStorage
                    for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
                        if v.Name == "RecoilControl" then
                            v.Value = 0
                        end
                        if v.Name == "MaxSpread" then
                            v.Value = 0
                        end
                    end
                end)
            end
        end)
    end
end })

-- СЕКЦИЯ AI BOT
local AISection = MainTab:AddSection({ Name = "AI Bot Beta" })
AISection:AddButton({ Name = "Start AI Beta", Icon = "robot", Callback = function() 
    Notification.new({ Title = "AI Beta Activated", Content = "Experimental AI Bot Running", Duration = 3 })
    -- ТВОЙ ОРИГИНАЛЬНЫЙ СКРИПТ AI
    getgenv().AimSens = 1/45; -- Aimbot sens
    getgenv().LookSens = 1/80; -- Aim while walking sens
    getgenv().PreAimDis = 55; -- if within 55 Studs then preaim
    getgenv().KnifeOutDis = 85; -- if within 85 Studs then swap back to gun
    getgenv().ReloadDis = 50; -- if over 50 Studs away then reload
    getgenv().RecalDis = 15; -- if player moves over this many studs then recalculate path to them

    local PathfindingService = game:GetService("PathfindingService")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService('TweenService');
    local VIM = game:GetService("VirtualInputManager")
    local UserInputService = game:GetService("UserInputService")

    local Plr = Players.LocalPlayer
    local Char = Plr.Character or Plr.CharacterAdded:Wait()
    local Head = Char:WaitForChild("Head", 1337)
    local Root = Char:WaitForChild("HumanoidRootPart", 1337)
    local Humanoid = Char:WaitForChild("Humanoid", 1337)

    for i,v in pairs(getconnections(game:GetService("ScriptContext").Error)) do v:Disable() end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleESP.lua", true))()

    local Camera = workspace.CurrentCamera;
    local Mouse = Plr:GetMouse();
    local Spawns = workspace:WaitForChild("Map", 1337):WaitForChild("Spawns", 1337)
    local Map = workspace:WaitForChild("Map", 1337)
    local RayIgnore = workspace:WaitForChild("Ray_Ignore", 1337)
    local MapIgnore = Map:WaitForChild("Ignore", 1337)

    local ClosestPlr;
    local IsAiming;
    local InitialPosition;
    local CurrentEquipped = "Gun";
    local WalkToObject;

    local function getClosestPlr()
        local nearestPlayer, nearestDistance
        for _, player in pairs(Players:GetPlayers()) do
            if player.TeamColor ~= Plr.TeamColor and player ~= Plr then
                local character = player.Character
                if character then
                    local nroot = character:FindFirstChild("HumanoidRootPart")
                    if character and nroot and character:FindFirstChild("Spawned") then
                        local distance = Plr:DistanceFromCharacter(nroot.Position)
                        if (nearestDistance and distance >= nearestDistance) then continue end
                        nearestDistance = distance
                        nearestPlayer = player
                    end
                end
            end
        end
        return nearestPlayer
    end

    local function IsVisible(target, ignorelist)
        local obsParts = Camera:GetPartsObscuringTarget({target}, ignorelist);
        if #obsParts == 0 then return true; else return false; end
    end

    local function Aimlock()
        local aimpart = nil;
        if ClosestPlr and ClosestPlr.Character then
            for i,v in ipairs(ClosestPlr.Character:GetChildren()) do
                if v and v:IsA("Part") then
                    if IsVisible(v.Position,{Camera,Char,ClosestPlr.Character,RayIgnore,MapIgnore}) then
                        aimpart = v;
                        break;
                    end
                end
            end
        end
        
        if aimpart then
            IsAiming = true;
            local tcamcframe = Camera.CFrame;
            for i = 0, 1, AimSens do
                if not aimpart then break; end
                if (Head.Position.Y + aimpart.Position.Y) < 0 then break; end
                Camera.CFrame = tcamcframe:Lerp(CFrame.new(Camera.CFrame.p, aimpart.Position), i)
                task.wait(0)
            end
            
            VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
            task.wait(0.25)
            VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
        end
        IsAiming = false;
    end

    local function OnPathBlocked()
       WalkToObject();
    end

    WalkToObject = function()
        if ClosestPlr and ClosestPlr.Character then
            local CRoot = ClosestPlr.Character:FindFirstChild("HumanoidRootPart")
            if CRoot then
                InitialPosition = CRoot.Position;
                local currpath = PathfindingService:CreatePath({["WaypointSpacing"] = 4, ["AgentHeight"] = 5, ["AgentRadius"] = 3, ["AgentCanJump"] = true});
                currpath.Blocked:Connect(OnPathBlocked)
                
                local success, errorMessage = pcall(function()
                    currpath:ComputeAsync(Root.Position, CRoot.Position)
                end)
                if success and currpath.Status == Enum.PathStatus.Success then
                    local waypoints = currpath:GetWaypoints();
                    for i, wap in pairs(waypoints) do
                        if i == 1 then continue end
                        if not ClosestPlr or not ClosestPlr.Character or ClosestPlr ~= getClosestPlr() or not ClosestPlr.Character:FindFirstChild("Spawned") or not Char:FindFirstChild("Spawned") then
                            ClosestPlr = nil;
                            return;
                        elseif (InitialPosition - CRoot.Position).Magnitude > RecalDis  then
                            WalkToObject();
                            return;
                        end

                        if wap.Action == Enum.PathWaypointAction.Jump then
                            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end

                        task.spawn(function()
                            local primary = ClosestPlr.Character.PrimaryPart.Position;
                            local studs = Plr:DistanceFromCharacter(primary)
                            local tcamcframe = Camera.CFrame;
                            for i = 0, 1, LookSens do
                                if IsAiming then break; end
                                if primary and studs then
                                    if math.floor(studs + 0.5) < PreAimDis then
                                        if ClosestPlr and ClosestPlr.Character then
                                            local CChar = ClosestPlr.Character;
                                            if Char:FindFirstChild("Head") and CChar and CChar:FindFirstChild("Head") then
                                                local MiddleAim = (Vector3.new(wap.Position.X,Char.Head.Position.Y,wap.Position.Z) + Vector3.new(CChar.Head.Position.X,CChar.Head.Position.Y,CChar.Head.Position.Z))/2;
                                                Camera.CFrame = tcamcframe:Lerp(CFrame.new(Camera.CFrame.p, MiddleAim), i);
                                            end
                                        end
                                    else
                                        local mixedaim = (Camera.CFrame.p.Y + Char.Head.Position.Y)/2;
                                        Camera.CFrame = tcamcframe:Lerp(CFrame.new(Camera.CFrame.p, Vector3.new(wap.Position.X,mixedaim,wap.Position.Z)), i);
                                    end
                                end
                                task.wait(0)
                            end
                        end)
                        
                        task.spawn(function()
                            local primary = ClosestPlr.Character.PrimaryPart.Position;
                            local studs = Plr:DistanceFromCharacter(primary)
                            
                            if primary and studs then
                                local arms = Camera:FindFirstChild("Arms");
                                if arms then
                                    arms = arms:FindFirstChild("Real");
                                    if math.floor(studs + 0.5) > KnifeOutDis and not IsVisible(primary, {Camera,Char,ClosestPlr.Character,RayIgnore,MapIgnore}) then
                                        if arms.Value ~= "Knife" and CurrentEquipped == "Gun" then
                                            VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game);
                                            CurrentEquipped = "Knife";
                                        end
                                    elseif arms.Value == "Knife" and CurrentEquipped ~= "Gun" then
                                        VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game);
                                        CurrentEquipped = "Gun";
                                    end
                                end
                            end
                        end)
                        
                        if Humanoid then
                            Humanoid:MoveTo(wap.Position);
                            Humanoid.MoveToFinished:Wait();
                        end
                    end
                end
            end
        end
    end

    local function WalkToPlr()
        ClosestPlr = getClosestPlr();
        if ClosestPlr and ClosestPlr.Character and ClosestPlr.Character:FindFirstChild("HumanoidRootPart") then
            if Humanoid.WalkSpeed > 0 and Char:FindFirstChild("Spawned") and ClosestPlr.Character:FindFirstChild("Spawned") then
                local studs = Plr:DistanceFromCharacter(ClosestPlr.Character.PrimaryPart.Position)
                SESP_Create(ClosestPlr.Character.Head, ClosestPlr.Name, "TempTrack", Color3.new(1, 0, 0), math.floor(studs + 0.5));
                if math.floor(studs + 0.5) > ReloadDis and not IsVisible(ClosestPlr.Character.HumanoidRootPart.Position, {Camera,Char,ClosestPlr.Character,RayIgnore,MapIgnore}) then
                    VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
                end
                WalkToObject(ClosestPlr.Character.HumanoidRootPart);
            end
        end
    end

    task.spawn(function()
        while task.wait() do
            if (ClosestPlr == nil or ClosestPlr ~= getClosestPlr()) then
                SESP_Clear("TempTrack");
                WalkToPlr();
            end
        end
    end)

    task.spawn(function()
        while task.wait() do
            if ClosestPlr ~= nil and Camera then
                if Char:FindFirstChild("Spawned") and Humanoid.WalkSpeed > 0 then
                    Aimlock();
                end
            end
        end
    end)

    local stuckamt = 0;
    Humanoid.Running:Connect(function(speed)
        if speed < 3 and Char:FindFirstChild("Spawned") and Humanoid.WalkSpeed > 0 then
            stuckamt = stuckamt + 1;
            if stuckamt == 4 then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            elseif stuckamt >= 10 then
                stuckamt = 0;
                SESP_Clear("TempTrack");
                WalkToPlr();
            end
        end
    end)
end })

-- ==========================================
-- ОРИГИНАЛЬНЫЕ ФУНКЦИИ ESP & AIMBOT
-- ==========================================

local esp = Instance.new("BillboardGui")
local name = Instance.new("TextLabel")
local mainesp = Instance.new("BillboardGui")
local box = Instance.new("ImageLabel")

esp.Name = "esp"
esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
esp.Active = true
esp.AlwaysOnTop = true
esp.LightInfluence = 1.000
esp.Size = UDim2.new(0, 300, 0, 30)
esp.StudsOffset = Vector3.new(0, 3, 0)

name.Name = "name"
name.Parent = esp
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.BorderSizePixel = 0
name.Size = UDim2.new(1, 0, 1, 0)
name.Font = Enum.Font.GothamBold
name.TextColor3 = Color3.fromRGB(100, 200, 255)
name.TextSize = 12
name.TextStrokeTransparency = 0.000
name.TextWrapped = true
name.TextTransparency = 1

mainesp.Name = "mainesp"
mainesp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
mainesp.Active = true
mainesp.AlwaysOnTop = true
mainesp.LightInfluence = 1.000
mainesp.MaxDistance = 999999.000
mainesp.Size = UDim2.new(4, 0, 6, 0)

box.Name = "box"
box.Parent = mainesp
box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
box.BackgroundTransparency = 1.000
box.BorderSizePixel = 0
box.Size = UDim2.new(1, 0, 1, 0)
box.Image = "http://www.roblox.com/asset/?id=16946608585"
box.ImageColor3 = Color3.fromRGB(0, 0, 255) -- ИЗМЕНЕНО НА СИНИЙ
box.ImageTransparency = 1

RunService.RenderStepped:Connect(function()
	for i, v in pairs(Players:GetChildren()) do
		if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
			if not v.Character.Head:FindFirstChild("esp") then
				local nameClone = esp:Clone()
				local espClone = mainesp:Clone()
				nameClone.Parent = v.Character:FindFirstChild("Head")
				nameClone:FindFirstChild("name").Text = v.Name
				if v.Character:FindFirstChild("HumanoidRootPart") then
					espClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
				end
			end
		end
	end
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		wait(0.5)
		if player ~= LocalPlayer and character:FindFirstChild("Head") then
			local nameClone = esp:Clone()
			local espClone = mainesp:Clone()
			nameClone.Parent = character:FindFirstChild("Head")
			nameClone:FindFirstChild("name").Text = player.Name
			if character:FindFirstChild("HumanoidRootPart") then
				espClone.Parent = character:FindFirstChild("HumanoidRootPart")
			end
		end
	end)
end)

RunService.RenderStepped:Connect(function()
	for i, v in pairs(Players:GetChildren()) do
		if v ~= LocalPlayer and v.Character then
			if toggled.teamCheck and v.Team == LocalPlayer.Team then
				if v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("esp") then
					v.Character.Head:FindFirstChild("esp"):Destroy()
				end
				if v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("mainesp") then
					v.Character.HumanoidRootPart:FindFirstChild("mainesp"):Destroy()
				end
			end
		end
	end
end)

RunService.RenderStepped:Connect(function()
	for i, v in pairs(Players:GetChildren()) do
		if v.Character and v.Character:FindFirstChild("Head") then
			if v.Character.Head:FindFirstChild("esp") then
				v.Character.Head:FindFirstChild("esp").name.TextTransparency = toggled.esp and 0 or 1
			end
			if v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("mainesp") then
				v.Character.HumanoidRootPart:FindFirstChild("mainesp").box.ImageTransparency = toggled.esp and 0.43 or 1
			end
		end
	end
end)

local Holding = false

local FovCircle = Drawing.new("Circle")
FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FovCircle.Radius = _G.sizeof
FovCircle.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1) -- ИЗМЕНЕНО НА RAINBOW (РГБ)
FovCircle.Visible = _G.CircleVisible
FovCircle.NumSides = _G.CircleSides
FovCircle.Filled = false
FovCircle.Transparency = _G.fovTransparency
FovCircle.Thickness = 2

local function GetClosestPlayer()
	local Target = nil
	local MaxDistance = _G.sizeof

	for i, v in next, Players:GetChildren() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheckOn == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil then
								if v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

									if VectorDistance < MaxDistance then
										Target = v
									end
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil then
							if v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

								if VectorDistance < MaxDistance then
									Target = v
								end
							end
						end
					end
				end
			end
		end
	end

	return Target
end

uis.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		Holding = true
	end
end)

uis.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		Holding = false
	end
end)

RunService.RenderStepped:Connect(function()
	FovCircle.Position = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
	FovCircle.Radius = _G.sizeof
	FovCircle.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1) -- ИЗМЕНЕНО НА РАЗНОЦВЕТНЫЙ ПЕРЕЛИВ
	FovCircle.Visible = _G.CircleVisible
	FovCircle.NumSides = _G.CircleSides
	FovCircle.Filled = false
	FovCircle.Transparency = _G.fovTransparency
	FovCircle.Thickness = 2

	if Holding == true and _G.AimOn == true then
		local target = GetClosestPlayer()
		if target and target.Character and target.Character:FindFirstChild(_G.Aimpart) then
			ts:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, target.Character[_G.Aimpart].Position)}):Play()
		end
	end
end)
