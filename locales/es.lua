local Translations = {
    error = {
        not_in_range = 'Demasiado lejos del ayuntamiento',
        not_enough_money = 'No tienes suficiente dinero',
        already_added = 'El trabajo ya está añadido',
        jobNotAvailable = 'Este trabajo no está disponible en este ayuntamiento',
        no_perms_driving_license = 'No tienes permisos para dar un permiso de conducir',
        player_not_online = 'Jugador no está en línea',
    },
    success = {
        recived_license = 'Has recibido tu %{value} por $50',
        passed_driving_test = '¡Has aprobado la prueba de conducción! Ahora puedes recoger tu licencia en el ayuntamiento.',
        granted_license = 'El jugador ha recibido acceso a una licencia de conducir',
    },
    info = {
        cityHall = {
            header = 'Ayuntamiento',
            idHead = 'Tarjetas de identificación',
            idDesc = 'Obtén tus tarjetas de identificación',
            idsHead = 'Tarjetas de identidad',
            jobCenterHead = 'Centro de empleo',
            jobCenterDesc = 'Solicitar un trabajo',
            apply_job = 'Solicitar %{job}',
        },
        interactions = {
            openCity = 'Abrir Ayuntamiento',
            openDriving = 'Solicitar prueba de conducir',
        },
        new_job_app = 'Tu solicitud fue enviada al jefe de (%{job})',
        bilp_text = 'Servicios de la ciudad',
        city_services_menu = '~g~E~w~ - Menú de servicios de la ciudad',
        id_card = 'Documento de identidad',
        driver_license = 'Permiso de conducir',
        weaponlicense = 'Licencia de armas',
        new_job = '¡Felicidades por tu nuevo trabajo! (%{job})',
        driver_class = 'Licencia de conducir Clase C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Gracias por solicitar %{job}.",
        jobAppMsg = "Hola %{gender} %{lastname}<br /><br />%{job} ha recibido tu solicitud.<br /><br />El jefe está revisando tu petición y se pondrá en contacto contigo para una entrevista lo antes posible.<br /><br />Una vez más, gracias por tu solicitud.",
        mr = 'Sr',
        mrs = 'Sra',
        sender = 'Municipio',
        subject = 'Solicitud de clases de conducción',
        message = "Hola %{gender} %{lastname}<br /><br />Acabamos de recibir un mensaje de que alguien quiere tomar clases de conducción<br />Si estás dispuesto a enseñar, por favor contáctanos:<br />Nombre: <strong>%{firstname} %{lastname}</strong><br />Número de teléfono: <strong>%{phone}</strong><br/><br/>Saludos cordiales,<br />Municipio Los Santos",
        driving_school_await_contact = 'Se ha enviado un correo a las autoescuelas y te contactarán cuando estén disponibles',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})