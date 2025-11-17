local Translations = {
    error = {
        not_in_range = 'Too far from the city hall',
        not_enough_money = 'You don\'t have enough money',
        already_added = 'Job Is Already Added',
        jobNotAvailable = 'This job is not available at this city hall',
        no_perms_driving_license = 'You do not have permissions to give a drivers license',
        player_not_online = 'Player Not Online',
    },
    success = {
        recived_license = 'You have received your %{value} for $50',
        passed_driving_test = 'You have passed the driving test! You can now pick up your license at the city hall.',
        granted_license = 'Player has been granted access to a driving license',
    },
    info = {
        cityHall = {
            header = 'City Hall',
            idHead = 'ID Cards',
            idDesc = 'Get Your ID Cards',
            idsHead = 'Identity Cards',
            jobCenterHead = 'Job Center',
            jobCenterDesc = 'Apply For A Job',
            apply_job = 'Apply for %{job}',
        },
        interactions = {
            openCity = 'Open City Hall',
            openDriving = 'Apply For Driving Test',
        },
        new_job_app = 'Your application was sent to the boss of (%{job})',
        bilp_text = 'City Services',
        city_services_menu = '~g~E~w~ - City Services Menu',
        id_card = 'ID Card',
        driver_license = 'Drivers License',
        weaponlicense = 'Firearms License',
        new_job = 'Congratulations with your new job! (%{job})',
        driver_class = 'Class C Driver License',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Thank you for applying to %{job}.",
        jobAppMsg = "Hello %{gender} %{lastname}<br /><br />%{job} has received your application.<br /><br />The boss is looking into your request and will reach out to you for an interview at their earliest convenience.<br /><br />Once again, thank you for your application.",
        mr = 'Mr',
        mrs = 'Mrs',
        sender = 'Township',
        subject = 'Driving lessons request',
        message = "Hello %{gender} %{lastname}<br /><br />We have just received a message that someone wants to take driving lessons<br />If you are willing to teach, please contact us:<br />Name: <strong>%{firstname} %{lastname}</strong><br />Phone Number: <strong>%{phone}</strong><br/><br/>Kind regards,<br />Township Los Santos",
        driving_school_await_contact = 'An email has been sent to driving schools, and you will be contacted when they are available',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})