import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_box/const.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:step_box/providers.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var goalValue = 6000;
    double steps = 3250;
    double percentage = 0.0;
    double calories = 0;
    double distance = 0;
    double duration = 0;

    double getPercentage() {
      percentage = steps / goalValue;
      return percentage;
    }

    return Consumer<PedometerProvider>(
      builder: (context, PedometerModel, child) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CircularPercentIndicator(
                  radius: 80,
                  percent: getPercentage(),
                  lineWidth: 10,
                  progressColor: kblackColor,
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(PedometerModel.pedometerData[0].toString(),
                          style: kStepCounterText),
                      const Text('Steps'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Goal : $goalValue',
                  style: kGoalText,
                ),
              ),
              InfoTile(title: "Calories", value: calories),
              InfoTile(title: "Duration", value: duration),
              InfoTile(title: "Distance", value: distance),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Column(
              //       children: [
              //         const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text('Calories', style: kCDDHeadText),
              //         ),
              //         Text('$calories', style: kCDDSubText),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 40,
              //       width: 3,
              //       child: DecoratedBox(
              //           decoration: BoxDecoration(
              //         color: kblackColor,
              //       )),
              //     ),
              //     Column(
              //       children: [
              //         const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text('Disatnce', style: kCDDHeadText),
              //         ),
              //         Text('$distance', style: kCDDSubText),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 40,
              //       width: 3,
              //       child: DecoratedBox(
              //           decoration: BoxDecoration(
              //         color: kblackColor,
              //       )),
              //     ),
              //     Column(
              //       children: [
              //         const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text('Duration', style: kCDDHeadText),
              //         ),
              //         Text('$duration', style: kCDDSubText),
              //       ],
              //     ),
              //   ],
              // ),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 40),
              //     child: Container(
              //       decoration: const BoxDecoration(
              //         color: kblackColor,
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           topRight: Radius.circular(30),
              //         ),
              //       ),
              //       child: null,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final double value;
  InfoTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 85,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kblackColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              value.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
