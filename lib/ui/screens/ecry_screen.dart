import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EcryScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EcryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
              color: Colors.green,
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1950, 1, 1),
                    maxTime: DateTime(2019, 6, 7),
                    theme: DatePickerTheme(
                        headerColor: Colors.green,
                        backgroundColor: Colors.blue,
                        itemStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        doneStyle: TextStyle(color: Colors.white, fontSize: 16)), onChanged: (date) {
                  print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Text(
                'Select your birthday',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
