import 'package:connectivity/connectivity.dart';

class Connection {
  static Future<ConnectivityResult> checkConnection() async {
    final connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    return result;
  }
}
