import 'package:age_calculator_project/AgeCalculator.dart';
import 'package:flutter/material.dart';
import 'Age_Model.dart';
import 'Duration_Model.dart';

Age userAge = Age();
Duration nextBirthDate = Duration();
DateTime futureDate = DateTime(1900, 10, 1);
DateTime dateOfBirth = DateTime(2022, 6, 1);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    userAge.days = 15;
    userAge.months = 3;
    userAge.years = 21;

    nextBirthDate.days = 29;
    nextBirthDate.months = 7;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          //    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextBuilder(
              text: "تاريخ الميلاد",
              color: Colors.grey,
              size: 20,
            ),
            BirthDateFieldContainer(),
            EmptyBox(),
            TextBuilder(
              text: "تاريخ اليوم",
              color: Colors.grey,
              size: 20,
            ),
            TodayDateFieldContainer(),
            EmptyBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ClaculateButton(), ClearButton()],
            ),
            EmptyBox(),
            TextBuilder(
              text: "العمر هو",
              color: Colors.grey,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ageDaysBox, ageMonthsBox, ageYearsBox],
            ),
            EmptyBox(),
            TextBuilder(
              text: "يوم الميلاد القادم هو",
              color: Colors.grey,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [nextBDDaysBox, nextBDMonthsBox, nextBDYearsBox],
            )
          ],
        ),
      ),
    );
  }
}

DateBox ageDaysBox = DateBox(type: "الأيام", num: userAge.days.toString());
DateBox ageMonthsBox = DateBox(type: "الشهور", num: userAge.months.toString());
DateBox ageYearsBox = DateBox(type: "السنين", num: userAge.years.toString());

DateBox nextBDDaysBox = DateBox(type: "الأيام", num: userAge.days.toString());
DateBox nextBDMonthsBox =
    DateBox(type: "الشهور", num: userAge.months.toString());
DateBox nextBDYearsBox = DateBox(type: "السنين", num: '-');

class BirthDateFieldContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Calendar_icon,
              Flexible(child: BirthDateTextField()),
              // TextBuilder(
              //   text: '08-01-2001',
              //   size: 15,
              //   weight: FontWeight.w400,
              //   color: Colors.black,
              // )
              // SizedBox(
              //   width: 300,
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'Enter a Date please',
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class TodayDateFieldContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Calendar_icon,
              Flexible(child: TodayDateTextField()),
              // TextBuilder(
              //   text: '08-01-2001',
              //   size: 15,
              //   weight: FontWeight.w400,
              //   color: Colors.black,
              // )
              // SizedBox(
              //   width: 300,
              //   child: TextField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'Enter a Date please',
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class ClaculateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Center(
          child: Text(
            "احسب",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          Age test = AgeCalculator().calculateAge(dateOfBirth, futureDate);
          Duration testing =
              AgeCalculator().calculateNextBirthDay(dateOfBirth, futureDate);
          debugPrint(test.toString());
          debugPrint(testing.toString());
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 13)));
  }
}

class ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Center(
          child: Text(
            "امسح",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          debugPrint("ضغط امسح");
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 13)));
  }
}

class DateBox extends StatelessWidget {
  String? type;
  String? num;
  DateBox({this.type, this.num});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Column(
        children: [
          Container(
              width: 90,
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  type.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ))),
          Container(
              width: 90,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  num.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              )))
        ],
      ),
    );
  }
}

class TextBuilder extends StatelessWidget {
  String? text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextBuilder({this.text, this.color, this.size, this.weight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}

class EmptyBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20);
  }
}

class BirthDateTextField extends StatelessWidget {
  TextEditingController editDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: editDate,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "أدخل تاريخ الميلاد",
          hintStyle: TextStyle(fontSize: 16),
          icon: Icon(
            Icons.date_range,
            color: Theme.of(context).primaryColor,
          )),
      onTap: () {
        showDatePicker(
                locale: const Locale("ar", "EG"),
                cancelText: "إلغاء",
                confirmText: "تم",
                helpText: "اختر التاريخ",
                fieldLabelText: "أدخل التاريخ",
                fieldHintText: " / / ",
                errorFormatText: "تنسيق خاطئ",
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100))
            .then((date) {
          dateOfBirth = date!;
          //debugPrint(date.toString());
        });
      },
    );
  }
}

class TodayDateTextField extends StatelessWidget {
  TextEditingController editDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: editDate,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "أدخل تاريخ اليوم",
          hintStyle: TextStyle(fontSize: 16),
          icon: Icon(
            Icons.date_range,
            color: Theme.of(context).primaryColor,
          )),
      onTap: () {
        showDatePicker(
                locale: const Locale("ar", "EG"),
                cancelText: "إلغاء",
                confirmText: "تم",
                helpText: "اختر التاريخ",
                fieldLabelText: "أدخل التاريخ",
                fieldHintText: " / / ",
                errorFormatText: "تنسيق خاطئ",
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100))
            .then((date) {
          futureDate = date!;
          //debugPrint(date.toString());
        });
      },
    );
  }
}
