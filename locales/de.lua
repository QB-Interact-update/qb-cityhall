local Translations = {
    error = {
        not_in_range = 'Zu weit vom Rathaus entfernt',
        not_enough_money = 'Du hast nicht genug Geld',
        already_added = 'Job wurde bereits hinzugefügt',
        jobNotAvailable = 'Dieser Job ist in diesem Rathaus nicht verfügbar',
        no_perms_driving_license = 'Du hast keine Berechtigung, einen Führerschein auszustellen',
        player_not_online = 'Spieler ist nicht online',
    },
    success = {
        recived_license = 'Du hast deine %{value} für $50 erhalten',
        passed_driving_test = 'Du hast die Fahrprüfung bestanden! Du kannst deinen Führerschein jetzt im Rathaus abholen.',
        granted_license = 'Spieler hat Zugang zu einem Führerschein erhalten',
    },
    info = {
        cityHall = {
            header = 'Rathaus',
            idHead = 'Ausweise',
            idDesc = 'Hol dir deine Ausweise',
            idsHead = 'Identitätskarten',
            jobCenterHead = 'Jobcenter',
            jobCenterDesc = 'Bewirb dich für einen Job',
            apply_job = 'Für %{job} bewerben',
        },
        interactions = {
            openCity = 'Rathaus öffnen',
            openDriving = 'Für Fahrprüfung anmelden',
        },
        new_job_app = 'Deine Bewerbung wurde an den Chef von (%{job}) gesendet',
        bilp_text = 'Städtische Dienste',
        city_services_menu = '~g~E~w~ - Städtische Dienstemenü',
        id_card = 'Ausweis',
        driver_license = 'Führerschein',
        weaponlicense = 'Waffenschein',
        new_job = 'Glückwunsch zu deinem neuen Job! (%{job})',
        driver_class = 'Führerschein Klasse C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Vielen Dank für deine Bewerbung bei %{job}.",
        jobAppMsg = "Hallo %{gender} %{lastname}<br /><br />%{job} hat deine Bewerbung erhalten.<br /><br />Der Chef prüft deine Anfrage und wird sich baldmöglichst für ein Vorstellungsgespräch bei dir melden.<br /><br />Nochmals vielen Dank für deine Bewerbung.",
        mr = 'Herr',
        mrs = 'Frau',
        sender = 'Gemeinde',
        subject = 'Anfrage für Fahrstunden',
        message = "Hallo %{gender} %{lastname}<br /><br />Wir haben gerade eine Nachricht erhalten, dass jemand Fahrstunden nehmen möchte<br />Wenn du bereit bist zu unterrichten, kontaktiere uns bitte:<br />Name: <strong>%{firstname} %{lastname}</strong><br />Telefonnummer: <strong>%{phone}</strong><br/><br/>Mit freundlichen Grüßen,<br />Gemeinde Los Santos",
        driving_school_await_contact = 'Eine E-Mail wurde an Fahrschulen gesendet, und du wirst kontaktiert, wenn sie verfügbar sind',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})