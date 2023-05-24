import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_controller.g.dart';

class ConnectivityController = ConnectivityControllerBase
    with _$ConnectivityController;

abstract class ConnectivityControllerBase with Store {
  ConnectivityControllerBase() {
    getConnectionStatus();
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult = event;
    });
  }

  @observable
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  @computed
  bool get isConnectionNotEmpty {
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  @action
  Stream<ConnectivityResult> getConnectionStatus() {
    return Connectivity().onConnectivityChanged;
  }
}
