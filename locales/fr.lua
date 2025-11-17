local Translations = {
    error = {
        not_in_range = 'Trop loin de la mairie',
        not_enough_money = 'Vous n\'avez pas assez d\'argent',
        already_added = 'Le poste est déjà ajouté',
        jobNotAvailable = 'Ce poste n\'est pas disponible dans cette mairie',
        no_perms_driving_license = 'Vous n\'avez pas la permission de délivrer un permis de conduire',
        player_not_online = 'Joueur non connecté',
    },
    success = {
        recived_license = 'Vous avez reçu votre %{value} pour 50$',
        passed_driving_test = 'Vous avez réussi l\'examen de conduite ! Vous pouvez maintenant récupérer votre permis à la mairie.',
        granted_license = 'Le joueur a reçu l\'accès à un permis de conduire',
    },
    info = {
        cityHall = {
            header = 'Mairie',
            idHead = 'Cartes d\'identité',
            idDesc = 'Obtenez vos cartes d\'identité',
            idsHead = 'Cartes d\'identité',
            jobCenterHead = 'Centre d\'emploi',
            jobCenterDesc = 'Postuler pour un emploi',
            apply_job = 'Postuler pour %{job}',
        },
        interactions = {
            openCity = 'Ouvrir la mairie',
            openDriving = 'Postuler pour l\'examen de conduite',
        },
        new_job_app = 'Votre candidature a été envoyée au patron de (%{job})',
        bilp_text = 'Services municipaux',
        city_services_menu = '~g~E~w~ - Menu des services municipaux',
        id_card = 'Carte d\'identité',
        driver_license = 'Permis de conduire',
        weaponlicense = 'Permis d\'armes',
        new_job = 'Félicitations pour votre nouveau poste ! (%{job})',
        driver_class = 'Permis de conduire Classe C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Merci d\'avoir postulé chez %{job}.",
        jobAppMsg = "Bonjour %{gender} %{lastname}<br /><br />%{job} a reçu votre candidature.<br /><br />Le patron étudie votre demande et vous contactera pour un entretien dès que possible.<br /><br />Encore merci pour votre candidature.",
        mr = 'M.',
        mrs = 'Mme',
        sender = 'Municipalité',
        subject = 'Demande de cours de conduite',
        message = "Bonjour %{gender} %{lastname}<br /><br />Nous venons de recevoir un message indiquant que quelqu\'un souhaite prendre des cours de conduite<br />Si vous êtes disposé à enseigner, veuillez nous contacter :<br />Nom : <strong>%{firstname} %{lastname}</strong><br />Numéro de téléphone : <strong>%{phone}</strong><br/><br/>Cordialement,<br />Municipalité Los Santos",
        driving_school_await_contact = 'Un e-mail a été envoyé aux auto-écoles et vous serez contacté lorsqu\'elles seront disponibles',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})