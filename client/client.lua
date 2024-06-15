local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------
-- prompts and blips
---------------------------------
CreateThread(function()
    for _,v in pairs(Config.TownHallLocations) do
        if v.showblip == true then
            local TownhallBlip = BlipAddForCoords(1664425300, v.coords)
            SetBlipSprite(TownhallBlip, joaat(v.blipsprite), true)
            SetBlipScale(TownhallBlip, v.blipscale)
            SetBlipName(TownhallBlip, v.blipname)
        end
    end
end)

---------------------------------
-- main menu
---------------------------------
RegisterNetEvent('rex-townhall:client:mainmenu', function()
    lib.registerContext({
        id = 'main_menu',
        title = 'Town Hall Menu',
        options = {
            {
                title = 'Jobs',
                icon = 'fa-solid fa-briefcase',
                event = 'rex-townhall:client:jobsmenu',
                arrow = true
            },
        }
    })
    lib.showContext('main_menu')
end)

---------------------------------
-- jobs menu
---------------------------------
RegisterNetEvent('rex-townhall:client:jobsmenu', function()
    lib.registerContext({
        id = 'jobs_menu',
        title = 'Jobs Menu',
        menu = 'main_menu',
        options = {
            {
                title = 'Unempolyed',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-shield',
                args = { job = 'unemployed', grade = 0, jobtitle = 'Unempolyed' },
                arrow = true
            },
            {
                title = 'Valentine Law Enforcement',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-shield',
                args = { job = 'vallaw', grade = 0, jobtitle = 'Valentine Law Enforcement' },
                arrow = true
            },
            {
                title = 'Rhodes Law Enforcement',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-shield',
                args = { job = 'rholaw', grade = 0, jobtitle = 'Rhodes Law Enforcement' },
                arrow = true
            },
            {
                title = 'Blackwater Law Enforcement',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-shield',
                args = { job = 'blklaw', grade = 0, jobtitle = 'Blackwater Law Enforcement' },
                arrow = true
            },
            {
                title = 'Strawberry Law Enforcement',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-shield',
                args = { job = 'strlaw', grade = 0, jobtitle = 'Strawberry Law Enforcement' },
                arrow = true
            },
            {
                title = 'Saint Denis Law Enforcement',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-shield',
                args = { job = 'stdenlaw', grade = 0, jobtitle = 'Saint Denis Law Enforcement' },
                arrow = true
            },
            {
                title = 'Medic',
                serverEvent = 'rex-townhall:server:applyjob',
                icon = 'fa-solid fa-heart',
                args = { job = 'medic', grade = 0, jobtitle = 'Medic' },
                arrow = true
            },
        }
    })
    lib.showContext('jobs_menu')
end)

RegisterNetEvent('rex-townhall:client:notifyjob', function(title)
    lib.notify({ title = 'You now have the job of ' .. title, duration = 7000, type = 'success' })
end)
