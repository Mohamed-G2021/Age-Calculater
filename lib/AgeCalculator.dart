import 'Age_Model.dart';
import 'package:age_calculator/age_calculator.dart' as calculator;
import 'Duration_Model.dart';

class AgeCalculator {
  Age calculateAge(DateTime birthDate, DateTime futureDate) {
    calculator.DateDuration duration;
    duration = calculator.AgeCalculator.age(birthDate);

    Age userAge = Age();
    userAge.days = duration.days;
    userAge.months = duration.months;
    userAge.years = duration.years;

    return userAge;
  }

  Duration calculateNextBirthDay(DateTime birthDate, DateTime futureDate) {
    calculator.DateDuration duration;
    duration = calculator.AgeCalculator.timeToNextBirthday(birthDate);

    Duration timeLeftToDOB = Duration();
    timeLeftToDOB.days = duration.days;
    timeLeftToDOB.months = duration.months;

    return timeLeftToDOB;
  }
}
