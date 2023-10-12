local whitelistHWID = {
    wl1 = "CE3526AA-F11E-46DA-8AD4-0384601FF572"
}
local whitelistACC = {

}

for i,v in pairs(whitelistHWID) do
    if game:GetService("RbxAnalyticsService"):GetClientId() == v then
        warn("Passed whitelist test 1")
        for i,v in pairs(whitelistACC) do
            if game.Players.LocalPlayer.UserId == whitelistACC then
                warn("Passed whitelist test 2")
            else
                game.Players.LocalPlayer:Kick("Not whitelisted")
            end
        end
    else
        game.Players.LocalPlayer:Kick("Not whitelisted")
    end
end 
