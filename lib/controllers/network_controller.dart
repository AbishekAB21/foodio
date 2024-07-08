import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/state_manager.dart';

class NetworkController extends GetxController {
  Connectivity connectivity = Connectivity();
  final RxString connectionStatus = ''.obs;

  @override
  void onInit() {
    connectivity.onConnectivityChanged.listen(updateConnectionStatus);

    super.onInit();
  }

  void updateConnectionStatus(List<ConnectivityResult> connectivityResultList) {
    if (connectivityResultList.contains(ConnectivityResult.mobile)) {
      print("Mobile Internet");
      connectionStatus.value = "Mobile Internet";
    } else if (connectivityResultList.contains(ConnectivityResult.vpn)) {
      print("VPN");
      connectionStatus.value = "VPN";
    } else if (connectivityResultList.contains(ConnectivityResult.wifi)) {
      print("Wifi");
      connectionStatus.value = "Wifi";
    } else if (connectivityResultList.contains(ConnectivityResult.none)) {
      print("Offline");
      connectionStatus.value = "Offline";
    } else if (connectivityResultList.contains(ConnectivityResult.other)) {
      print("Other");
      connectionStatus.value = "Other";
    } else {
      connectionStatus.value = "Something Went Wrong";
    }
  }
}
