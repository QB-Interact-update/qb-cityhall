local Translations = {
    error = {
        not_in_range = 'Muito longe da prefeitura',
        not_enough_money = 'Você não tem dinheiro suficiente',
        already_added = 'O emprego já foi adicionado',
        jobNotAvailable = 'Este emprego não está disponível nesta prefeitura',
        no_perms_driving_license = 'Você não tem permissão para conceder carteira de motorista',
        player_not_online = 'Jogador não está online',
    },
    success = {
        recived_license = 'Você recebeu seu %{value} por $50',
        passed_driving_test = 'Você passou no teste de direção! Agora pode retirar sua carteira na prefeitura.',
        granted_license = 'O jogador recebeu acesso a uma carteira de motorista',
    },
    info = {
        cityHall = {
            header = 'Prefeitura',
            idHead = 'Documentos de identidade',
            idDesc = 'Pegue seus documentos de identidade',
            idsHead = 'Cartões de identidade',
            jobCenterHead = 'Centro de Emprego',
            jobCenterDesc = 'Candidate-se a um emprego',
            apply_job = 'Candidatar-se a %{job}',
        },
        interactions = {
            openCity = 'Abrir Prefeitura',
            openDriving = 'Solicitar teste de direção',
        },
        new_job_app = 'Sua inscrição foi enviada ao chefe de (%{job})',
        bilp_text = 'Serviços da cidade',
        city_services_menu = '~g~E~w~ - Menu de Serviços da Cidade',
        id_card = 'Documento de identidade',
        driver_license = 'Carteira de motorista',
        weaponlicense = 'Licença de armas',
        new_job = 'Parabéns pelo seu novo emprego! (%{job})',
        driver_class = 'Carteira de motorista Classe C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Obrigado por se candidatar a %{job}.",
        jobAppMsg = "Olá %{gender} %{lastname}<br /><br />%{job} recebeu sua inscrição.<br /><br />O chefe está analisando sua solicitação e entrará em contato para uma entrevista assim que possível.<br /><br />Mais uma vez, obrigado pela sua inscrição.",
        mr = 'Sr',
        mrs = 'Sra',
        sender = 'Município',
        subject = 'Pedido de aulas de direção',
        message = "Olá %{gender} %{lastname}<br /><br />Acabamos de receber uma mensagem de que alguém quer fazer aulas de direção<br />Se você estiver disposto a ensinar, por favor entre em contato:<br />Nome: <strong>%{firstname} %{lastname}</strong><br />Número de telefone: <strong>%{phone}</strong><br/><br/>Atenciosamente,<br />Município Los Santos",
        driving_school_await_contact = 'Um e-mail foi enviado às autoescolas, e você será contatado quando estiverem disponíveis',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})