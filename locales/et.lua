local Translations = {
    error = {
        not_in_range = 'Liiga kaugel linnavalitsusest',
        not_enough_money = 'Sul ei ole piisavalt raha',
        already_added = 'Töö on juba lisatud',
        jobNotAvailable = 'See töö ei ole selles linnavalitsuses saadaval',
        no_perms_driving_license = 'Sul ei ole õigusi juhiloa väljaandmiseks',
        player_not_online = 'Mängija ei ole võrguühenduses',
    },
    success = {
        recived_license = 'Oled saanud oma %{value} eest $50',
        passed_driving_test = 'Sa sooritasid sõidueksami! Nüüd saad oma juhiloa kätte linnavalitsusest.',
        granted_license = 'Mängijale on antud juurdepääs juhiloale',
    },
    info = {
        cityHall = {
            header = 'Linnavalitsus',
            idHead = 'ID-kaardid',
            idDesc = 'Hangi oma ID-kaardid',
            idsHead = 'Isikutunnistused',
            jobCenterHead = 'Töö keskus',
            jobCenterDesc = 'Kandideeri töökohale',
            apply_job = 'Kandideeri %{job}',
        },
        interactions = {
            openCity = 'Ava linnavalitsus',
            openDriving = 'Kandideeri sõidueksamile',
        },
        new_job_app = 'Sinu avaldus saadeti (%{job}) ülemusele',
        bilp_text = 'Linnateenused',
        city_services_menu = '~g~E~w~ - Linnateenuste menüü',
        id_card = 'ID-kaart',
        driver_license = 'Juhiluba',
        weaponlicense = 'Relvaluba',
        new_job = 'Palju õnne uue töö puhul! (%{job})',
        driver_class = 'C-klassi juhiluba',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Aitäh, et kandideerisid %{job}.",
        jobAppMsg = "Tere %{gender} %{lastname}<br /><br />%{job} on saanud sinu avalduse.<br /><br />Ülemus vaatab sinu taotlust üle ja võtab sinuga varsti ühendust vestluse ajakorrastamiseks.<br /><br />Aitäh veel kord.",
        mr = 'Hr',
        mrs = 'Pr',
        sender = 'Linnavalitsus',
        subject = 'Soov sõiduõpetuse saamiseks',
        message = "Tere %{gender} %{lastname}<br /><br />Meil on äsja saabunud teade, et keegi soovib võtta sõiduõpet<br />Kui oled valmis õpetama, palun võta ühendust:<br />Nimi: <strong>%{firstname} %{lastname}</strong><br />Telefoninumber: <strong>%{phone}</strong><br/><br/>Parimate soovidega,<br />Linnavalitsus Los Santos",
        driving_school_await_contact = 'Sõiduõpetajatele on saadetud e-kiri ja sinuga võetakse ühendust, kui nad on saadaval',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})