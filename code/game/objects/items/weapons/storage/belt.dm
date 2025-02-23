/obj/item/weapon/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	force = 2
	storage_slots = 7
	max_w_class = 3
	max_storage_space = 28
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")
	sprite_sheets = list("Resomi" = 'icons/mob/species/resomi/belt.dmi')
	drop_sound = 'sound/items/drop/leather.ogg'

	var/show_above_suit = 0

/obj/item/weapon/storage/belt/verb/toggle_layer()
	set name = "Switch Belt Layer"
	set category = "Object"

	if(show_above_suit == -1)
		to_chat(usr, "<span class='notice'>\The [src] cannot be worn above your suit!</span>")
		return
	show_above_suit = !show_above_suit
	update_icon()

/obj/item/weapon/storage/update_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_belt()


/obj/item/weapon/storage/belt/utility
	name = "tool-belt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Can hold various tools."
	icon_state = "utilitybelt"
	item_state = "utility"
	can_hold = list(
		///obj/item/weapon/combitool,
		/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/device/multitool,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/device/t_scanner,
		/obj/item/device/analyzer,
		/obj/item/taperoll/engineering,
		/obj/item/device/robotanalyzer,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/material/hatchet,
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/weapon/pipewrench
		)


/obj/item/weapon/storage/belt/utility/full/fill()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))


/obj/item/weapon/storage/belt/utility/atmostech/fill()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/t_scanner(src)



/obj/item/weapon/storage/belt/medical
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medicalbelt"
	item_state = "medical"
	can_hold = list(
		/obj/item/device/breath_analyzer,
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/dnainjector,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/reagent_containers/glass/beaker,
		/obj/item/weapon/reagent_containers/glass/bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/reagent_containers/inhaler,
		/obj/item/weapon/reagent_containers/personal_inhaler_cartridge,
		/obj/item/weapon/personal_inhaler,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/head/surgery,
		/obj/item/clothing/gloves/latex,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/weapon/crowbar,
		/obj/item/device/flashlight,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/device/antibody_scanner
		)

/obj/item/weapon/storage/belt/medical/emt
	name = "EMT utility belt"
	desc = "A sturdy black webbing belt with attached pouches."
	icon_state = "emsbelt"
	item_state = "emsbelt"

/obj/item/weapon/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon_state = "securitybelt"
	item_state = "security"
	can_hold = list(
		/obj/item/weapon/grenade,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/handcuffs,
		/obj/item/device/flash,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_magazine,
		/obj/item/weapon/reagent_containers/food/snacks/donut/,
		/obj/item/weapon/melee/baton,
		/obj/item/weapon/gun/energy/taser,
		/obj/item/weapon/flame/lighter,
		/obj/item/clothing/glasses/hud/security,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/flashlight/flare,
		/obj/item/device/flashlight/flare/glowstick,
		/obj/item/device/pda,
		/obj/item/device/radio/headset,
		/obj/item/device/hailer,
		/obj/item/device/megaphone,
		/obj/item/weapon/melee,
		/obj/item/weapon/gun/projectile/sec,
		/obj/item/taperoll/police,
		/obj/item/weapon/material/knife/trench,
		/obj/item/weapon/shield/energy,
		/obj/item/weapon/shield/riot/tact,
		/obj/item/device/holowarrant
		)

/obj/item/weapon/storage/belt/soulstone
	name = "soul stone belt"
	desc = "Designed for ease of access to the shards during a fight, as to not let a single enemy spirit slip away"
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"
	storage_slots = 6
	can_hold = list(
		/obj/item/device/soulstone
		)

/obj/item/weapon/storage/belt/soulstone/full/fill()
	..()
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)
	new /obj/item/device/soulstone(src)

/obj/item/weapon/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "championbelt"
	item_state = "champion"
	storage_slots = 1
	can_hold = list(
		"/obj/item/clothing/mask/luchador"
		)

/obj/item/weapon/storage/belt/security/tactical
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swatbelt"
	item_state = "swatbelt"
	storage_slots = 9
	max_w_class = 3
	max_storage_space = 28

/obj/item/weapon/storage/belt/military
	name = "military belt"
	desc = "A lightweight, quick to use, military belt. Designed to be comfortably worn even during lengthy military operations."
	icon_state = "militarybelt"
	item_state = "militarybelt"
	storage_slots = 9 //same as a combat belt now
	max_w_class = 3
	max_storage_space  = 28
	can_hold = list(
		/obj/item/weapon/grenade,
		/obj/item/weapon/handcuffs,
		/obj/item/device/flash,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_magazine,
		/obj/item/weapon/melee/baton,
		/obj/item/device/flashlight,
		/obj/item/device/pda,
		/obj/item/device/radio/headset,
		/obj/item/weapon/melee,
		/obj/item/weapon/shield/energy,
		/obj/item/weapon/pinpointer,
		/obj/item/weapon/plastique,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/energy/crossbow,
		/obj/item/weapon/material/knife/trench,
		/obj/item/ammo_casing/a145,
		/obj/item/device/radio/uplink,
		/obj/item/weapon/card/emag,
		/obj/item/device/multitool/hacktool,
		/obj/item/weapon/reagent_containers/hypospray/combat,
		/obj/item/stack/telecrystal
		)

/obj/item/weapon/storage/belt/military/syndicate
	desc = "A syndicate belt designed to be used by boarding parties. Its style is modeled after the hardsuits they wear."
	icon_state = "militarybelt_syndie"
	item_state = "militarybelt_syndie"

/obj/item/weapon/storage/belt/janitor
	name = "janibelt"
	desc = "A belt used to hold most janitorial supplies."
	icon_state = "janibelt"
	item_state = "janibelt"
	storage_slots = 6
	w_class = 3
	max_w_class = 3
	can_hold = list(
		/obj/item/weapon/grenade/chem_grenade, //if I'm going to be doing a full allowance on one belt, I need to do the other.
		/obj/item/device/lightreplacer,
		/obj/item/device/flashlight,
		/obj/item/weapon/reagent_containers/spray,
		/obj/item/weapon/soap,
		/obj/item/weapon/storage/bag/trash,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/wrench,
		/obj/item/weapon/crowbar
		)

/obj/item/weapon/storage/belt/wands
	name = "wand belt"
	desc = "A belt designed to hold various rods of power."
	icon_state = "soulstonebelt"
	item_state = "soulstonebelt"
	storage_slots = 5
	max_w_class = 3
	max_storage_space  = 28
	can_hold = list(
		/obj/item/weapon/gun/energy/wand
		)

/obj/item/weapon/storage/belt/wands/full/fill()
	..()
	new /obj/item/weapon/gun/energy/wand/fire(src)
	new /obj/item/weapon/gun/energy/wand/polymorph(src)
	new /obj/item/weapon/gun/energy/wand/teleport(src)
	new /obj/item/weapon/gun/energy/wand/force(src)
	new /obj/item/weapon/gun/energy/wand/animation(src)

/obj/item/weapon/storage/belt/mining
	name = "explorer's belt"
	desc = "A versatile chest rig, cherished by miners and hunters alike."
	icon_state = "explorer"
	item_state = "explorer"
	storage_slots = 9
	w_class = 4
	max_w_class = 4 //Pickaxes are big.
	can_hold = list(/obj/item/weapon/crowbar,
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/wrench,
		/obj/item/weapon/resonator,
		/obj/item/weapon/oreportal,
		/obj/item/weapon/oremagnet,
		/obj/item/weapon/plastique/seismic,
		/obj/item/weapon/extraction_pack,
		/obj/item/weapon/ore_radar,
		/obj/item/device/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/stack/flag,
		/obj/item/device/wormhole_jaunter,
		/obj/item/device/analyzer,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/device/radio,
		/obj/item/clothing/gloves,
		/obj/item/clothing/glasses/material,
		/obj/item/weapon/pickaxe,
		/obj/item/weapon/shovel,
		/obj/item/stack/material/animalhide,
		/obj/item/weapon/flame/lighter,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/reagent_containers/food/drinks/bottle,
		/obj/item/stack/medical,
		/obj/item/weapon/reagent_containers/hypospray,
		/obj/item/device/gps,
		/obj/item/weapon/storage/bag/ore,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/weapon/ore,
		/obj/item/weapon/reagent_containers/food/drinks,
		/obj/item/weapon/storage/bag/plants,
		/obj/item/warp_core,
		/obj/item/weapon/extraction_pack,
		/obj/item/weapon/rrf,
		/obj/item/weapon/gun/custom_ka
		)

/obj/item/weapon/storage/belt/hydro
	name = "hydrobelt"
	desc = "A utility belt to store and provide easy access to your floral utilities."
	icon_state = "growbelt"
	item_state = "growbelt"
	storage_slots = 9
	w_class = 3
	max_w_class = 4
	can_hold = list(
		/obj/item/weapon/reagent_containers/glass,
		/obj/item/weapon/grenade/chem_grenade, //weed killer grenades mostly, or water-pottassium if you grow the bannanas!
		/obj/item/weapon/bee_smoker, //will this ever get used? Probally not.
		/obj/item/weapon/plantspray/pests,
		/obj/item/weapon/storage/bag/plants,
		/obj/item/weapon/reagent_containers/food/snacks/grown,
		/obj/item/seeds,
		/obj/item/weapon/grown,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/reagent_containers/spray, //includes if you ever wish to get a spraybottle full of other chemicals, Like water
		/obj/item/device/analyzer/plant_analyzer,
		/obj/item/clothing/gloves/botanic_leather,
		)

/obj/item/weapon/storage/belt/hydro/full/fill()
	..()
	new /obj/item/weapon/plantspray/pests(src)
	new /obj/item/weapon/material/minihoe(src)
	new /obj/item/weapon/storage/bag/plants(src)
	new /obj/item/clothing/gloves/botanic_leather(src)
	new /obj/item/device/analyzer/plant_analyzer(src)
	new /obj/item/weapon/material/hatchet(src)
	new /obj/item/weapon/reagent_containers/glass/fertilizer/rh(src)
	new /obj/item/weapon/reagent_containers/spray/plantbgone(src)
	new /obj/item/weapon/wirecutters/clippers(src)

/obj/item/weapon/storage/belt/bandolier
	name = "bandolier"
	desc = "A pocketed belt designated to hold shotgun shells."
	icon_state = "bandolier"
	item_state = "bandolier"
	can_hold = list(/obj/item/ammo_casing/shotgun)
	storage_slots = 16

/obj/item/weapon/storage/belt/fannypack
	name = "leather fannypack"
	desc = "A dorky fannypack for keeping small items in."
	icon_state = "fannypack_leather"
	item_state = "fannypack_leather"
	max_w_class = 2
	storage_slots = null
	max_storage_space = 8

/obj/item/weapon/storage/belt/fannypack/black
 	name = "black fannypack"
 	icon_state = "fannypack_black"
 	item_state = "fannypack_black"

/obj/item/weapon/storage/belt/fannypack/blue
 	name = "blue fannypack"
 	icon_state = "fannypack_blue"
 	item_state = "fannypack_blue"

/obj/item/weapon/storage/belt/fannypack/cyan
 	name = "cyan fannypack"
 	icon_state = "fannypack_cyan"
 	item_state = "fannypack_cyan"

/obj/item/weapon/storage/belt/fannypack/green
 	name = "green fannypack"
 	icon_state = "fannypack_green"
 	item_state = "fannypack_green"

/obj/item/weapon/storage/belt/fannypack/orange
 	name = "orange fannypack"
 	icon_state = "fannypack_orange"
 	item_state = "fannypack_orange"

/obj/item/weapon/storage/belt/fannypack/purple
 	name = "purple fannypack"
 	icon_state = "fannypack_purple"
 	item_state = "fannypack_purple"

/obj/item/weapon/storage/belt/fannypack/red
 	name = "red fannypack"
 	icon_state = "fannypack_red"
 	item_state = "fannypack_red"

/obj/item/weapon/storage/belt/fannypack/white
 	name = "white fannypack"
 	icon_state = "fannypack_white"
 	item_state = "fannypack_white"

/obj/item/weapon/storage/belt/fannypack/yellow
 	name = "yellow fannypack"
 	icon_state = "fannypack_yellow"
 	item_state = "fannypack_yellow"
