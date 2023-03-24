import 'package:flutter/foundation.dart';
import 'package:step_box/logic/health.dart';

class PedometerProvider extends ChangeNotifier {
  List pedometerData = [1, 1];
  final _health = Health();
  void getPermissions() {
    _health.getPermissions();
    // notifyListeners();
  }

  Future<void> getData() async {
    pedometerData = await _health.fetchData();
    notifyListeners();
  }
}
