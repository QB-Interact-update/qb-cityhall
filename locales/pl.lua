local Translations = {
    error = {
        not_in_range = 'Za daleko od ratusza',
        not_enough_money = 'Nie masz wystarczająco pieniędzy',
        already_added = 'Praca została już dodana',
        jobNotAvailable = 'Ta praca nie jest dostępna w tym ratuszu',
        no_perms_driving_license = 'Nie masz uprawnień do wydawania prawa jazdy',
        player_not_online = 'Gracz nie jest online',
    },
    success = {
        recived_license = 'Otrzymałeś swoje %{value} za 50$',
        passed_driving_test = 'Zdałeś egzamin na prawo jazdy! Możesz teraz odebrać swoje prawo jazdy w ratuszu.',
        granted_license = 'Gracz otrzymał dostęp do prawa jazdy',
    },
    info = {
        cityHall = {
            header = 'Ratusz',
            idHead = 'Dowody tożsamości',
            idDesc = 'Odbierz swoje dowody',
            idsHead = 'Karty tożsamości',
            jobCenterHead = 'Centrum pracy',
            jobCenterDesc = 'Aplikuj o pracę',
            apply_job = 'Aplikuj na %{job}',
        },
        interactions = {
            openCity = 'Otwórz ratusz',
            openDriving = 'Złóż wniosek o egzamin na prawo jazdy',
        },
        new_job_app = 'Twoja aplikacja została wysłana do szefa (%{job})',
        bilp_text = 'Usługi miejskie',
        city_services_menu = '~g~E~w~ - Menu usług miejskich',
        id_card = 'Dowód tożsamości',
        driver_license = 'Prawo jazdy',
        weaponlicense = 'Licencja na broń',
        new_job = 'Gratulacje z nową pracą! (%{job})',
        driver_class = 'Prawo jazdy kategorii C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Dziękujemy za aplikowanie do %{job}.",
        jobAppMsg = "Cześć %{gender} %{lastname}<br /><br />%{job} otrzymał twoją aplikację.<br /><br />Szef rozważa twoją prośbę i skontaktuje się z tobą w celu rozmowy kwalifikacyjnej w najbliższym możliwym terminie.<br /><br />Jeszcze raz dziękujemy za aplikację.",
        mr = 'Pan',
        mrs = 'Pani',
        sender = 'Gmina',
        subject = 'Prośba o lekcje jazdy',
        message = "Cześć %{gender} %{lastname}<br /><br />Właśnie otrzymaliśmy wiadomość, że ktoś chce brać lekcje jazdy<br />Jeśli chcesz uczyć, skontaktuj się z nami:<br />Imię: <strong>%{firstname} %{lastname}</strong><br />Numer telefonu: <strong>%{phone}</strong><br/><br/>Pozdrawiamy,<br />Gmina Los Santos",
        driving_school_await_contact = 'E-mail został wysłany do szkół jazdy, skontaktują się z Tobą, gdy będą dostępne',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})