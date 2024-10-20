import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject_mototbike/models/bike.dart';

class BikeSource {
  static Future<List<Bike>?> fetchFeaturedBikes() async {
    try {
      final ref = FirebaseFirestore.instance
          .collection('Bikes')
          //.where('rating', isGreaterThan: 4.5)
          .where('rating', isGreaterThanOrEqualTo: 4.5)
          .orderBy('rating', descending: true);

      final queryDocs = await ref.get();
      //final List = queryDocs.docs.map((doc) => Bike.fromjson(doc.data())).toList();
      return queryDocs.docs.map((doc) => Bike.fromjson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<Bike>?> fetchNewsBikes() async {
    try {
      final ref = FirebaseFirestore.instance
          .collection('Bikes')
          .orderBy('release', descending: true)
          .limit(4);
      final queryDocs = await ref.get();
      //final List = queryDocs.docs.map((doc) => Bike.fromjson(doc.data())).toList();
      return queryDocs.docs.map((doc) => Bike.fromjson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Bike?> fetchBike(String bikeId) async {
    try {
      final ref = FirebaseFirestore.instance.collection('Bikes').doc(bikeId);
      final doc = await ref.get();
      Bike? bike = doc.exists ? Bike.fromjson(doc.data()!) : null;
      return bike;
      //final List = queryDocs.docs.map((doc) => Bike.fromjson(doc.data())).toList();
      //return queryDocs.docs.map((doc) => Bike.fromjson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
