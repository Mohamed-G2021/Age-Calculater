import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  return runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      primarySwatch: Colors.lightGreen,
    ),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: TextBuilder(
              text: "حاسبة العمر",
              weight: FontWeight.w600,
              color: Colors.black),
        ),
        body: HomeScreen()),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            BirthDayField,
            EmptyBox(),
            TextBuilder(
              text: "تاريخ اليوم",
              color: Colors.grey,
              size: 20,
            ),
            TodayField,
            EmptyBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(ButtonText: "امسح", onPressedText: "ضغط امسح"),
                Button(ButtonText: "احسب", onPressedText: "ضغط احسب")
              ],
            ),
            EmptyBox(),
            TextBuilder(
              text: "العمر هو",
              color: Colors.grey,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateBox(type: "الأيام", num: 29),
                DateBox(type: "الشهور", num: 4),
                DateBox(type: "السنين", num: 20),
              ],
            ),
            EmptyBox(),
            TextBuilder(
              text: "يوم الميلاد القادم هو",
              color: Colors.grey,
              size: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateBox(
                  type: "الأيام",
                  num: 15,
                ),
                DateBox(
                  type: "الشهور",
                  num: 8,
                ),
                DateBox(
                  type: "السنين",
                  num: 0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Widget Calendar_icon = Icon(Icons.date_range, color: Colors.orange);
DateContainer BirthDayField = DateContainer(hintText: "تاريخ الميلاد");
DateContainer TodayField = DateContainer(hintText: "تاريخ اليوم");

class DateContainer extends StatelessWidget {
  String? hintText;
  DateContainer({this.hintText});
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
              Flexible(
                  child: DateText(
                hintText: hintText,
              )),
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

class Button extends StatelessWidget {
  String? ButtonText;
  String? onPressedText;
  Button({this.ButtonText, this.onPressedText});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Center(
          child: Text(
            ButtonText.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          debugPrint(onPressedText.toString());
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(),
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 13)));
  }
}

class DateBox extends StatelessWidget {
  String? type;
  int? num;
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
                  style: TextStyle(color: Colors.grey, fontSize: 14),
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

class DateText extends StatelessWidget {
  TextEditingController editDate = TextEditingController();
  String? hintText;
  DateText({this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: editDate,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 17),
          icon: Icon(
            Icons.date_range,
            color: Theme.of(context).primaryColor,
          )),
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100))
            .then((date) {
          debugPrint(date.toString());
        });
      },
    );
  }
}
