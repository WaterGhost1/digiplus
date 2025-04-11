import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_connectivity_act/model/network.dart';

class NetConnectivityCubit extends Cubit<NetworkStatus> {
  final Connectivity status = Connectivity();

  NetConnectivityCubit() : super(NetworkStatus.loading) {
    // checkConnectivity();
    monitorNetConnectivity();
  }

  void monitorNetConnectivity() async {
    // final List<ConnectivityResult> results = await Connectivity().checkConnectivity();

    status.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) async {
      for (var result in results) {
        emit(NetworkStatus.loading);

        await Future.delayed(Duration(seconds: 3));

        switch (result) {
          case ConnectivityResult.wifi:
            if (await checkInternetAccess()) {
              emit(NetworkStatus.connectedToWifi);
            } else {
              emit(NetworkStatus.connectedNoAccess);
            }
            break;
          case ConnectivityResult.none:
            emit(NetworkStatus.noInternetConnection);
            break;
          case ConnectivityResult.mobile:
            emit(NetworkStatus.connectedToData);
            break;

          default:
            emit(NetworkStatus.loading);
        }
      }
    });
  }

  Future<bool> checkInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
