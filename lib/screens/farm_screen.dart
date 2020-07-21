import 'package:Home/models/farm.dart';
import 'package:Home/utils/farmCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/farm.dart';

class FarmScreen extends StatefulWidget {
  static const routename = '/farm';
  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    return Scaffold(
        body: (farms != null)
            ? ListView.builder(
                itemCount: farms.length,
                itemBuilder: (context, index) {
                  return FarmCard(
                      farms[index].imageurl,
                     farms[index].name,
                      farms[index].address,
                      farms[index].budget,
                      farms[index].bedrooms,
                      farms[index].type);
                })
            : Center(child: CircularProgressIndicator()));
  }
}
// title: Text(apartments[index].name),
//      trailing: Text(apartments[index].bedrooms.toString()),
