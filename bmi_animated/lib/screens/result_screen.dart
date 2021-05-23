import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/reusable_card.dart';
import '../widgets/bottom_button.dart';
import '../models/BMI_arguments.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BMIArguments myArgs = ModalRoute.of(context).settings.arguments;
    final String bmiResult = myArgs.bmiResult;
    final String interpretation = myArgs.interpretation;
    final String bmi = myArgs.bmi.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmi.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    'Normal BMI Range: 18.5-25 kg/m2',
                    style: kResultTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
