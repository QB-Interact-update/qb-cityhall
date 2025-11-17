local Translations = {
    error = {
        not_in_range = 'Belediye binasından çok uzaktasın',
        not_enough_money = 'Yeterli paran yok',
        already_added = 'İş zaten eklendi',
        jobNotAvailable = 'Bu iş bu belediyede mevcut değil',
        no_perms_driving_license = 'Sürücü belgesi verme yetkiniz yok',
        player_not_online = 'Oyuncu çevrimiçi değil',
    },
    success = {
        recived_license = '%{value} için $50 karşılığında belgenizi aldınız',
        passed_driving_test = 'Sürücü sınavını geçtiniz! Şimdi belediyeden ehliyetinizi alabilirsiniz.',
        granted_license = 'Oyuncuya sürücü belgesi verildi',
    },
    info = {
        cityHall = {
            header = 'Belediye',
            idHead = 'Kimlik Kartları',
            idDesc = 'Kimlik Kartlarınızı Alın',
            idsHead = 'Kimlik Kartları',
            jobCenterHead = 'İş Merkezi',
            jobCenterDesc = 'Bir işe başvur',
            apply_job = '%{job} için başvur',
        },
        interactions = {
            openCity = 'Belediyeyi Aç',
            openDriving = 'Sürücü Sınavına Başvur',
        },
        new_job_app = 'Başvurunuz (%{job}) patronuna gönderildi',
        bilp_text = 'Belediye Hizmetleri',
        city_services_menu = '~g~E~w~ - Belediye Hizmetleri Menüsü',
        id_card = 'Kimlik Kartı',
        driver_license = 'Sürücü Belgesi',
        weaponlicense = 'Silah Ruhsatı',
        new_job = 'Yeni işin için tebrikler! (%{job})',
        driver_class = 'C Sınıfı Sürücü Belgesi',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "%{job} için başvurunuz için teşekkürler.",
        jobAppMsg = "Merhaba %{gender} %{lastname}<br /><br />%{job} başvurunuzu aldı.<br /><br />Patron isteğinizi inceliyor ve müsait olduğunda görüşme için sizinle iletişime geçecek.<br /><br />Tekrar teşekkürler.",
        mr = 'Bay',
        mrs = 'Bayan',
        sender = 'Belediye',
        subject = 'Sürüş dersleri talebi',
        message = "Merhaba %{gender} %{lastname}<br /><br />Sürücü kurslarına bir e-posta gönderildi ve müsait olduklarında sizinle iletişime geçilecektir.<br />Eğer öğretmeyi kabul ediyorsanız lütfen iletişime geçin:<br />İsim: <strong>%{firstname} %{lastname}</strong><br />Telefon Numarası: <strong>%{phone}</strong><br/><br/>Saygılarımızla,<br />Belediye Los Santos",
        driving_school_await_contact = 'Sürücü kurslarına bir e-posta gönderildi ve müsait olduklarında sizinle iletişime geçilecek',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})