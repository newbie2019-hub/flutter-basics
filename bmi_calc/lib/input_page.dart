import 'package:bmi_calc/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { Male, Female }

Gender selectedGender;

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;

  // void updateColor(Gender selectedGender) {
  //   //Male card was pressed
  //   if (selectedGender == Gender.Male) {
  //     if (maleCardColor == inactiveCardColour) {
  //       maleCardColor = activeCardColour;
  //       femaleCardColor = inactiveCardColour;
  //     } else {
  //       maleCardColor = inactiveCardColour;
  //     }
  //   }
  //   //Female card was pressed
  //   if (selectedGender == Gender.Female) {
  //     if (femaleCardColor == inactiveCardColour) {
  //       femaleCardColor = activeCardColour;
  //       maleCardColor = inactiveCardColour;
  //     } else {
  //       femaleCardColor = inactiveCardColour;
  //     }
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      color: selectedGender == Gender.Male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: CardContent(
                        title: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      color: selectedGender == Gender.Female
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: CardContent(
                          title: 'FEMALE', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: inactiveCardColour,
                cardChild: Column(
                  children: <Widget> [

                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(color: inactiveCardColour)),
                  Expanded(child: ReusableCard(color: inactiveCardColour)),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
                color: bottomContainerColor)
          ],
        ),
      ),
    );
  }
}
