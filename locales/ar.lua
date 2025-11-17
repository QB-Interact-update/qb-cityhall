local Translations = {
    error = {
        not_in_range = 'بعيد جدًا عن مبنى البلدية',
        not_enough_money = 'ليس لديك ما يكفي من المال',
        already_added = 'الوظيفة مُضافة بالفعل',
        jobNotAvailable = 'هذه الوظيفة غير متوفرة في هذا المقر',
        no_perms_driving_license = 'ليس لديك الإذن لمنح رخصة قيادة',
        player_not_online = 'اللاعب غير متصل',
    },
    success = {
        recived_license = 'لقد تلقيت %{value} مقابل 50$',
        passed_driving_test = 'لقد اجتزت اختبار القيادة! يمكنك الآن استلام رخصتك من مبنى البلدية.',
        granted_license = 'تم منح اللاعب إمكانية الوصول إلى رخصة قيادة',
    },
    info = {
        cityHall = {
            header = 'مبنى البلدية',
            idHead = 'بطاقات الهوية',
            idDesc = 'احصل على بطاقات هويتك',
            idsHead = 'بطاقات الهوية',
            jobCenterHead = 'مركز التوظيف',
            jobCenterDesc = 'قدّم طلبًا لوظيفة',
            apply_job = 'التقدّم لوظيفة %{job}',
        },
        interactions = {
            openCity = 'فتح مبنى البلدية',
            openDriving = 'التقدّم لاختبار القيادة',
        },
        new_job_app = 'تم إرسال طلبك إلى مدير (%{job})',
        bilp_text = 'خدمات المدينة',
        city_services_menu = '~g~E~w~ - قائمة خدمات المدينة',
        id_card = 'بطاقة هوية',
        driver_license = 'رخصة قيادة',
        weaponlicense = 'رخصة سلاح',
        new_job = 'تهانينا على وظيفتك الجديدة! (%{job})',
        driver_class = 'رخصة قيادة الفئة C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "شكرًا لتقديم طلبك إلى %{job}.",
        jobAppMsg = "مرحبًا %{gender} %{lastname}<br /><br />لقد استلم %{job} طلبك.<br /><br />المدير ينظر في طلبك وسيتواصل معك لإجراء مقابلة في أقرب وقت ممكن.<br /><br />شكرًا مرة أخرى.",
        mr = 'السيد',
        mrs = 'السيدة',
        sender = 'البلدية',
        subject = 'طلب دروس قيادة',
        message = "مرحبًا %{gender} %{lastname}<br /><br />لقد تلقينا للتو رسالة تفيد أن شخصًا ما يريد أخذ دروس قيادة<br />إذا كنت مستعدًا للتدريس، يرجى الاتصال بنا:<br />الاسم: <strong>%{firstname} %{lastname}</strong><br />رقم الهاتف: <strong>%{phone}</strong><br/><br/>مع أطيب التحيات,<br />بلدية لوس سانتوس",
        driving_school_await_contact = 'تم إرسال بريد إلكتروني إلى مدارس القيادة، وسيتم الاتصال بك عندما تكون متاحة',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})