local Translations = {
    error = {
        not_in_range = 'Troppo lontano dal municipio',
        not_enough_money = 'Non hai abbastanza soldi',
        already_added = 'Il lavoro è già stato aggiunto',
        jobNotAvailable = 'Questo lavoro non è disponibile in questo municipio',
        no_perms_driving_license = 'Non hai i permessi per rilasciare una patente',
        player_not_online = 'Giocatore non online',
    },
    success = {
        recived_license = 'Hai ricevuto il tuo %{value} per $50',
        passed_driving_test = 'Hai superato l\'esame di guida! Ora puoi ritirare la tua patente al municipio.',
        granted_license = 'Al giocatore è stato concesso l\'accesso a una patente',
    },
    info = {
        cityHall = {
            header = 'Municipio',
            idHead = 'Carte d\'identità',
            idDesc = 'Ottieni le tue carte d\'identità',
            idsHead = 'Schede d\'identità',
            jobCenterHead = 'Centro per l\'impiego',
            jobCenterDesc = 'Candidati per un lavoro',
            apply_job = 'Candidati per %{job}',
        },
        interactions = {
            openCity = 'Apri il municipio',
            openDriving = 'Candidati per l\'esame di guida',
        },
        new_job_app = 'La tua candidatura è stata inviata al capo di (%{job})',
        bilp_text = 'Servizi della città',
        city_services_menu = '~g~E~w~ - Menu servizi cittadini',
        id_card = 'Carta d\'identità',
        driver_license = 'Patente di guida',
        weaponlicense = 'Licenza di armi',
        new_job = 'Congratulazioni per il tuo nuovo lavoro! (%{job})',
        driver_class = 'Patente di guida Classe C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Grazie per aver fatto domanda a %{job}.",
        jobAppMsg = "Ciao %{gender} %{lastname}<br /><br />%{job} ha ricevuto la tua candidatura.<br /><br />Il capo sta esaminando la tua richiesta e ti contatterà per un colloquio appena possibile.<br /><br />Grazie ancora per la tua candidatura.",
        mr = 'Sig',
        mrs = 'Sig.ra',
        sender = 'Municipio',
        subject = 'Richiesta lezioni di guida',
        message = "Ciao %{gender} %{lastname}<br /><br />Abbiamo appena ricevuto un messaggio che qualcuno vuole prendere lezioni di guida<br />Se sei disposto a insegnare, contattaci per favore:<br />Nome: <strong>%{firstname} %{lastname}</strong><br />Numero di telefono: <strong>%{phone}</strong><br/><br/>Cordiali saluti,<br />Municipio Los Santos",
        driving_school_await_contact = 'È stata inviata un\'e-mail alle autoscuole e verrai contattato quando saranno disponibili',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})