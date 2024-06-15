local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- Job Apply
-----------------------------------------------------------------------
RegisterNetEvent('rex-townhall:server:applyjob', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local ped = GetPlayerPed(src)
    Player.Functions.SetJob(data.job, data.grade)
    TriggerClientEvent('rex-townhall:client:notifyjob', src, data.jobtitle)
end)
