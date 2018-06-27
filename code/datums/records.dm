// Generic data stored in record
/datum/record
    var/id
    var/notes = "No notes found."

/datum/record/proc/Copy(var/datum/copied)
    if(!copied)
        copied = new type()
    for(var/variable in src.vars)
        if(!(variable in SSrecords.excluded_fields))
            if(istype(src.vars[variable], /datum/record) || istype(src.vars[variable], /list))
                copied.vars[variable] = src.vars[variable].Copy()
            else
                copied.vars[variable] = src.vars[variable]
    return copied

// Record for storing general data, data tree top level datum
/datum/record/general
    var/datum/record/medical/medical
    var/datum/record/security/security
    var/name = "New Record"
    var/real_rank = "Unassigned"
    var/rank = "Unassigned"
    var/age = "Unknown"
    var/sex = "Unknown"
    var/fingerprint = "Unknown"
    var/phisical_status = "Active"
    var/medical_status = "Stable"
    var/species = "Unknown"
    var/home_system = "Unknown"
    var/citizenship = "Unknown"
    var/faction = "Unknown"
    var/religion = "Unknown"
    var/ccia_record = "No CCIA records found"
    var/ccia_actions = "No CCIA actions found"
    var/icon/photo_front
    var/icon/photo_side

/datum/record/general/New(var/mob/living/carbon/human/H, var/nid)
    if (!H)
        var/mob/living/carbon/human/dummy = SSmob.get_mannequin("New record")
        photo_front = getFlatIcon(dummy, SOUTH, always_use_defdir = TRUE)
        photo_side = getFlatIcon(dummy, WEST, always_use_defdir = TRUE)
    else
        photo_front = getFlatIcon(H, SOUTH, always_use_defdir = TRUE)
        photo_side = getFlatIcon(H, WEST, always_use_defdir = TRUE)
    if(!nid) nid = generate_record_id()
    id = nid
    if(H)
        name = H.real_name
        real_rank = H.mind.assigned_role
        rank = GetAssignment(H)
        age = H.age
        fingerprint = md5(H.dna.uni_identity)
        sex = H.gender
        species = H.species
        home_system = H.home_system
        citizenship = H.citizenship
        faction = H.personal_faction
        religion = H.religion
        ccia_record = H.ccia_record
        ccia_actions = H.ccia_actions
        if(H.gen_record && !jobban_isbanned(H, "Records"))
            notes = H.gen_record
    medical = new(H, id)
    security = new(H, id)


// Record for locked data
/datum/record/general/locked
    var/nid = ""
    var/enzymes
    var/identity
    var/exploit_record = "No additional information acquired."

/datum/record/general/locked/New(var/mob/living/carbon/human/H)
    // Only init things that aqre needed
    if(H)
        nid = md5("[H.real_name][H.mind.assigned_role]")
        enzymes = H.dna.SE
        identity = H.dna.UI
        if(H.exploit_record && !jobban_isbanned(H, "Records"))
            exploit_record = H.exploit_record

// Record for storing medical data
/datum/record/medical
    var/blood_type = "AB+"
    var/blood_dna = "63920c3ec24b5d57d459b33a2f4d6446"
    var/disabilities = "No disabilities have been declared."
    var/allergies = "No allergies have been detected in this patient."
    var/diseases = "No diseases have been diagnosed at the moment."

/datum/record/medical/New(var/mob/living/carbon/human/H, var/nid)
    if(!nid) nid = generate_record_id()
    id = nid
    if(H)
        blood_type = H.b_type
        blood_dna = H.dna.unique_enzymes
        if(H.med_record && !jobban_isbanned(H, "Records"))
            notes = H.med_record

// Record for storing medical data
/datum/record/security
    var/criminal = "None"
    var/crimes = "There is no crime convictions."
    var/incidents = ""

/datum/record/security/New(var/mob/living/carbon/human/H, var/nid)
    if(!nid) nid = generate_record_id()
    id = nid
    if(H)
        incidents = H.incidents
        if(H.sec_record && !jobban_isbanned(H, "Records"))
            notes = H.sec_record