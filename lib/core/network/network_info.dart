import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final Connectivity connectionCheker;

  NetworkInfoImp(this.connectionCheker);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected async {
    final cx = await connectionCheker.checkConnectivity();
    return (cx == ConnectivityResult.none) ? false : true;
  }
}
