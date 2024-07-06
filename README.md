# RexshackGaming
- discord : https://discord.gg/YUV7ebzkqs
- youtube : https://www.youtube.com/@rexshack/videos
- tebex store : https://rexshackgaming.tebex.io/
- support me : https://ko-fi.com/rexshackgaming

# Framework RSGCore RedM Edition
- https://github.com/Rexshack-RedM

# Dependancies
- rsg-core
- rsg-target
- ox_lib

# Installation
- ensure that the dependancies are added and started
- add rex-townhall to your resources folder

# Add Jobs
- add jobs to "\rsg-core\shared\jobs.lua"
```
    ['farmer'] = {
        label = 'Farmer',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Farmer', payment = 5 },
        },
    },
    ['miner'] = {
        label = 'Miner',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Miner', payment = 5 },
        },
    },
```

# Starting the resource
- add the following to your server.cfg file : ensure rex-townhall
