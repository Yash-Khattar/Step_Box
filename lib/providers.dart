import 'package:flutter/foundation.dart';
import 'package:step_box/logic/health.dart';

class PedometerProvider extends ChangeNotifier {
  Map pedometerDataMap = {"steps": 1, "calories": 1};
  final _health = Health();
  void getPermissions() {
    _health.getPermissions();
    // notifyListeners();
  }

  Future<void> getData() async {
    pedometerDataMap = await _health.fetchData();
    notifyListeners();
  }
}
