import 'package:flutter/material.dart';
import 'package:step_box/logic/health.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class StatsScreen extends StatelessWidget {
  StatsScreen({super.key});

  HealthFactory health = HealthFactory();

  Future fetchSteps() async {
    // await Permission.activityRecognition.request();
    var types = [
      HealthDataType.STEPS,
    ];

    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();

    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(Duration(days: 1)), now, types);
    var permissions = [
      HealthDataAccess.READ_WRITE,
    ];
    await health.requestAuthorization(types, permissions: permissions);
    bool success =
        await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight, now);
    print(steps);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: fetchSteps, child: Text("Steps")),
    );
  }
}
