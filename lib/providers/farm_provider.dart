import 'package:Home/models/farm.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:Home/services/farm_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/screens/review.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/models/favorite_apartments.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FarmProvider with ChangeNotifier {
  final firestoreServise = FarmFirestoreService();
  Firestore _db = Firestore.instance;
  String _farmID;
  String _name;
  String _budget;
  String _address;
  String _type;
  String _bedrooms;
  String _imageurl;

  //getters
  String get farmID => _farmID;
  String get name => _name;
  String get budget => _budget;
  String get address => _address;
  String get type => _type;
  String get bedrooms => _bedrooms;
  String get imageurl => _imageurl;


  Future<void> setfav(bool value,String name) {
    return _db
        .collection('properties')
        .document('jaipur')
        .collection('Farm')
        .document(name)
        .updateData({"isfavourite": value});
  }


}
