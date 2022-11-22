
import 'package:age_calculator/age_calculator.dart';

class AppCalcs {


   static ageCalc(DateTime bDate, DateTime eDate){
    return AgeCalculator.age(bDate, today: eDate);
  }

   static nextDOBCalc(DateTime dateOfBirth){
    return AgeCalculator.timeToNextBirthday(dateOfBirth);
  }


}