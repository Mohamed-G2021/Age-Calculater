import 'package:age_calculator_app/date_utils.dart';
import 'age_calculator.dart';
import 'package:flutter/material.dart';
import 'age_model.dart';
import 'duration_model.dart';

Age userAge = Age();
Duration nextBirthDate = Duration();
DateTime futureDate = DateTime(1900, 10, 1);
DateTime dateOfBirth = DateTime(2022, 6, 1);

TextEditingController dateOfBirthController = TextEditingController();

TextEditingController todayDateController = TextEditingController();

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext? buildContext;

  @override
  Widget build(BuildContext buildContext) {
    this.buildContext = buildContext;
    userAge.days;
    userAge.months;
    userAge.years;
    nextBirthDate.days;
    nextBirthDate.months;

    Widget ageDaysBox =
        buildDateBox(type: "الأيام", num: userAge.days.toString());

    Widget ageMonthsBox =
        buildDateBox(type: "الشهور", num: userAge.months.toString());

    Widget ageYearsBox =
        buildDateBox(type: "السنين", num: userAge.years.toString());

    Widget nextDOBDaysBox =
        buildDateBox(type: "الأيام", num: nextBirthDate.days.toString());

    Widget nextDOBMonthsBox =
        buildDateBox(type: "الشهور", num: nextBirthDate.months.toString());

    Widget NextDOBYearsBox = buildDateBox(type: "السنين", num: '-');

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          //    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTextBuilder(
              text: "تاريخ الميلاد",
              color: Colors.grey,
              size: 20,
            ),
            buildBirthDateFieldContainer(),
            buildEmptyBox(),
            buildTextBuilder(
              text: "تاريخ اليوم",
              color: Colors.grey,
              size: 20,
            ),
            buildTodayDateFieldContainer(),
            buildEmptyBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [buildCalculateButton(), buildClearButton()],
            ),
            buildEmptyBox(),
            buildTextBuilder(
              text: "العمر هو",
              color: Colors.grey,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ageDaysBox,
                ageMonthsBox,
                ageYearsBox,
              ],
            ),
            buildEmptyBox(),
            buildTextBuilder(
              text: "يوم الميلاد القادم هو",
              color: Colors.grey,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nextDOBDaysBox,
                nextDOBMonthsBox,
                NextDOBYearsBox,
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBirthDateFieldContainer() {
    return Container(
        width: MediaQuery.of(buildContext!).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(buildContext!).primaryColor),
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Calendar_icon,
              Flexible(child: buildBirthDateTextField()),
            ],
          ),
        ));
  }

  Widget buildTodayDateFieldContainer() {
    return Container(
        width: MediaQuery.of(buildContext!).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(buildContext!).primaryColor),
            borderRadius: BorderRadius.circular(2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: buildTodayDateTextField()),
            ],
          ),
        ));
  }

  Widget buildCalculateButton() {
    return ElevatedButton(
        child: Center(
          child: Text(
            "احسب",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          setState(() {
            userAge = AgeCalculator().calculateAge(dateOfBirth, futureDate);
            nextBirthDate =
                AgeCalculator().calculateNextBirthDay(dateOfBirth, futureDate);
          });

          debugPrint(userAge.toString());
          debugPrint(nextBirthDate.toString());
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            primary: Theme.of(buildContext!).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 13)));
  }

  Widget buildClearButton() {
    return ElevatedButton(
        child: Center(
          child: Text(
            "امسح",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          setState(() {
            userAge.days = 0;
            userAge.months = 0;
            userAge.years = 0;
            nextBirthDate.days = 0;
            nextBirthDate.months = 0;
            dateOfBirthController.text = "";
            todayDateController.text = "";
          });
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            primary: Theme.of(buildContext!).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 13)));
  }

  Widget buildEmptyBox() {
    return SizedBox(height: 20);
  }

  Widget buildBirthDateTextField() {
    return TextField(
      readOnly: true,
      controller: dateOfBirthController,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "أدخل تاريخ الميلاد",
          hintStyle: TextStyle(fontSize: 16),
          icon: Icon(
            Icons.date_range,
            color: Theme.of(buildContext!).primaryColor,
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
                context: buildContext!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100))
            .then((date) {
          dateOfBirth = date!;
          setState(() {
            dateOfBirthController.text = DateFormatting.formatDate(dateOfBirth);
          });
        });
      },
    );
  }

  Widget buildTodayDateTextField() {
    return TextField(
      readOnly: true,
      controller: todayDateController,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "أدخل تاريخ اليوم",
          hintStyle: TextStyle(fontSize: 16),
          icon: Icon(
            Icons.date_range,
            color: Theme.of(buildContext!).primaryColor,
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
                context: buildContext!,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100))
            .then((date) {
          futureDate = date!;
          setState(() {
            todayDateController.text = DateFormatting.formatDate(futureDate);
          });
        });
      },
    );
  }

  Widget buildTextBuilder(
      {String? text, double? size, Color? color, FontWeight? weight}) {
    return Text(
      text.toString(),
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }

  Widget buildDateBox({String? type, String? num}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(buildContext!).primaryColor)),
      child: Column(
        children: [
          Container(
              width: 90,
              color: Theme.of(buildContext!).primaryColor,
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
