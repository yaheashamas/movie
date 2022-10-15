import 'package:connectivity_plus/connectivity_plus.dart';
abstract class ConnectionToEnterNet {
  Future<bool> get ifExistEnterNet;
}
class ConnectionToEnterNetImpl extends ConnectionToEnterNet {
  @override
  Future<bool> get ifExistEnterNet async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}