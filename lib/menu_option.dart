import 'dart:ui';

import 'package:flutter/material.dart';
import 'option_model.dart';
import 'travelUI/search_screen.dart';

class MenuOptionsScreen extends StatefulWidget {
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Color(0xFF3594DD),
          title: Text(
            'Menu Option'
          ),
          leading: FlatButton(
            textColor: Colors.white,
            child: Icon(
              Icons.arrow_back
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              child: Text(
                'HELP',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => print('Help clicked')),
          ],
        ),
        body: ListView.builder(
          itemCount: options.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 15.0);
            }
            else if (index == options.length + 1) {
              return SizedBox(height: 10.0);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: _selectedOption == index - 1 ? Border.all(color: Colors.black26) : null,
              ),
              child: ListTile(
                leading: options[index - 1].icon,
                title: Text(
                  options[index - 1].title,
                  style: TextStyle(
                    color: _selectedOption == index - 1
                      ? Colors.black
                      : Colors.grey[600],
                  ),
                ),
                subtitle: Text(
                  options[index - 1].subtitle,
                style: TextStyle(
                  color:
                      _selectedOption == index - 1 ? Colors.black : Colors.grey,
                ),
                ),
                selected: _selectedOption == index - 1,
                onTap: () {
                  setState(() {
                    _selectedOption = index -1;
                    if (index == 1) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ));
                    }
                  });
                },
              ),
            );
          }
        ),
    );
  }
}