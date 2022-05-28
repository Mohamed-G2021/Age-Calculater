import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextBuilder(
            text: "تاريخ الميلاد",
            color: Colors.grey,
            size: 20,
          ),
          DateContainer,
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextBuilder(
              text: "تاريخ اليوم",
              color: Colors.grey,
              size: 20,
            ),
          ),
          DateContainer,
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(ButtonText: "امسح", onPressedText: "ضغط امسح"),
                Button(ButtonText: "احسب", onPressedText: "ضغط احسب")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextBuilder(
              text: "العمر هو",
              color: Colors.grey,
              size: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateBox(type: "الأيام", num: 29),
              DateBox(type: "الشهور", num: 4),
              DateBox(type: "السنين", num: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextBuilder(
              text: "يوم الميلاد القادم هو",
              color: Colors.grey,
              size: 20,
            ),
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
    );
  }
}

Widget Calendar_icon = Icon(Icons.calendar_today, color: Colors.orange);

Widget DateContainer = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(2)),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Calendar_icon,
          TextBuilder(
            text: '08-01-2001',
            size: 15,
            weight: FontWeight.w400,
            color: Colors.black,
          )
        ],
      ),
    ));

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
            primary: Colors.orange,
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
      decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
      child: Column(
        children: [
          Container(
              width: 90,
              color: Colors.orange,
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
              color: Colors.white,
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
