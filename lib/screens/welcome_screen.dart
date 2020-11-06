import 'package:flutter/cupertino.dart';

import 'continue_welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final formKey = GlobalKey<FormState>();
  String track;
  var tracks = ['Development', 'GIS & IoT', 'Networks'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: formKey,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.purple[900],
                          Colors.purple[800],
                          Colors.purple[400]
                        ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Welcome DTC Employee",
                            style: TextStyle(
                                color: Colors.white, fontSize: 28,
                                fontWeight: FontWeight.bold)
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Please select your track:",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
                            //padding: EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                225, 95, 27, .3),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey[200]))),
                                          child: DropdownButtonFormField(
                                            items: tracks.map((String track) {
                                              return new DropdownMenuItem(
                                                  value: track,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(track),
                                                    ],
                                                  ));
                                            }).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                track = val;
                                              });
                                            },
                                            value: track,
                                            validator: (val) => val == null
                                                ? 'Please select your track'
                                                : null,
                                            onSaved: (val) => track = val,
                                            decoration: InputDecoration(
                                                hintText: 'Employee Track',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                border: InputBorder.none),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      final form = formKey.currentState;
                                      if(form.validate()){
                                        form.save();
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
//                                        prefs.setString('firstName', firstName);
//                                        prefs.setString('middleName', middleName);
//                                        prefs.setString('lastName', lastName);
                                        prefs.setString('track', track);
                                        Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => Continue()
                                        ));
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 25),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          color: Colors.purple[900]),
                                      child: Center(
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
