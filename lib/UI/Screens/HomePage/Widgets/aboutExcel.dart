import 'package:excelapp/UI/Screens/HomePage/Widgets/Drawer/DevCredits/devCredits.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/socialIcons.dart';
import 'package:excelapp/UI/Themes/gradient.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';

import '../../../Themes/colors.dart';

// class AboutExcelPopUp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => AboutExcelPopUpState();
// }

// class AboutExcelPopUpState extends State<AboutExcelPopUp>
//     with SingleTickerProviderStateMixin {
// AnimationController controller;
// Animation<double> scaleAnimation;

// @override
// void initState() {
//   super.initState();

//   controller =
//       AnimationController(vsync: this, duration: Duration(milliseconds: 200));
//   scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

//   controller.addListener(() {
//     setState(() {});
//   });

//   controller.forward();
// }
class AboutExcelPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          gradient: drawerGradient()),
      child: Column(
        children: [
          SizedBox(height: 8),
          Image.asset(
            "assets/icons/divider.png",
            width: 340,
          ),
          Image.asset(
            "assets/icons/college.png",
            width: 340,
            height: 160,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 7, 32, 10),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Inspire. Innovate. Engineer ',
                  style: TextStyle(
                    color: Color(0xFFD3E1E4),
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    fontFamily: "mulish",
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text:
                          "\n\nExcel, the nation's second and South India's first ever techno-managerial fest of its kind was started in 2001 by the students of Govt. Model Engineering College, Kochi. Over the years, Excel has grown exponentially, consistently playing host to some of the most talented students, the most coveted guests and the most reputed companies.\nAs we gear up for our 25th edition, Excel continues to push boundaries. Join us this January and experience the magic of a legacy in the making.",
                      style: TextStyle(
                        color: Color(0xFFE4EDEF),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: pfontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      launchURL('https://www.excelmec.org/');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: primaryPink,
                      ),
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Website',
                            style: TextStyle(
                                color: backgroundBlue,
                                fontFamily: "mulish",
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_forward,
                              size: 19, color: backgroundBlue)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DevCredits();
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFf2C1B77),
                      ),
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Developer Credits',
                            style: TextStyle(
                                color: Color(0xFFE4EDEF),
                                fontFamily: "mulish",
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 19,
                            color: Color(0xFFE4EDEF),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
          /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/meclogo.png",
                      height: 50,
                    ),
                    Image.asset(
                      "assets/icons/excel2020withtext.png",
                      height: 50,
                    ),
                  ],
                )*/
          ,
        ],
      ),
    );
  }
}

WidgetStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return colorPressed;
    }
    // Return the default color if no other condition matches
    return color;
  };
  return WidgetStateProperty.resolveWith(getColor);
}
