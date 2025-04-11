import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_connectivity_act/bloc/net_connectivity_cubit.dart';
import 'package:network_connectivity_act/model/network.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool showLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    context.read<NetConnectivityCubit>().monitorNetConnectivity();

    return SafeArea(
      child: Scaffold(
        body: BlocListener<NetConnectivityCubit, NetworkStatus>(
          listener: (context, state) {
            if (state == NetworkStatus.loading) {
              setState(() {
                showLoading = true;
              });
              Future.delayed(Duration(seconds: 3), () {
                setState(() {
                  showLoading = false;
                });
              });
            } else {
              setState(() {
                showLoading = false;
              });
            }
          },
          child: BlocBuilder<NetConnectivityCubit, NetworkStatus>(
            builder: (context, state) {
              if (showLoading) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              return connectionStatus(state);
            },
          ),
        ),
      ),
    );
  }

  Widget connectionStatus(NetworkStatus state) {
    if (state == NetworkStatus.connectedToWifi) {
      return connectionStatusCard(
        'assets/images/wifi.png',
        'Connected to Wifi',
      );
    } else if (state == NetworkStatus.connectedToData) {
      return connectionStatusCard(
        'assets/images/mobiledata.png',
        'Connected to Mobile Data',
      );
    } else if (state == NetworkStatus.noInternetConnection) {
      return connectionStatusCard(
        'assets/images/noInternet.png',
        'No Internet Connection',
      );
    } else if (state == NetworkStatus.loading) {
      return Text('loading..', style: TextStyle(fontSize: 24));
    } else if (state == NetworkStatus.connectedNoAccess) {
      print(state);
      return connectionStatusCard(
        'assets/images/connectedNoAccess.png',
        'Connected But No Internet Access',
      );
    }

    return SizedBox();
  }

  Widget connectionStatusCard(String imagePath, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          Text(message, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
