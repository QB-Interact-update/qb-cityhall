local Translations = {
    error = {
        not_in_range = 'Quá xa tòa thị chính',
        not_enough_money = 'Bạn không có đủ tiền',
        already_added = 'Công việc đã được thêm',
        jobNotAvailable = 'Công việc này không có sẵn tại tòa thị chính này',
        no_perms_driving_license = 'Bạn không có quyền cấp giấy phép lái xe',
        player_not_online = 'Người chơi không trực tuyến',
    },
    success = {
        recived_license = 'Bạn đã nhận được %{value} với $50',
        passed_driving_test = 'Bạn đã vượt qua bài kiểm tra lái xe! Bạn có thể nhận bằng lái tại tòa thị chính.',
        granted_license = 'Người chơi đã được cấp quyền truy cập bằng lái',
    },
    info = {
        cityHall = {
            header = 'Tòa thị chính',
            idHead = 'Thẻ ID',
            idDesc = 'Lấy thẻ ID của bạn',
            idsHead = 'Thẻ nhận dạng',
            jobCenterHead = 'Trung tâm việc làm',
            jobCenterDesc = 'Ứng tuyển công việc',
            apply_job = 'Ứng tuyển %{job}',
        },
        interactions = {
            openCity = 'Mở Tòa Thị Chính',
            openDriving = 'Ứng tuyển bài kiểm tra lái xe',
        },
        new_job_app = 'Đơn của bạn đã được gửi tới sếp của (%{job})',
        bilp_text = 'Dịch vụ thành phố',
        city_services_menu = '~g~E~w~ - Menu Dịch vụ Thành phố',
        id_card = 'Thẻ ID',
        driver_license = 'Bằng lái',
        weaponlicense = 'Giấy phép vũ khí',
        new_job = 'Chúc mừng với công việc mới! (%{job})',
        driver_class = 'Bằng lái Hạng C',
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Cảm ơn bạn đã ứng tuyển %{job}.",
        jobAppMsg = "Xin chào %{gender} %{lastname}<br /><br />%{job} đã nhận được hồ sơ của bạn.<br /><br />Người phụ trách đang xem xét yêu cầu và sẽ liên hệ với bạn để phỏng vấn sớm nhất có thể.<br /><br />Một lần nữa cảm ơn bạn đã ứng tuyển.",
        mr = 'Ông',
        mrs = 'Bà',
        sender = 'Thị trấn',
        subject = 'Yêu cầu học lái',
        message = "Xin chào %{gender} %{lastname}<br /><br />Chúng tôi vừa nhận được thông báo rằng có người muốn học lái xe<br />Nếu bạn sẵn sàng dạy, vui lòng liên hệ:<br />Tên: <strong>%{firstname} %{lastname}</strong><br />Số điện thoại: <strong>%{phone}</strong><br/><br/>Trân trọng,<br />Thị trấn Los Santos",
        driving_school_await_contact = 'Đã gửi email tới các trường lái xe, bạn sẽ được liên hệ khi họ có sẵn',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})