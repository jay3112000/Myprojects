import 'package:Home/models/apartments.dart';
import 'package:Home/services/apartments_firestore_services.dart';
import 'package:Home/utils/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _selected = false;
  bool _selected1 = false;

  RangeValues values = RangeValues(1, 100);
  RangeLabels labels = RangeLabels('1', '100');
   RangeValues values2 = RangeValues(1, 4000);
  RangeLabels labels2 = RangeLabels('1', '4000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Screen'),
        backgroundColor: Colors.pink[300],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(
                FontAwesomeIcons.bed,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Number of Bedrooms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('select your choice of bedrooms'),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                RawChip(
                  labelPadding: EdgeInsets.all(5.0),
                  label: Text(
                    '1 BHK',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.grey,
                  selectedColor: Colors.pink[300],
                  selected: _selected,
                  onSelected: (bool value) {
                    setState(() {
                      _selected = value;
                    });
                  },
                  elevation: 6.0,
                  shadowColor: Colors.grey[60],
                  padding: EdgeInsets.all(6.0),
                ),
                SizedBox(
                  width: 10,
                ),
                RawChip(
                  labelPadding: EdgeInsets.all(5.0),
                  label: Text(
                    '2 BHK',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.grey,
                  selectedColor: Colors.pink[300],
                  selected: _selected1,
                  onSelected: (bool value) {
                    setState(() {
                      _selected1 = value;
                    });

                    ApartmentFirestoreService().getrooms(2);
                  },
                  elevation: 6.0,
                  shadowColor: Colors.grey[60],
                  padding: EdgeInsets.all(6.0),
                ),
                SizedBox(
                  width: 10,
                ),
                /* RawChip(
                      labelPadding: EdgeInsets.all(5.0),
                      label: Text(
                        '3 BHK',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.grey,
                      selectedColor: Colors.pink[300],
                      selected: _selected2,
                      onSelected: (bool value) {
                        setState(() {
                          _selected2 = true;
                        });
                      },
                      onDeleted: () {
                        _selected2 = false;
                      },
                      elevation: 6.0,
                      shadowColor: Colors.grey[60],
                      padding: EdgeInsets.all(6.0),
                    ),*/
              ],
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(
                FontAwesomeIcons.rupeeSign,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Budget',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('select your choice of budget'),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.pink[300],
                inactiveTrackColor: Colors.grey[300],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.pink[300],
                overlayColor: Colors.pink[300].withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.pink[300],
                inactiveTickMarkColor: Colors.grey[300],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.pink[300],
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: RangeSlider(
                min: 1,
                max: 100,
                values: values,
                divisions: 5,
                labels: labels,
                onChanged: (value) {
                  print('START: ${value.start}, END: ${value.end}');
                  setState(() {
                    values = value;
                    labels = RangeLabels('${value.start.toInt().toString()}\k',
                        '${value.end.toInt().toString()}\k');
                  });
                },
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(
                FontAwesomeIcons.home,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Type of Property',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('select your choice of property'),
            ),
            Row(
              children: <Widget>[
                RawChip(
              labelPadding: EdgeInsets.all(5.0),
              label: Text(
                'House',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.grey,
              selectedColor: Colors.pink[300],
              selected: _selected1,
              onSelected: (bool value) {
                setState(() {
                  _selected1 = value;
                });
              },
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: EdgeInsets.all(6.0),
            ),
            SizedBox(width: 5,),
             RawChip(
              labelPadding: EdgeInsets.all(5.0),
              label: Text(
                'Apartments',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.grey,
              selectedColor: Colors.pink[300],
              selected: _selected1,
              onSelected: (bool value) {
                setState(() {
                  _selected1 = value;
                });
              },
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: EdgeInsets.all(6.0),
            ),
             SizedBox(width: 5,),
             RawChip(
              labelPadding: EdgeInsets.all(5.0),
              label: Text(
                'Farmhouse/Plots',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.grey,
              selectedColor: Colors.pink[300],
              selected: _selected1,
              onSelected: (bool value) {
                setState(() {
                  _selected1 = value;
                });
              },
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: EdgeInsets.all(6.0),
            ),
             SizedBox(width: 5,),
            
              ],
            ),
            RawChip(
              labelPadding: EdgeInsets.all(5.0),
              label: Text(
                'Rental',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.grey,
              selectedColor: Colors.pink[300],
              selected: _selected1,
              onSelected: (bool value) {
                setState(() {
                  _selected1 = value;
                });
              },
              elevation: 6.0,
              shadowColor: Colors.grey[60],
              padding: EdgeInsets.all(6.0),
            ),
              ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(
                FontAwesomeIcons.landmark,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Area',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('select your choice of area'),
            ),
             SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.pink[300],
                inactiveTrackColor: Colors.grey[300],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.pink[300],
                overlayColor: Colors.pink[300].withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.pink[300],
                inactiveTickMarkColor: Colors.grey[300],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.pink[300],
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
             child: RangeSlider(
                min: 1,
                max: 4000,
                values: values2,
                divisions: 20,
                labels: labels2,
                onChanged: (value2) {
                  print('START: ${value2.start}, END: ${value2.end}');
                  setState(() {
                    values2 = value2;
                    labels2 = RangeLabels('${value2.start.toInt().toString()}\sq.ft',
                        '${value2.end.toInt().toString()}\sq.ft');
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
