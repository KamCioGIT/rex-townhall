local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- Job Apply
-----------------------------------------------------------------------
RegisterNetEvent('rex-townhall:server:applyjob', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    if not Player then return end
    local ped = GetPlayerPed(src)
    Player.Functions.SetJob(data.job, data.grade)
    TriggerClientEvent('rex-townhall:client:notifyjob', src, data.jobtitle)
    TriggerEvent('rsg-log:server:CreateLog', 'newjob', 'Player New Job', 'green', firstname..' '..lastname..' is now a '..data.jobtitle)
end)
