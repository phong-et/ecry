import 'dart:math';

enum typeCalendar { solar, lunar }

class ECRY {
  static const FINE_MONTHS_TEN_DAYS = [280, 281, 282, 283, 284];
  static const Map<typeCalendar, List<List>> EVENTS = {
    typeCalendar.solar: [
      ["1/1", "Tết Dương lịch"],
      ["14/2", "Lễ tình nhân (Valentine)"],
      ["27/2", "Ngày thầy thuốc Việt Nam"],
      ["8/3", "Ngày Quốc tế Phụ nữ"],
      ["26/3", "Ngày thành lập Đoàn TNCS Hồ Chí Minh"],
      ["1/4", "Ngày Cá tháng Tư"],
      ["30/4", "Ngày giải phóng miền Nam"],
      ["1/5", "Ngày Quốc tế Lao động"],
      ["7/5", "Ngày chiến thắng Điện Biên Phủ"],
      ["13/5", "Ngày của mẹ"],
      ["19/5", "Ngày sinh chủ tịch Hồ Chí Minh"],
      ["1/6", "Ngày Quốc tế thiếu nhi"],
      ["17/6", "Ngày của cha"],
      ["21/6", "Ngày báo chí Việt Nam"],
      ["28/6", "Ngày gia đình Việt Nam"],
      ["11/7", "Ngày dân số thế giới"],
      ["27/7", "Ngày Thương binh liệt sĩ"],
      ["28/7", "Ngày thành lập công đoàn Việt Nam"],
      ["19/8", "Ngày tổng khởi nghĩa"],
      ["2/9", "Ngày Quốc Khánh"],
      ["10/9", "Ngày thành lập Mặt trận Tổ quốc Việt Nam"],
      ["1/10", "Ngày quốc tế người cao tuổi"],
      ["10/10", "Ngày giải phóng thủ đô"],
      ["13/10", "Ngày doanh nhân Việt Nam"],
      ["20/10", "Ngày Phụ nữ Việt Nam"],
      ["31/10", "Ngày Hallowen"],
      ["9/11", "Ngày pháp luật Việt Nam"],
      ["20/11", "Ngày Nhà giáo Việt Nam"],
      ["23/11", "Ngày thành lập Hội chữ thập đỏ Việt Nam"],
      ["1/12", "Ngày thế giới phòng chống AIDS"],
      ["19/12", "Ngày toàn quốc kháng chiến"],
      ["24/12", "Ngày lễ Giáng sinh"],
      ["22/12", "Ngày thành lập quân đội nhân dân Việt Nam"]
    ],
    typeCalendar.lunar: [
      ["1/1", "Tết Nguyên Đán"],
      ["15/1", "Tết Nguyên Tiêu (Lễ Thượng Nguyên)"],
      ["3/3", "Tết Hàn Thực"],
      ["10/3", "Giỗ Tổ Hùng Vương"],
      ["15/4", "Lễ Phật Đản"],
      ["5/5", "Tết Đoan Ngọ"],
      ["15/7", "Lễ Vu Lan"],
      ["15/8", "Tết Trung Thu"],
      ["9/9", "Tết Trùng Cửu"],
      ["10/10", "Tết Thường Tân"],
      ["15/10", "Tết Hạ Nguyên"],
      ["23/12", "Tiễn Táo Quân về trời"]
    ]
  };
  Map<String, dynamic> findEventCreateYouInSolarCalendar(DateTime birthday) {
    List<int> quantityOfDay = [];
    DateTime fuckingDate = findFuckingDate(birthday);
    for (var event in EVENTS[typeCalendar.solar]) {
      List<String> strEvent = event[0].split("/");
      int day = int.parse(strEvent[0]), month = int.parse(strEvent[1]);
      DateTime eventFuckingDate = DateTime(fuckingDate.year, month, day);
      //print('eventFuckingDate: $eventFuckingDate');
      //print('fuckingDate: $fuckingDate');
      int diff = fuckingDate.difference(eventFuckingDate).inDays.abs();
      //print('diff: $diff');
      quantityOfDay.add(diff);
    }
    //print(quantityOfDay);
    int minDiff = quantityOfDay.reduce(min);
    int indexEventMinDiff =
        quantityOfDay.indexWhere((quantity) => quantity == minDiff);
    //print(EVENTS[typeCalendar.solar][indexEventMinDiff][1]);

    print('''
      fuckingDate: $fuckingDate
      bornDate: $birthday
      $quantityOfDay
      minDiff: $minDiff
      indexEventMinDiff: $indexEventMinDiff
      Event Name: ${EVENTS[typeCalendar.solar][indexEventMinDiff][1]}
    ''');
    return {"minDiff": minDiff,"indexEventMinDiff": indexEventMinDiff};
  }

  Map<String, dynamic> findEventCreateYouInLunarCalendar(DateTime birthday) {
    return {"minDiff": 9999, "indexEventMinDiff": 0};
  }

  DateTime findFuckingDate(DateTime birthday) {
    return birthday
        .subtract(Duration(days: FINE_MONTHS_TEN_DAYS[(Random().nextInt(3))]));
  }

  void findEventCreateYou(DateTime birthday) {
    var solar = findEventCreateYouInSolarCalendar(birthday);
    var lunar = findEventCreateYouInLunarCalendar(birthday);
    if (solar["minDiff"] > lunar['minDiff'])
      print(EVENTS[typeCalendar.lunar][lunar["indexEventMinDiff"]][1]);
    else
      print(EVENTS[typeCalendar.solar][solar["indexEventMinDiff"]][1]);
  }
}

main() {
  ECRY().findEventCreateYou(DateTime(1989, 07, 10));
}
