import 'package:finalproject_mototbike/models/bike.dart';
import 'package:finalproject_mototbike/sources/bike_source.dart';
import 'package:get/get.dart';

class BrowseNewestConttroler extends GetxController {
  final _list = <Bike>[].obs;
  List<Bike> get list => _list;
  set list(List<Bike> n) => _list.value = n;

  final _status = ''.obs;
  String get status => _status.value;
  set status(String n) => _status.value = n;

  fetchNewest() async {
    status = 'loading';

    final bikes = await BikeSource.fetchNewsBikes();
    if (bikes == null) {
      status = 'someting wrong';
      return;
    }
    status = 'success';
    list = bikes;
  }
}
