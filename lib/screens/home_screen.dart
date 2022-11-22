import 'package:age_calc/models/age_model.dart';
import 'package:age_calc/widgets/build_header_widget.dart';
import 'package:age_calc/widgets/build_output_field_widget.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:age_calc/models/global.dart';
import '../models/calculators.dart';
import '../widgets/build_button_for_row.dart';
import '../widgets/build_column_4_Title_And_TextField.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AgeModel myAge = AgeModel(years: '-', months: '-', days: '-');
  AgeModel myNextDate = AgeModel(years: '-', months: '-', days: '-');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              _dateOfBirth(),
              const SizedBox(height: 20,),
              _todayDate(),
              const SizedBox(height: 20,),
              _rowOfButtons(),
              const SizedBox(height: 20,),
              _buildColumnOfOutput('Age is', true),
              const SizedBox(height: 20,),
              _buildColumnOfOutput('Next birthdate in', false),
            ],
          ),
        ),
      ),
    );
  }

  _dateOfBirth(){
    return BuildColumn4TitleAndTextField('Date Of birth', true);
  }

  _todayDate(){
    return BuildColumn4TitleAndTextField('Today date', false);
  }

  _rowOfButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BuildButtonForRow(label: 'Clear', onPressed: () => _clearButton),
        BuildButtonForRow(label: 'Calc', onPressed: () => _calcButton),
      ],
    );
  }

  _clearButton(){
    print('Clear');
  }

  _calcButton(){
      DateDuration tempAge = AppCalcs.ageCalc(dateOfBirth, nowDate);
      DateDuration tempNextAge = AppCalcs.nextDOBCalc(dateOfBirth);
    setState(() {
      myAge.years = tempAge.years.toString();
      myAge.months = tempAge.months.toString();
      myAge.days = tempAge.days.toString();
      // myNextDate
      myNextDate.years = tempNextAge.years.toString();
      myNextDate.months = tempNextAge.months.toString();
      myNextDate.days = tempNextAge.days.toString();
    });
  }

  _buildColumnOfOutput(String head, bool isAge){
    return Column(
      children: [
        buildHeader(label: head),
        const SizedBox(height: 10,),
        _rowOfOutput(isAge),
      ],
    );
  }

  _rowOfOutput(bool isAge){
    var years  = isAge ? myAge.years  : myNextDate.years;
    var months = isAge ? myAge.months : myNextDate.months;
    var days   = isAge ? myAge.days   : myNextDate.days;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildOutputField(label: 'Year', output: years),
        BuildOutputField(label: 'Months', output: months),
        BuildOutputField(label: 'Days', output: days),
      ],
    );
  }
}
