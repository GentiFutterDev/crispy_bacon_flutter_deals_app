import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
  Future<bool> isConnectedToWifi();
  Future<bool> isConnectedToMobile();
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> isConnected() async {
    final List<ConnectivityResult> results = await connectivity.checkConnectivity();
    print("isConnected: ${!results.contains(ConnectivityResult.none)}");
    return !results.contains(ConnectivityResult.none);
  }

  @override
  Future<bool> isConnectedToWifi() async {
    final List<ConnectivityResult> results = await connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.wifi);
  }

  @override
  Future<bool> isConnectedToMobile() async {
    final List<ConnectivityResult> results = await connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.mobile);
  }
}

@module
abstract class CoreModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
