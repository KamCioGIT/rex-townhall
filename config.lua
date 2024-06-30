Config = {}

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- townhall settings
---------------------------------
Config.TownHallLocations = {
    { 
		name = 'St Dennis City Hall',
		prompt = 'std-cityhall',
		coords = vector3(2596.06, -1300.18, 52.82),
        npcmodel = `mp_u_m_m_lawcamp_leadofficer_01`,
        npccoords = vector4(2596.06, -1300.18, 52.82, 304.55),
		location = 'saintdennis',
		blipname = 'St Dennis City Hall',
		blipsprite = 'blip_mp_defend_target',
		blipscale = 0.2,
		showblip = true
	},
}

---------------------------------
-- Jobs
---------------------------------
Config.Jobs = {
    { 
		title    = 'Unemployed',
		icon     = 'fa-solid fa-user-gear',
		job      = 'unemployed',
		grade    = 0,
		jobcost  = 0,
		jobitems = {},
		arrow    = true
	},
    { 
		title    = 'Farmer',
		icon     = 'fa-solid fa-user-gear',
		job      = 'farmer',
		grade    = 0,
		jobcost  = 25,
		jobitems = {},
		arrow    = true
	},
    { 
		title    = 'Miner',
		icon     = 'fa-solid fa-user-gear',
		job      = 'miner',
		grade    = 0,
		jobcost  = 25,
		jobitems = {
			{ item = 'pickaxe', amount = 1 },
		},
		arrow    = true
	},
}
