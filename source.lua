--[[
    notes for editing {
        lighting commands, fully customizable lighting (skybox etc.)
    }
]]

--overused variables
local chatwebhookurl = ""
local execwebhookurl = ""
local version = "0.0.5"
local defaultwsjp = 16
local consolecolor = "WHITE"
local Noclip = nil
local Clip = nil

local sr = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
local vu = game:GetService("VirtualUser")
local p = game:GetService("Players")
local lp = p.LocalPlayer
local sgui = game:GetService("StarterGui")
local lighting = game:GetService("Lighting")
local mouse = lp:GetMouse()
local UIS = game:GetService("UserInputService")
local gamesettings = UserSettings():GetService("UserGameSettings")
local bhopBug = true

local console = {}
local languages = {"to send messages in a language, say > followed by the target language/language code, e.g.: >ru or >russian. To disable (go back to original language), say >d.","af=Afrikaans","sq=Albanian","am=Amharic","ar=Arabic","hy=Armenian","az=Azerbaijani","eu=Basque","be=Belarusian","bn=Bengali","bs=Bosnian","bg=Bulgarian","ca=Catalan","ceb=Cebuano","ny=Chichewa","zh-cn=ChineseSimplified","zh-tw=ChineseTraditional","co=Corsican","hr=Croatian","cs=Czech","da=Danish","nl=Dutch","en=English","eo=Esperanto","et=Estonian","tl=Filipino","fi=Finnish","fr=French","fy=Frisian","gl=Galician","ka=Georgian","de=German","el=Greek","gu=Gujarati","ht=HaitianCreole","ha=Hausa","haw=Hawaiian","iw=Hebrew","hi=Hindi","hmn=Hmong","hu=Hungarian","is=Icelandic","ig=Igbo","id=Indonesian","ga=Irish","it=Italian","ja=Japanese","jw=Javanese","kn=Kannada","kk=Kazakh","km=Khmer","ko=Korean","ku=Kurdish(Kurmanji)","ky=Kyrgyz","lo=Lao","la=Latin","lv=Latvian","lt=Lithuanian","lb=Luxembourgish","mk=Macedonian","mg=Malagasy","ms=Malay","ml=Malayalam","mt=Maltese","mi=Maori","mr=Marathi","mn=Mongolian","my=Myanmar(Burmese)","ne=Nepali","no=Norwegian","ps=Pashto","fa=Persian","pl=Polish","pt=Portuguese","pa=Punjabi","ro=Romanian","ru=Russian","sm=Samoan","gd=ScotsGaelic","sr=Serbian","st=Sesotho","sn=Shona","sd=Sindhi","si=Sinhala","sk=Slovak","sl=Slovenian","so=Somali","es=Spanish","su=Sundanese","sw=Swahili","sv=Swedish","tg=Tajik","ta=Tamil","te=Telugu","th=Thai","tr=Turkish","uk=Ukrainian","ur=Urdu","uz=Uzbek","vi=Vietnamese","cy=Welsh","xh=Xhosa","yi=Yiddish","yo=Yoruba","zu=Zulu"}
console.colours = {"Black","Blue","Green","Cyan","Red","Magenta","Brown","Light Gray","Dark Gray","Light Blue","Light Green","Light Cyan","Light Red","Light Magenta","Yellow","White"}
console.bundles = {"Sneaky", "Old", "Toy", "Pirate", "Knight", "Astronaut", "Vampire", "Robot", "Levitation", "Bubbly", "Werewolf", "Stylish", "Mage", "Cartoony", "Zombie", "Zombie2", "Superhero", "Ninja", "Elder", "Oldschool", "Confident", "Popstar", "Patrol", "Princess", "Cowboy", "Toilet"}
console.skyboxes = {"Tropical","Casino","Purple","Dawn","Cloudy","Hills","Galaxy","Foggy","Space","Eyes","Mountains","Sunset","Snowy","Off (removes skybox)"}
console.savedLighting = {Brightness = lighting.Brightness, ClockTime = lighting.ClockTime, FogEnd = lighting.FogEnd, GlobalShadows = lighting.GlobalShadows, Ambient = lighting.Ambient}

--overused functions

function systemMessage(txt,color,size)
    sgui:SetCore("ChatMakeSystemMessage", {
		Text = txt;
		Color = Color3.fromHex(color);
		Font = Enum.Font.SourceSansBold;TextSize = size
	})
end

function loading()
    rconsoleclear()
    wait()
    rconsoleprint("loading r-console ")
    for i = math.random(1,6),1,-1 do
        wait(0.5)
        rconsoleprint(".")
    end
    rconsoleclear()
    
    rconsoleprint("\n>downloading overused variables\n ")
        for i = 4,1,-1 do
            wait(math.random(0,0.02))
            rconsoleprint("-")
        end
        wait(math.random(0.02,0.5))
        for i = 16,1,-1 do
            rconsoleprint("-")
        end
        rconsoleprint(" 2.87/2.87KB")
        wait()

    rconsoleprint("\n>downloading overused functions\n ")
        for i = 7,1,-1 do
            wait(math.random(0,0.02))
            rconsoleprint("-")
        end
        wait(math.random(0.02,0.5))
        for i = 13,1,-1 do
            rconsoleprint("-")
        end
        rconsoleprint(" 17.4/17.4KB")
        wait()

    rconsoleprint("\n>downloading tables\n ")
        rconsoleprint(">commands\n ")
            for i,v in pairs(console.commands) do
                rconsoleprint(" >"..i.." - "..v.."\n ")
            end
            wait(math.random(0,0.01))
            for i = 10,1,-1 do
                rconsoleprint("-")
            end
            rconsoleprint(" 1.4/1.4KB")
            wait()

        rconsoleprint("\n >commandusage\n ")
            for i,v in pairs(console.commandusage) do
                rconsoleprint(" >"..v.."\n ")
            end
            wait(math.random(0,0.01))
            for i = 10,1,-1 do
                rconsoleprint("-")
            end
            rconsoleprint(" 1.2/1.2KB")
            wait()

        rconsoleprint("\n >intros\n ")
            for i,v in pairs(console.intros) do
                rconsoleprint(" >"..i.."\n ")
            end
            wait(math.random(0,0.01))
            for i = 10,1,-1 do
                rconsoleprint("-")
            end
            rconsoleprint(" 1.1/1.1KB")
            wait()

        rconsoleprint("\n >bundles\n ")
            for i,v in pairs(console.bundles) do
                rconsoleprint(" >"..v.."\n ")
            end
            wait(math.random(0,0.01))
            for i = 10,1,-1 do
                rconsoleprint("-")
            end
            rconsoleprint(" 2.1/2.1KB")
            wait()

        rconsoleprint("\n >colours\n ")
            for i,v in pairs(console.colours) do
                rconsoleprint(" >"..v.."\n ")
            end
            wait(math.random(0,0.01))
            for i = 10,1,-1 do
                rconsoleprint("-")
            end
            rconsoleprint(" 1.0/1.0KB\n")
            wait()

    rconsoleprint("\n>downloading commands\n ")
        for i,v in pairs(console.commands) do
            rconsoleprint(">"..i.."\n ")
        end
        for i = 20,1,-1 do
            rconsoleprint("-")
        end
        rconsoleprint(" 42.6/42.6KB\n")
        wait()
    
    rconsoleclear()
    
    rconsoleprint("\n>preloading scripts\n ")
    wait(0.2)
    preload()
    wait(0.2)
    rconsoleclear()
    wait(0.2)
    rconsoleprint("loadintro()")
    loadintro()
end

function loadintro()
    wait(1)
    rconsoleclear()
    if rConsoleIntroDetermined == "old" then
        intro()
    elseif rConsoleIntroDetermined == "current" then
        newintro()
    elseif rConsoleIntroDetermined == "big" then
        bigintro()
    elseif rConsoleIntroDetermined == "small" then
        smallintro()
    end
end

function confirm(reason)
    local content
    if messagebox("are you sure you want to use this command?\n"..reason,"command confirmation",1572)==6 then
        content = true
    else
        content = false
    end
    return content
end

function flyPlayer(vfly)
	FLYING = false
	speedofthefly = 1
	speedofthevfly = 1
	while not lp or not lp.Character or not lp.Character:FindFirstChild('HumanoidRootPart') or not lp.Character:FindFirstChild('Humanoid') or not mouse do
		 wait()
	end 
	local T = lp.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0
	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			while FLYING do
				if not vfly then
					lp.Character:FindFirstChild("Humanoid").PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
				wait()
			end
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			lp.Character.Humanoid.PlatformStand = false
		end)
	end
	mouse.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vfly then
				CONTROL.F = speedofthevfly
			else
				CONTROL.F = speedofthefly
			end
		elseif KEY:lower() == 's' then
			if vfly then
				CONTROL.B = - speedofthevfly
			else
				CONTROL.B = - speedofthefly
			end
		elseif KEY:lower() == 'a' then
			if vfly then
				CONTROL.L = - speedofthevfly
			else
				CONTROL.L = - speedofthefly
			end
		elseif KEY:lower() == 'd' then
			if vfly then
				CONTROL.R = speedofthevfly
			else
				CONTROL.R = speedofthefly
			end
		elseif KEY:lower() == 'y' then
			if vfly then
				CONTROL.Q = speedofthevfly*2
			else
				CONTROL.Q = speedofthefly*2
			end
		elseif KEY:lower() == 't' then
			if vfly then
				CONTROL.E = -speedofthevfly*2
			else
				CONTROL.E = -speedofthefly*2
			end
		end
	end)
	mouse.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'y' then
			CONTROL.Q = 0
		elseif KEY:lower() == 't' then
			CONTROL.E = 0
		end
	end)
	FLY()
end
function r15Check(plr)
	if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		return true
	end
end
local function thumbnail(uid)
        local function filter(txt)
            local filtered
            filtered = txt:gsub('"', '')
            filtered = filtered:gsub('}', '')
            filtered = filtered:gsub(']', '')

            return txt
        end

        local img = syn.request({
            Url = 'https://thumbnails.roblox.com/v1/users/avatar?userIds='..uid..'&size=720x720&format=Png&isCircular=false'
        })

        local   body = img.Body

        local   check_1 = body:find("https")
        local   check_2 = body:find('Png"')
        local   len1 = img.Body:find("imageUrl")
        local   len2 = img.Body:len()

        local   b = img.Body:sub(len2-len1)
        local   a = 'https://tr.rbxcdn.com/'
        local   d = filter(tostring(a..b))
        local   final = body:sub(check_1, check_2+2)

        return final
end
function chatwebhook(args, url)
    local res = syn.request({
        Url = url,
        Headers = { ['Content-Type'] = 'application/json'},
        Method = 'POST',
        Body = game:GetService('HttpService'):JSONEncode({
            username = lp.Name,
            avatar_url = thumbnail(lp.UserId),
            content = args
        })
    })
end
function execwebhook(name, display, userid, url, gameid, accountage)
    local gamename = game:GetService("MarketplaceService"):GetProductInfo(gameid).Name
    local createdTable = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://users.roblox.com/v1/users/"..userid))
    local created1 = createdTable["created"]:split("T")
    local created2 = created1[2]:split(".")
    local createdyear = createdTable["created"]:split("-")
    local createdmonth = createdyear[2]:split("-")
    local createdday = createdyear[3]:split("T")
    local createdhour = created1[2]:split(":")
    local createdmin = createdhour[2]:split(":")
    local createdsec = createdhour[3]:split(".")
    local createdon = {year=createdyear[1],month=createdmonth[1],day=createdday[1],hour=createdhour[1],min=createdmin[1],sec=createdsec[1]}
    local getid = createdTable["id"]


    local res = syn.request({
        Url = url,
        Headers = { ['Content-Type'] = 'application/json' },
        Method = 'POST',
        Body = game:GetService('HttpService'):JSONEncode({
            username = "R-CONSOLE",
            avatar_url = "https://cdn.discordapp.com/avatars/1079855323784953898/f5908d7085330e7512a06bacad914102.webp",
            content = "",
            embeds = {
                {
                    thumbnail = {
                        url = thumbnail(userid)
                    },
                    
                    title = "@"..name.." executed r-console `v"..version.."`",
                    url = "https://www.roblox.com/users/"..userid.."/profile",
                    fields = {
                        {
                            name = "display name",
                            value = ""..display.."",
                            inline = true
                        },
                        {
                            name = "in game",
                            value = "["..gamename.."](https://www.roblox.com/games/"..gameid..")",
                            inline = true
                        },
                        {
                            name = "account age",
                            value = ""..accountage.." days",
                            inline = true
                        },
                        {
                            name = "created",
                            value = "<t:"..os.time(createdon)..":R>",
                            inline = true
                        },
                        {
                            name = "current date",
                            value = "<t:"..os.time()..":D>",
                            inline = true
                        },
                        {
                            name = "id",
                            value = getid,
                            inline = true
                        }
                    },
                footer = {
                        text = "© 2023 62092",
                        icon_url = "https://avatars.githubusercontent.com/u/65765206"
                    }
                }
            }
        })
    })
end

function getPlayer(args, tbl)
    if tbl == nil then
        local tbl = p:GetPlayers()
        if args == "me" then
            return cmdhelp
        elseif args == "random" then
            return tbl[math.random(1,#tbl)]
        else
            for _,v in pairs(tbl) do
                if v.Name:lower():find(args:lower()) or v.displayName:lower():find(args:lower()) then
                    return v
                end
            end
        end
    end
end

function blockPlayer(args, tbl)
if tbl == nil then
    local tbl = p:GetPlayers()
        for _,v in pairs(tbl) do
            if v.Name:lower():find(args:lower()) or v.displayName:lower():find(args:lower()) then
                v.Character:Remove()
                v:Remove()
                sr:FireServer("/mute "..v.Name, "All")
            end
        end
    end
end

function newintro()
    rconsoleprint("@@YELLOW@@")
    rconsoleclear()
    wait()
    rconsoleprint("                             _     \n ___ ___ ___ ___ ___ ___ ___| |___ \n|  _|___|  _| . |   |_ -| . | | -_|\n|_|     |___|___|_|_|___|___|_|___|\n")
    rconsoleprint("@@WHITE@@")
    rconsoleprint("[version "..version.."] - help for commands, changelog for updates :)\n\n\n")
end

function smallintro()
    rconsoleprint("@@WHITE@@")
    rconsoleclear()
    wait()
    rconsoleprint(" __  _ _  _  _ _ | _\n|  -(_(_)| |_\\(_)|(/_ ".."[version "..version.."] - help for commands, changelog for updates :)\n\n\n")
end

function intro()
    rconsoleprint("@@YELLOW@@")
    rconsoleclear()
    wait()
    rconsoleprint("          \n          \n          \n ,adPPYba,\na8P_____88\n8PP```````\n`8b,   ,aa\n ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("88           \n88           \n88           \n88  ,adPPYba,\n88 a8P_____88\n88 8PP```````\n88 `8b,   ,aa\n88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("            88           \n            88           \n            88           \n ,adPPYba,  88  ,adPPYba,\na8`     `8a 88 a8P_____88\n8b       d8 88 8PP```````\n`8a,   ,a8` 88 `8b,   ,aa\n ``YbbdP``  88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("                      88           \n                      88           \n                      88           \n,adPPYba,  ,adPPYba,  88  ,adPPYba,\nI8[    `` a8`     `8a 88 a8P_____88\n ``Y8ba,  8b       d8 88 8PP```````\naa    ]8I `8a,   ,a8` 88 `8b,   ,aa\n``YbbdP``  ``YbbdP``  88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("                                  88           \n                                  88           \n                                  88           \n8b,dPPYba,  ,adPPYba,  ,adPPYba,  88  ,adPPYba,\n88P`   ``8a I8[    `` a8`     `8a 88 a8P_____88\n88       88  ``Y8ba,  8b       d8 88 8PP```````\n88       88 aa    ]8I `8a,   ,a8` 88 `8b,   ,aa\n88       88 ``YbbdP``  ``YbbdP``  88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("                                              88           \n                                              88           \n                                              88           \n ,adPPYba,  8b,dPPYba,  ,adPPYba,  ,adPPYba,  88  ,adPPYba,\na8`     `8a 88P`   ``8a I8[    `` a8`     `8a 88 a8P_____88\n8b       d8 88       88  ``Y8ba,  8b       d8 88 8PP```````\n`8a,   ,a8` 88       88 aa    ]8I `8a,   ,a8` 88 `8b,   ,aa\n ``YbbdP``  88       88 ``YbbdP``  ``YbbdP``  88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("                                                         88           \n                                                         88           \n                                                         88           \n ,adPPYba,  ,adPPYba,  8b,dPPYba,  ,adPPYba,  ,adPPYba,  88  ,adPPYba,\na8`      ``a8`     `8a 88P`   ``8a I8[    `` a8`     `8a 88 a8P_____88\n8b         8b       d8 88       88  ``Y8ba,  8b       d8 88 8PP```````\n`8a,   ,aa `8a,   ,a8` 88       88 aa    ]8I `8a,   ,a8` 88 `8b,   ,aa\n ``Ybbd8``  ``YbbdP``  88       88 ``YbbdP``  ``YbbdP``  88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("                                                                  88           \n                                                                  88           \n                                                                  88           \n          ,adPPYba,  ,adPPYba,  8b,dPPYba,  ,adPPYba,  ,adPPYba,  88  ,adPPYba,\naaaaaaaa a8`      ``a8`     `8a 88P`   ``8a I8[    `` a8`     `8a 88 a8P_____88\n```````` 8b         8b       d8 88       88  ``Y8ba,  8b       d8 88 8PP```````\n         `8a,   ,aa `8a,   ,a8` 88       88 aa    ]8I `8a,   ,a8` 88 `8b,   ,aa\n          ``Ybbd8``  ``YbbdP``  88       88 ``YbbdP``  ``YbbdP``  88  ``Ybbd8``\n")
    wait(0.5)
    rconsoleclear()
    wait()
    rconsoleprint("                                                                             88           \n                                                                             88           \n                                                                             88           \n8b,dPPYba,           ,adPPYba,  ,adPPYba,  8b,dPPYba,  ,adPPYba,  ,adPPYba,  88  ,adPPYba,\n88P`   `Y8 aaaaaaaa a8`      ``a8`     `8a 88P`   ``8a I8[    `` a8`     `8a 88 a8P_____88\n88         ```````` 8b         8b       d8 88       88  ``Y8ba,  8b       d8 88 8PP```````\n88                  `8a,   ,aa `8a,   ,a8` 88       88 aa    ]8I `8a,   ,a8` 88 `8b,   ,aa\n88                   ``Ybbd8``  ``YbbdP``  88       88 ``YbbdP``  ``YbbdP``  88  ``Ybbd8``\n\n")
    rconsoleprint("@@WHITE@@")
    rconsoleprint("please note that r-console is in alpha, is very buggy and probably useless compared to other admin scripts.\ntype help for commands\n")
    wait(0.5)
end

function bigintro()
    rconsoleprint("@@YELLOW@@")
    rconsoleprint("                                _..._         .-```-.                                 .-```-.                                 \n")
    wait(0.5)
    rconsoleprint("                             .-`_..._``.     `   _    \\                              `   _    \\   .---.                       \n")
    wait(0.5)
    rconsoleprint("                           .` .`      `.\\  /   /` `.   \\     _..._                 /   /` `.   \\  |   |        __.....__      \n")
    wait(0.5)
    rconsoleprint("                          / .`            .   |     \\  `   .`     `.              .   |     \\  `  |   |    .-``         `.    \n")
    wait(0.5)
    rconsoleprint(".-,.--.                  . `              |   `      |  ` .   .-.   .             |   `      |  ` |   |   /     .-````-.  `.  \n")
    wait(0.5)
    rconsoleprint("|  .-. |  ,.----------.  | |              \\    \\     / /  |  `   `  |             \\    \\     / /  |   |  /     /________\\   \\ \n")
    wait(0.5)
    rconsoleprint("| |  | | //            \\ | |               `.   ` ..` /   |  |   |  |        _     `.   ` ..` /   |   |  |                  | \n")
    wait(0.5)
    rconsoleprint("| |  | | \\\\            / . `                  `-...-``    |  |   |  |      .` |       `-...-``    |   |  \\    .-------------` \n")
    wait(0.5)
    rconsoleprint("| |  `-   ``----------`   \\ `.          .                 |  |   |  |     .   | /                 |   |   \\    `-.____...---. \n")
    wait(0.5)
    rconsoleprint("| |                        `. `._____.-`/                 |  |   |  |   .`.`| |//                 |   |    `.             .`  \n")
    wait(0.5)
    rconsoleprint("| |                          `-.______ /                  |  |   |  | .`.`.-`  /                  `---`      ```-...... -`    \n")
    wait(0.5)
    rconsoleprint("|_|                                   `                   |  |   |  | .`   \\_.`                                               \n")
    wait(0.5)
    rconsoleprint("                                                          `--`   `--`                                                         \n")
    rconsoleprint("@@WHITE@@")
    rconsoleprint("please note that r-console is in alpha, is very buggy and probably useless compared to other admin scripts.\n(help for ccommands)\n")
    wait(0.5)
end

function kill()
    lp.Character.Humanoid.Health = 0
    if lp.Character:FindFirstChild("Head") then lp.Character.Head:Destroy() end
end

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21)
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end


---loading commands---
console.commands = {
    ["translator"] = "loads evns chat inline translator",
    ["jp"] = "changes jumppower",
    ["ws"] = "changes walkspeed",
    ["nc"] = "enables/disables noclip with on and off",
    ["colour"] = "changes consoles font colour",
    ["colours"] = "returns list of colours",
    ["download"] = "downloads the game you're in (may take some time)",
    ["friend"] = "sends a friend request to specified player",
    ["echo"] = "echos input to console",
    ["help"] = "returns commands list",
    ["status"] = "returns current fps and ping",
    ["clear"] = "clears console",
    ["antiafk"] = "prevents disconnecting after 20 minutes of idling",
    ["to"] = "teleports to specified player",
    ["r"] = "resets "..lp.Name,
    ["re"] = "refreshes "..lp.Name,
    ["quit"] = "exits to main menu",
    ["languages"] = "returns supported languages from evns chat translator",
    ["rj"] = "rejoins the server you're currently playing",
    ["rjd"] = "joins a different server in the game you're currently playing",
    ["remotespy"] = "loads exxtremestuffs simplespy",
    ["bhop"] = "loads noviks universal bhop (edit by me :3)",
    ["say"] = "chats message",
    ["load"] = "runs lua files from links",
    ["lookup"] = "returns information about specified player",
    ["block"] = "removes a specified player from your game",
    ["changelog"] = "returns information on most recent update",
    ["vol"] = "changes client volume (0-10)",
    ["sens"] = "changes clients mouse sensitivity (0-10)",
    ["graphics"] = "changes client graphics quality (0-10)",
    ["shiftlock"] = "enables/disables ability to use shiftlock",
    ["sayDiscord"] = "chats message in goop #general (https://discord.gg/jxZwGQCCqR)",
    ["bundle"] = "changes players animation pack (r15 only)",
    ["bundles"] = "returns list of animation packs",
    ["nameSet"] = "changes r-console username",
    ["fly"] = "enables/disables fly with on and off",
    ["joinLogger"] = "enables/disables a logger that alerts you when players join you",
    ["syncTime"] = "a loop that syncs roblox's ingame time to your real life time",
    ["introSet"] = "permanently sets the intro that plays when you execute r-console",
    ["intros"] = "returns list of intros",
    ["fullbright"] = "enables/disables all lighting effects",
    ["nofog"] = "enables/disables ingame fog",
    ["skybox"] = "changes skybox to presets",
    ["skyboxes"] = "returns list of skybox presets",
    ["bTools"] = "enables/disables builder tools",
    ["f3x"] = "loads f3x building tools"
}
---loading commandhelp---
console.commandusage = {
    ["translator"] = "translator",
    ["jp"] = "jp (number/default)",
    ["ws"] = "ws (number/default)",
    ["nc"] = "nc (on/off)",
    ["colour"] = "colour (colour)",
    ["colours"] = "colours ()",
    ["download"] = "download ()",
    ["friend"] = "friend (player)",
    ["echo"] = "echo (message)",
    ["help"] = "help ()",
    ["status"] = "status ()",
    ["clear"] = "clear ()",
    ["antiafk"] = "antiafk ()",
    ["to"] = "to (player)",
    ["r"] = "r ()",
    ["re"] = "re ()",
    ["quit"] = "quit ()",
    ["languages"] = "languages ()",
    ["rj"] = "rj ()",
    ["rjd"] = "rjd (any/fast/smallest/largest)",
    ["remotespy"] = "remotespy ()",
    ["bhop"] = "bhop ()",
    ["say"] = "say (message)",
    ["load"] = "load (https://pastebin.com/..)",
    ["lookup"] = "lookup (player)",
    ["block"] = "block (player)",
    ["changelog"] = "changelog ()",
    ["vol"] = "vol (number)",
    ["sens"] = "sens (number)",
    ["graphics"] = "graphics (number)",
    ["shiftlock"] = "shiftlock (on/off)",
    ["saydiscord"] = "saydiscord (message)",
    ["bundle"] = "bundle (bundle)",
    ["bundles"] = "bundles ()",
    ["nameSet"] = "nameSet (userName/displayName/txt)",
    ["fly"] = "fly (on/off)",
    ["joinlogger"] = "joinlogger (on/off)",
    ["synctime"] = "syncTime ()",
    ["introset"] = "introSet (current/old/big/small)",
    ["intros"] = "intros ()",
    ["fullbright"] = "fullbright (on/off)",
    ["nofog"] = "nofog (on/off)",
    ["skybox"] = "skybox (skybox/off)",
    ["skyboxes"] = "skyboxes ()",
    ["btools"] = "btools (on/off)",
    ['f3x'] = "f3x ()"
}
---loading intros---
console.intros = {
    ["current"] = "newintro",
    ["old"] = "intro",
    ["big"] = "bigintro",
    ["small"] = "smallintro"
}
---loading settings---
getgenv().Settings = {
    rConsoleNameDetermined,
    rConsoleIntroDetermined,
    joinLoggerEnabled,
}

---functions and variables moved for easy access---
function defaultSettings()
    rConsoleNameDetermined = lp.Name
    rConsoleIntroDetermined = "current"
    joinLoggerEnabled = false
end

function SaveSettings()
    local update = {
        rConsoleNameDetermined = rConsoleNameDetermined;
        rConsoleIntroDetermined = rConsoleIntroDetermined;
        joinLoggerEnabled = joinLoggerEnabled;
    }
    writefile("config.console", game:GetService("HttpService"):JSONEncode(update))
end

function LoadSettings()
    local success, errorsend = pcall(function()
		saves = game:GetService("HttpService"):JSONDecode(readfile("config.console"))
    end)
    if not success then
		defaultSettings()
		SaveSettings()
		return
    end
    rConsoleNameDetermined = saves.rConsoleNameDetermined
    joinLoggerEnabled = saves.joinLoggerEnabled
    rConsoleIntroDetermined = saves.rConsoleIntroDetermined
end

if writefile and readfile then
    LoadSettings()
else
    defaultSettings()
end

function preload()
    if joinLoggerEnabled then
        rconsoleprint(">nathan's joinlogger preloaded\n ")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/62092/r-console/main/etc/joinlog.lua"))()
    end
    if rConsoleNameDetermined then
        rconsoleprint(">"..rConsoleNameDetermined)
    end
    if rConsoleIntroDetermined then
        rconsoleprint(">"..rConsoleIntroDetermined)
    end
end

local changelogoutput = "SOME SETTINGS SAVE <(^-^)< <(^-^)> >(^-^)>!! Added introSet and intros, syncTime, joinLogger (saves) and fly"

---loading config---
rconsolename("r-console")
--execwebhook(lp.Name,lp.DisplayName,lp.UserId,execwebhookurl,game.PlaceId,lp.AccountAge)


---loading intro---
loading()

--[[how to format commands below

name = function()
    function
end,
]]

commands = {

    f3x = function()
        if confirm("this command is not reversable") then
            loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
        end
    end,


    btools = function(args)
        local input = args:lower()
        local Clone_T
        local Destruct
        local Hold_T
        if input == "on" then
            Clone_T = Instance.new("HopperBin", lp.Backpack)
	        Clone_T.BinType = "Clone"
	        Destruct = Instance.new("HopperBin", lp.Backpack)
	        Destruct.BinType = "Hammer"
	        Hold_T = Instance.new("HopperBin", lp.Backpack)
	        Hold_T.BinType = "Grab"
        elseif input == "off" then
            Clone_T:Remove()
            Destruct:Remove()
            Hold_T:Remove()
        end
    end,

    skyboxes = function()
        for i,v in pairs(console.skyboxes) do
            rconsolewarn(v)
        end
    end,
    
    skybox = function(args)
            sky = Instance.new("Sky", game.Lighting)
            local input = args:lower()
            if input == "tropical" then
                sky.SkyboxBk = "rbxassetid://591058823"
        		sky.SkyboxDn = "rbxassetid://591059876"
        		sky.SkyboxFt = "rbxassetid://591058104"
        		sky.SkyboxLf = "rbxassetid://591057861"
        		sky.SkyboxRt = "rbxassetid://591057625"
        		sky.SkyboxUp = "rbxassetid://591059642"
            elseif input == "snowy" then
                sky.SkyboxBk = "rbxassetid://155657655"
        		sky.SkyboxDn = "rbxassetid://155674246"
        		sky.SkyboxFt = "rbxassetid://155657609"
        		sky.SkyboxLf = "rbxassetid://155657671"
        		sky.SkyboxRt = "rbxassetid://155657619"
        		sky.SkyboxUp = "rbxassetid://155674931"
        	elseif input == "sunset" then
                sky.SkyboxBk = "rbxassetid://600830446"
                sky.SkyboxDn = "rbxassetid://600831635"
                sky.SkyboxFt = "rbxassetid://600832720"
                sky.SkyboxLf = "rbxassetid://600886090"
                sky.SkyboxRt = "rbxassetid://600833862"
                sky.SkyboxUp = "rbxassetid://600835177"
            elseif input == "mountains" then
                sky.SkyboxBk = "rbxassetid://368385273"
                sky.SkyboxDn = "rbxassetid://48015300"
                sky.SkyboxFt = "rbxassetid://368388290"
                sky.SkyboxLf = "rbxassetid://368390615"
                sky.SkyboxRt = "rbxassetid://368385190"
                sky.SkyboxUp = "rbxassetid://48015387"
            elseif input == "eyes" then
                sky.SkyboxBk = "rbxassetid://6823346883"
                sky.SkyboxDn = "rbxassetid://6823346883"
                sky.SkyboxFt = "rbxassetid://6823346883"
                sky.SkyboxLf = "rbxassetid://6823346883"
                sky.SkyboxRt = "rbxassetid://6823346883"
                sky.SkyboxUp = "rbxassetid://6823346883"
            elseif input == "space" then
                sky.SkyboxBk = "rbxassetid://155441936"
                sky.SkyboxDn = "rbxassetid://155441802"
                sky.SkyboxFt = "rbxassetid://155441818"
                sky.SkyboxLf = "rbxassetid://155441777"
                sky.SkyboxRt = "rbxassetid://155441874"
                sky.SkyboxUp = "rbxassetid://155441905"
            elseif input == "foggy" then
                sky.SkyboxBk = "rbxassetid://1370717244"
                sky.SkyboxDn = "rbxassetid://1370717336"
                sky.SkyboxFt = "rbxassetid://1370717438"
                sky.SkyboxLf = "rbxassetid://1370717567"
                sky.SkyboxRt = "rbxassetid://1370717698"
                sky.SkyboxUp = "rbxassetid://1370717782"
            elseif input == "galaxy" then
                sky.SkyboxBk = "rbxassetid://159248188"
                sky.SkyboxDn = "rbxassetid://159248183"
                sky.SkyboxFt = "rbxassetid://159248187"
                sky.SkyboxLf = "rbxassetid://159248173"
                sky.SkyboxRt = "rbxassetid://159248192"
                sky.SkyboxUp = "rbxassetid://159248176"
            elseif input == "hills" then
                sky.SkyboxBk = "rbxassetid://9678579801"
                sky.SkyboxDn = "rbxassetid://9678580581"
                sky.SkyboxFt = "rbxassetid://9678581455"
                sky.SkyboxLf = "rbxassetid://9678583373"
                sky.SkyboxRt = "rbxassetid://9678584222"
                sky.SkyboxUp = "rbxassetid://9678585103"
            elseif input == "cloudy" then
                sky.SkyboxBk = "rbxassetid://4498828382"
                sky.SkyboxDn = "rbxassetid://4498828812"
                sky.SkyboxFt = "rbxassetid://4498829917"
                sky.SkyboxLf = "rbxassetid://4498830911"
                sky.SkyboxRt = "rbxassetid://4498830417"
                sky.SkyboxUp = "rbxassetid://4498831746"
            elseif input == "dawn" then
                sky.SkyboxBk = "rbxassetid://323494035"
                sky.SkyboxDn = "rbxassetid://323494368"
                sky.SkyboxFt = "rbxassetid://323494130"
                sky.SkyboxLf = "rbxassetid://323494252"
                sky.SkyboxRt = "rbxassetid://323494067"
                sky.SkyboxUp = "rbxassetid://323493360"
            elseif input == "purple" then
                sky.SkyboxBk = "rbxassetid://264908339"
                sky.SkyboxDn = "rbxassetid://264907909"
                sky.SkyboxFt = "rbxassetid://264909420"
                sky.SkyboxLf = "rbxassetid://264909758"
                sky.SkyboxRt = "rbxassetid://264908886"
                sky.SkyboxUp = "rbxassetid://264907379"
            elseif input == "casino" then
                sky.SkyboxBk = "rbxassetid://155582972"
                sky.SkyboxDn = "rbxassetid://155583353"
                sky.SkyboxFt = "rbxassetid://155583266"
                sky.SkyboxLf = "rbxassetid://155583226"
                sky.SkyboxRt = "rbxassetid://155582929"
                sky.SkyboxUp = "rbxassetid://155583401"
            elseif input == "off" then
                sky:Remove()
            else
                rconsoleerr("invalid syntax, have you used the bundles command?")
        end
    end,
    
    nofog = function(args)
        local input = args:lower()
        if input == "on" then
            lighting.FogEnd = 786543
        elseif input == "off" then
            lighting.FogEnd = console.savedLighting.FogEnd
        end
    end,
    
    
    fullbright = function(args)
        local input = args:lower()
        if input == "on" then
            lighting.Brightness = 1
			lighting.ClockTime = 12
			lighting.FogEnd = 786543
			lighting.GlobalShadows = false
			lighting.Ambient = Color3.fromRGB(178, 178, 178)
        elseif input == "off" then
            lighting.Brightness = console.savedLighting.Brightness
            lighting.ClockTime = console.savedLighting.ClockTime
            lighting.FogEnd = console.savedLighting.FogEnd
            lighting.GlobalShadows = console.savedLighting.GlobalShadows
            lighting.Ambient = console.savedLighting.Ambient
        end
    end,

    
    intros = function()
        for i,v in pairs(console.intros) do
            rconsolewarn(i.." -> "..v)
        end
    end,
    
    introset = function(args)
        local input = args:lower()
        if input == "old" then
            rconsolewarn("the "..input.." intro will play the next time you use r-console")
            rConsoleIntroDetermined = input
            getgenv().Settings.rConsoleIntroDetermined = input
        elseif input == "current" then
            rconsolewarn("the "..input.." intro will play the next time you use r-console")
            rConsoleIntroDetermined = input
            getgenv().Settings.rConsoleIntroDetermined = input
        elseif input == "big" then
            rconsolewarn("the "..input.." intro will play the next time you use r-console")
            rConsoleIntroDetermined = input
            getgenv().Settings.rConsoleIntroDetermined = input
        elseif input == "small" then
            rconsolewarn("the "..input.." intro will play the next time you use r-console")
            rConsoleIntroDetermined = input
            getgenv().Settings.rConsoleIntroDetermined = input
        else
            rconsoleerr("invalid syntax, either old, current big or small")
        end
        SaveSettings()
    end,
    
    
    synctime = function()
        if confirm("this command is not reversable") then
            spawn(function()
                while wait(0.001) do 
                    local syncclocktime = os.date("%I:%M:%S")
                    game:GetService("Lighting").TimeOfDay = syncclocktime
                end
            end)
        end
    end,
    
    joinlogger = function(args)
        local input = args:lower()
        if input == "on" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/62092/r-console/main/etc/joinlog.lua"))()
            rconsolewarn("nathan's join logger loaded")
            joinLoggerEnabled = true
            getgenv().Settings.joinLoggerEnabled = true
        elseif input == "off" then
            joinLoggerEnabled = false
            getgenv().Settings.joinLoggerEnabled = false
            rconsolewarn("rejoin for command to take affect")
        else
            rconsoleerr("invalid syntax, either on or off")
        end
        SaveSettings()
    end,
    
    fly = function(args)
        local input = args:lower()
        if input == "on" then
            if FLYING then
                rconsoleerr("flying is already enabled")
            else
                FLYING = false
                flyPlayer()
            end
        elseif input == "off" then
            if FLYING then
                FLYING = false
            else
                rconsoleerr("flying is already disabled")
            end
        else
            rconsoleerr("invalid syntax, either on or off")
        end
    end,

    nameset = function(args)
        local input = args:lower()
        if input == "username" then
            rConsoleNameDetermined = lp.Name
            getgenv().Settings.rConsoleNameDetermined = lp.Name
        elseif input == "displayname" then
            rConsoleNameDetermined = lp.displayName
            getgenv().Settings.rConsoleNameDetermined = lp.displayName
        else
            rConsoleNameDetermined = input
            getgenv().Settings.rConsoleNameDetermined = input
        end
        SaveSettings()
    end,

    bundles = function()
        rconsolewarn("these are for the bundle command")
        for i,v in pairs(console.bundles) do
            rconsolewarn(v)
        end
    end,
    
    bundle = function(args)
        local input = args:lower()
        local Char = lp.Character
        if r15Check(lp) then
            if input == "zombie2" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616165109"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616166655"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
            elseif input == "sneaky" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1132500520"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1132506407"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
            elseif input == "old" then
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=387947158"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=387947464"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=387947975"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616092998"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616094091"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=382460631"
            elseif input == "toy" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=782844582"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=782845186"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
            elseif input == "pirate" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=750784579"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=750785176"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
            elseif input == "knight" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=657560551"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=657557095"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
            elseif input == "astronaut" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=891639666"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=891663592"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
            elseif input == "vampire" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1083464683"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1083467779"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
            elseif input == "robot" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616092998"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616094091"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
            elseif input == "levitation" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
            elseif input == "bubbly" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=909997997"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
            elseif input == "werewolf" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1083222527"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1083225406"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
            elseif input == "stylish" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616143378"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616144772"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
            elseif input == "mage" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=707876443"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=707894699"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
            elseif input == "cartoony" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=742639220"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=742639812"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
            elseif input == "zombie" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616165109"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616166655"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
            elseif input == "superhero" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616119360"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616120861"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
            elseif input == "ninja" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=656119721"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=656121397"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
            elseif input == "elder" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=845401742"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=845403127"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
            elseif input == "oldschool" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=5319816685"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=5319839762"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=5319828216"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=5319831086"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=5319841935"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=5319844329"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=5319850266"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=5319852613"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=5319847204"
            elseif input == "confident" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1070009914"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1070012133"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
            elseif input == "popstar" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1212852603"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1212998578"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
            elseif input == "patrol" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1151204998"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1151221899"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
            elseif input == "princess" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=941018893"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=941025398"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
            elseif input == "cowboy" then
                Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
                Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
                Char.Animate.idle.Animation1.Weight.Value = "9"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
                Char.Animate.idle.Animation2.Weight.Value = "1"
                Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
                Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1014406523"
                Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1014411816"
                Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
            elseif input == "toilet" then
                Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
                Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=4417977954"
                Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=4417979645"            
            else
                rconsoleerr("invalid syntax, have you used the bundles command?")
            end
        else
            rconsoleerr("you need r15 enabled for this command")
        end
    end,
    
    
    saydiscord = function(args)
        local input = args
        chatwebhook(args,chatwebhookurl)
    end,

    shiftlock = function(args)
        local input = args:lower()
        if input == "on" then
            UserSettings():GetService("UserGameSettings").ControlMode = 1
        elseif input == "off" then
            UserSettings():GetService("UserGameSettings").ControlMode = 0
        else
            rconsoleerr("invalid syntax, either on or off")
        end
    end,
    
    vol = function(args)
        local input = tonumber(args)
        if input > 10 then
            rconsoleerr("parameters for volume are 0-10")
        elseif input == 10 then
            gamesettings.MasterVolume = 1
        elseif input < 10 then
            input = input / 10
            gamesettings.MasterVolume = input
        end
    end,
    
    graphics = function(args)
        local input = tonumber(args)
        if input > 20 then
            rconsoleerr("parameters for graphics are 1-20")
        elseif input == 20 then
            settings().Rendering.QualityLevel = 20
        elseif input < 10 then
            input = input * 10
            settings().Rendering.QualityLevel = input
        end
    end,
    
    sens = function(args)
        local input = tonumber(args)
        UIS.MouseDeltaSensitivity = input
    end,
    
    changelog = function()
        rconsolewarn(changelogoutput)
    end,
    
    block = function(args)
        target = blockPlayer(args)
    end,
    
    cmdhelp = function(args)
        local input = args:lower()
        if console.commandusage[input] then
            messagebox(console.commandusage[input],"command usage",0)
        else
            rconsoleerr("invalid syntax, have you used the help command?")
        end
    end,
    
    help = function()
        rconsolewarn("cmdhelp [command] for usage\n")
        for i,v in pairs(console.commands) do
            rconsolewarn(i)
            rconsoleprint("-> "..v.."\n\n")
        end
    end,
    
    antiafk = function()
        rconsolewarn("antiafk enabled")
        lp.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end,
    
    bhop = function()
        if r15Check(lp) then
            rconsoleerr("you need r6 enabled for this command")
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/62092/r-console/main/etc/bhop.lua"))()
            if bhopBug then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/62092/r-console/main/etc/bhop.lua"))()
                bhopBug = false
            end
            rconsolewarn("noviks universal bhop")
        end
    end,
    
    download = function()
        saveinstance()
        rconsolewarn("game downloaded")
    end,
    
    colour = function(args)
        local input = args:lower()
        if input == "black" then consolecolor = "BLACK" elseif input == "blue" then consolecolor = "BLUE" elseif input == "green" then consolecolor = "GREEN" elseif input == "cyan" then consolecolor = "CYAN" elseif input == "red" then consolecolor = "RED" elseif input == "magenta" then consolecolor = "MAGENTA" elseif input == "brown" then consolecolor = "BROWN" elseif input == "light gray" then consolecolor = "LIGHT_GRAY" elseif input == "dark gray" then consolecolor = "DARK_GRAY" elseif input == "light blue" then consolecolor = "LIGHT_BLUE" elseif input == "light green" then consolecolor = "LIGHT_GREEN" elseif input == "light cyan" then consolecolor = "LIGHT_CYAN" elseif input == "light red" then consolecolor = "LIGHT_RED" elseif input == "light magenta" then consolecolor = "LIGHT_MAGENTA" elseif input == "yellow" then consolecolor = "YELLOW" elseif input == "white" then consolecolor = "WHITE" else
            rconsolewarn("please specify a colour, use the command colours for a list")
        end
    end,
    
    colours = function()
        rconsolewarn("these colours are meant for the colours command")
        for i,v in pairs(console.colours) do
            rconsolewarn(v)
        end
    end,
    
    
    rjd = function(args)
        rejoining = true
        if syn.queue_on_teleport then
            syn.queue_on_teleport('game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()')
        end
        local Decision = args or "any"
        local GUIDs = {}
        local maxPlayers = 0
        local pagesToSearch = 100
        rconsolewarn("beginning serverhop")
        if Decision == "fast" then pagesToSearch = 5 end
        local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
        for i = 1,pagesToSearch do
            for i,v in pairs(Http.data) do
                if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
                    maxPlayers = v.maxPlayers
                    table.insert(GUIDs, {id = v.id, users = v.playing})
                    rconsolewarn("page searched")
                    wait(0.5)
                end
            end
            if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
        end
        if Decision == "any" or Decision == "fast" then
            rconsolewarn("attempting serverhop")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, lp)
        elseif Decision == "smallest" then
            rconsolewarn("attempting serverhop")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, lp)
        elseif Decision == "largest" then
            rconsolewarn("attempting serverhop")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, lp)
        else
            rconsolewarn("valid preset is required: any/fast/smallest/largest")
        end
        wait()
        rejoining = false
    end,
    
    friend = function(args)
        target = getPlayer(args)
        if target then
            lp:RequestFriendship(target)
            rconsolewarn("sent friend request to "..target.Name)
        else
            rconsolewarn("player does not exist")
        end
    end,
    
    load = function(args)
        loadstring(game:HttpGet(args))()
        rconsolewarn("script loaded")
    end,
    
    status = function()
        local ping = (1/wait())
        local pingexact = string.sub(ping,0,4)
        local HBFps = 0
        local Heartbeat = game:GetService("RunService").Heartbeat
        local LastIteration, Start
        local FrameUpdateTable = { }
        local function HeartbeatUpdate()
            LastIteration = tick()
            for Index = #FrameUpdateTable, 1, -1 do
                FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
            end
            FrameUpdateTable[1] = LastIteration
            local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
            CurrentFPS = CurrentFPS - CurrentFPS % 1
            HBFps = CurrentFPS
        end
        Start = tick()
        local x = Heartbeat:Connect(HeartbeatUpdate)
        wait(.5)
        x:Disconnect()
        rconsolewarn("current fps: "..HBFps.." current ping: "..pingexact)
    end,
    
    lookup = function(args)
        target = getPlayer(args)
        if target then
            local tbl = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://users.roblox.com/v1/users/"..target.UserId))
            local tbl2 = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://friends.roblox.com/v1/users/"..target.UserId.."/followers/count"))
            local tbl3 = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://friends.roblox.com/v1/users/"..target.UserId.."/followings/count"))
            local tbl4 = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://friends.roblox.com/v1/users/"..target.UserId.."/friends/count"))
            local Created = tbl["created"]:split("T")
            local Created2 = Created[2]:split(".")
            local desc = tbl["description"]
            local verified = tbl["hasVerifiedBadge"]
            local display = tbl["displayName"]
            local userid = tbl["id"]
            local followcount = tbl2["count"]
            local followingcount = tbl3["count"]
            local friendcount = tbl3["count"]
            rconsolewarn(target.Name.." {\n   displayName: "..display.."\n   userId: "..userid.."\n   isVerified: "..tostring(verified).."\n   description: "..desc.."\n   followerCount: "..followcount.."\n   followingCount: "..followingcount.."\n   friendCount: "..friendcount.."\n   joinedOn: "..Created[1].." "..Created2[1].."\n}")
        else
            rconsoleerr("player does not exist")
        end
    end,
    
    translator = function()
        loadstring(game:HttpGet("https://i.qts.life/r/ChatInlineTranslator.lua"))()
        rconsolewarn("evns chat translator (languages for language presets)")
    end,
    
    languages = function()
        for i,v in pairs(languages) do
            rconsolewarn(v)
        end
    end,
    
    remotespy = function()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
        rconsolewarn("exxtremestuffs simplespy")
    end,
    
    to = function(args)
        target = getPlayer(args)
        if target then
            lp.Character:MoveTo(target.Character.HumanoidRootPart.Position)
        else
            rconsolewarn("player does not exist")
        end
    end,
    
    rj = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end,
    
    re = function()
        local opos = lp.Character.HumanoidRootPart.CFrame
        kill()
        lp.CharacterAdded:Wait()
        lp.Character:WaitForChild("HumanoidRootPart")
        lp.Character.HumanoidRootPart.CFrame = opos
    end,
    
    say = function(args)
        sr:FireServer(args,"All")
    end,
    
    clear = function()
        rconsoleclear()
    end,
    
    echo = function(args)
        rconsoleerr(args)
    end,
    
    quit = function()
        game:Shutdown()
    end,
    
    nc = function(args)
        input = args:lower()
        if input == "on" then
            noclip()
        elseif input == "off" then
            clip()
        else
            rconsoleerr("invalid syntax either on or off")
        end
    end,

    
    ws = function(args)
        local input = args:lower()
        if input == "default" then
            lp.Character.Humanoid.WalkSpeed = defaultwsjp
        else
            lp.Character.Humanoid.WalkSpeed = input
        end
    end,
    
    r = function()
        kill()
    end,
    
    jp = function(args)
        local input = args:lower()
        if input == "default" then
            lp.Character.Humanoid.JumpPower = 50
        else
            lp.Character.Humanoid.JumpPower = input
        end
    end,
--[[ useless command, might use it in future
    ui = function(args)
        if args == "off" then 
            rconsolewarn("turned off ui")
        elseif args == "on" then
            rconsolewarn("turned on ui")
        else
            rconsolewarn("valid preset is required: on/off")
        end
    end,
    ]]
--[[ help command doesn't matter - keep just incase.
    help = function()
        rconsolewarn("cmdhelp [command] for usage")
        for i, command in pairs(commands) do
            local commandstring = tostring(i)
            rconsolewarn(commandstring, desc)
            if string.find(commandstring, "desc") then
                rconsolewarn("this is a description")
            else
                local desc = commandstring.."desc" -- indexing desc from table using the current commands name
            end
        end
    end
    ]]
}

while true do
    rconsoleprint("@@"..consolecolor.."@@")
    rconsoleprint("\nC:\\Users\\" ..rConsoleNameDetermined.. ">")
    local line = rconsoleinput()
    local command, args = string.match(line, "(%S+)%s*(.*)")
    if command == nil then
        return
    end
    if type(commands[command]) ~= "function" then
        rconsoleerr("unknown command: " .. command)
    else
        local success, err = pcall(commands[command], args)
        if not success then
            rconsoleerr(err)
        end
    end
end
