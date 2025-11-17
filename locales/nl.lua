local Translations = {
    error = {
        not_in_range = 'Te ver van het stadhuis',
        not_enough_money = 'Je hebt niet genoeg geld',
        already_added = 'Baan is al toegevoegd',
        jobNotAvailable = 'Deze baan is niet beschikbaar bij dit stadhuis',
        no_perms_driving_license = 'Je hebt geen toestemming om een rijbewijs uit te geven',
        player_not_online = 'Speler is niet online',
    },
    success = {
        recived_license = 'Je hebt je %{value} ontvangen voor $50',
        passed_driving_test = 'Je bent geslaagd voor de rijtest! Je kunt je rijbewijs nu ophalen bij het stadhuis.',
        granted_license = 'Speler heeft toegang tot een rijbewijs gekregen',
    },
    info = {
        cityHall = {
            header = 'Stadhuis',
            idHead = 'ID-kaarten',
            idDesc = 'Haal je ID-kaarten',
            idsHead = 'Identiteitskaarten',
            jobCenterHead = 'Banenbureau',
            jobCenterDesc = 'Solliciteer voor een baan',
            apply_job = 'Solliciteer voor %{job}',
        },
        interactions = {
            openCity = 'Open stadhuis',
            openDriving = 'Solliciteer voor rijtest',
        },
        new_job_app = 'Je sollicitatie is verzonden naar de baas van (%{job})',
        bilp_text = 'Stadsdiensten',
        city_services_menu = '~g~E~w~ - Stadsdiensten Menu',
        id_card = 'ID-kaart',
        driver_license = 'Rijbewijs',
        weaponlicense = 'Wapenvergunning',
        new_job = 'Gefeliciteerd met je nieuwe baan! (%{job})',
        driver_class = 'Rijbewijs Klasse C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Bedankt voor je sollicitatie bij %{job}.",
        jobAppMsg = "Hallo %{gender} %{lastname}<br /><br />%{job} heeft je sollicitatie ontvangen.<br /><br />De baas bekijkt je aanvraag en neemt contact met je op voor een gesprek zodra dat mogelijk is.<br /><br />Nogmaals bedankt voor je sollicitatie.",
        mr = 'Dhr',
        mrs = 'Mevr',
        sender = 'Gemeente',
        subject = 'Aanvraag rijlessen',
        message = "Hallo %{gender} %{lastname}<br /><br />We hebben net een bericht ontvangen dat iemand rijlessen wil nemen<br />Als je bereid bent les te geven, neem dan contact op:<br />Naam: <strong>%{firstname} %{lastname}</strong><br />Telefoonnummer: <strong>%{phone}</strong><br/><br/>Met vriendelijke groet,<br />Gemeente Los Santos",
        driving_school_await_contact = 'Er is een e-mail gestuurd naar rijscholen en je wordt gecontacteerd wanneer ze beschikbaar zijn',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})