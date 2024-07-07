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
-- town hall main job menu
---------------------------------
RegisterNetEvent('rex-townhall:client:mainmenu', function()
    lib.registerContext({
        id = 'townhall_main_menu',
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
    lib.showContext('townhall_main_menu')
end)

---------------------------------------------
-- jobs menu
---------------------------------------------
RegisterNetEvent('rex-townhall:client:jobsmenu', function()
    local options = {}
    for k,v in pairs(Config.Jobs) do
        options[#options + 1] = {
            title = v.title..' (Job Cost $'..v.jobcost..')',
            icon = v.icon,
            event = 'rex-townhall:client:applyjob',
            args = { 
                job = v.job,
                grade = v.grade,
                jobtitle = v.jobtitle,
                jobcost = v.jobcost,
                jobitems = v.jobitems,
            },
            arrow = true,
        }
        lib.registerContext({
            id = 'job_menu',
            title = 'Town Hall Jobs',
            menu = 'townhall_main_menu',
            position = 'top-right',
            options = options
        })
        lib.showContext('job_menu')
    end
end)

---------------------------------------------
-- check and apply job
---------------------------------------------
RegisterNetEvent('rex-townhall:client:applyjob', function(data)

    RSGCore.Functions.TriggerCallback('rsg-multijob:server:checkjobs', function(canapply)
        if not canapply then
            lib.notify({ title = 'You have too many jobs already!', type = 'error', duration = 7000 })
            return
        end
        TriggerServerEvent('rex-townhall:server:applyjob', data)
    end)

end)
