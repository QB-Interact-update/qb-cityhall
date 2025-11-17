local Translations = {
    error = {
        not_in_range = 'For langt fra rådhuset',
        not_enough_money = 'Du har ikke nok penge',
        already_added = 'Jobbet er allerede tilføjet',
        jobNotAvailable = 'Dette job er ikke tilgængeligt på dette rådhus',
        no_perms_driving_license = 'Du har ikke tilladelse til at udstede kørekort',
        player_not_online = 'Spilleren er ikke online',
    },
    success = {
        recived_license = 'Du har modtaget din %{value} for $50',
        passed_driving_test = 'Du har bestået køreprøven! Du kan nu afhente dit kørekort på rådhuset.',
        granted_license = 'Spilleren har fået adgang til et kørekort',
    },
    info = {
        cityHall = {
            header = 'Rådhus',
            idHead = 'ID-kort',
            idDesc = 'Få dine ID-kort',
            idsHead = 'Identitetskort',
            jobCenterHead = 'Jobcenter',
            jobCenterDesc = 'Ansøg om et job',
            apply_job = 'Ansøg om %{job}',
        },
        interactions = {
            openCity = 'Åbn rådhus',
            openDriving = 'Ansøg om køreprøve',
        },
        new_job_app = 'Din ansøgning blev sendt til chefen for (%{job})',
        bilp_text = 'Byens tjenester',
        city_services_menu = '~g~E~w~ - Byens tjenestemenu',
        id_card = 'ID-kort',
        driver_license = 'Kørekort',
        weaponlicense = 'Våbentilladelse',
        new_job = 'Tillykke med dit nye job! (%{job})',
        driver_class = 'Klasse C kørekort',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Tak for din ansøgning til %{job}.",
        jobAppMsg = "Hej %{gender} %{lastname}<br /><br />%{job} har modtaget din ansøgning.<br /><br />Chefen kigger på din anmodning og kontakter dig for en samtale, så snart det er muligt.<br /><br />Endnu en gang tak for din ansøgning.",
        mr = 'Hr',
        mrs = 'Fru',
        sender = 'Bystyret',
        subject = 'Forespørgsel om køretimer',
        message = "Hej %{gender} %{lastname}<br /><br />Vi har netop modtaget en besked om, at nogen ønsker at tage køretimer<br />Hvis du er villig til at undervise, kontakt venligst:<br />Navn: <strong>%{firstname} %{lastname}</strong><br />Telefonnummer: <strong>%{phone}</strong><br/><br/>Venlig hilsen,<br />Bystyret Los Santos",
        driving_school_await_contact = 'En e-mail er sendt til køreskoler, og du vil blive kontaktet, når de er tilgængelige',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})