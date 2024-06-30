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
-- trader menu
---------------------------------------------
RegisterNetEvent('rex-townhall:client:jobsmenu', function()
    local options = {}
    for k,v in pairs(Config.Jobs) do
        options[#options + 1] = {
            title = v.title..' (Job Cost $'..v.jobcost..')',
            icon = v.icon,
            serverEvent = 'rex-townhall:server:applyjob',
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
