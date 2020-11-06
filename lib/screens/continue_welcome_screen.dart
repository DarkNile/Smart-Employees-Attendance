import 'scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Continue extends StatefulWidget {
  @override
  _ContinueState createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  final formKey = GlobalKey<FormState>();
  String employeeName;
  String track;
  var tracks = ['Development', 'GIS & IoT', 'Networks'];

  // GIS & IoT Names
  var gisNames = ['سارة ثروت محمد كمال', 'زينب صبحى على حامد', 'محمد عادل عبدالباقي عبدالله', 'فاطمة علي إبراهيم جمال الدين', 'نرمين محمود احمد محمد',
    'نوران محمود يحيى', 'كريم وائل عبد المنعم', 'سوزان علاء الدين مصطفى', 'إبراهيم عادل عبد الفتاح', 'ضحى ممدوح محمد'];
  //--------------------------------------------------------------------------------------------------

  // Networks Names
  var networkNames = ['عمر أسامة عيد إسماعيل', 'محمد جمال عبدالمنعم عيد', 'إسلام ابو المجد ابو المجد', 'مصطفى السيد محمد السيد',
    'احمد محمود نعمان محمد', 'محمود جمال محمد إبراهيم', 'بسنت فتحي أحمد الرفاعي', 'عنان رأفت محمد زويل', 'مى وحيد عصمت حسن',
    'محمد خيري صميدة', 'شريف عباس مراد', 'أحمد محمود محمد العيسوي', 'محمود محمد عبد الغني'];
  //--------------------------------------------------------------------------------------------------

  // Development Names
  var developmentNames = ['سما محمود علي', 'مروة مصطفى عطية', 'عمرو معز عبدالرحمن شبل', 'أحمد هشام نبيه', 'محمد جمال يسن إسماعيل',
  'محمود أحمد شتيه سالم', 'عبد المجيد محمد الصاوي', 'عبدالله سعد محمود مصطفى', 'محمود شكري عبد العظيم حجاب', 'بيتر نعيم عزمي بستان',
  'مصطفى سيد سنوسي عثمان', 'محمد عبدالله محمد محمد', 'محمد محمد بلال رزق', 'إبراهيم العراقي الدسوقي', 'حازم حسن عبدالمجيد الليثي',
    'لمياء عاطف عبد الفتاح محمود', 'منة الله صبري موسى عبدالرحمن', 'إيمان مجدي محمد حامد', 'أحمد جمال كمال خضير', 'إسلام محمد ربيع', 'السعيد فايد محمود',
    'محمود جمال عبد الجواد', 'أحمد محمد علام', 'محمد صلاح عبد الله', 'حسام صلاح الدين محمد', 'سارة عبد اللطيف محمد', 'ياسر عزت رجب'];
  //--------------------------------------------------------------------------------------------------

  Widget menu(){
    if(track == 'GIS & IoT'){
      return DropdownButtonFormField(
        items: gisNames.map((String employeeName) {
          return DropdownMenuItem(
              value: employeeName,
              child: Row(
                children: <Widget>[
                  Text(employeeName),
                ],
              ));
        }).toList(),
        onChanged: (val) {
          setState(() {
            employeeName = val;
          });
        },
        value: employeeName,
        validator: (val) => val == null
            ? 'Employee Name'
            : null,
        onSaved: (val) => employeeName = val,
        decoration: InputDecoration(
            hintText: 'Employee Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none),
      );
    }
    else if(track == 'Networks'){
      return DropdownButtonFormField(
        items: networkNames.map((String employeeName) {
          return DropdownMenuItem(
              value: employeeName,
              child: Row(
                children: <Widget>[
                  Text(employeeName),
                ],
              ));
        }).toList(),
        onChanged: (val) {
          setState(() {
            employeeName = val;
          });
        },
        value: employeeName,
        validator: (val) => val == null
            ? 'Employee Name'
            : null,
        onSaved: (val) => employeeName = val,
        decoration: InputDecoration(
            hintText: 'Employee Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none),
      );
    }
    else if(track == 'Development'){
      return DropdownButtonFormField(
        items: developmentNames.map((String employeeName) {
          return DropdownMenuItem(
              value: employeeName,
              child: Row(
                children: <Widget>[
                  Text(employeeName),
                ],
              ));
        }).toList(),
        onChanged: (val) {
          setState(() {
            employeeName = val;
          });
        },
        value: employeeName,
        validator: (val) => val == null
            ? 'Employee Name'
            : null,
        onSaved: (val) => employeeName = val,
        decoration: InputDecoration(
            hintText: 'Employee Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none),
      );
    }
  }


  @override
  initState() {
    super.initState();
    loadTrack();
  }

  loadTrack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      track = prefs.getString('track');
    });
  }


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
                          "$track Track",
                          style: TextStyle(
                              color: Colors.white, fontSize: 28,
                              fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Please select your name:",
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
                                      child: menu(),
                                  ),
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
                                    prefs.setString('employeeName', employeeName);
                                    prefs.setString('track', track);
                                    if(employeeName != null && track != null){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => ScanScreen()
                                      ));
                                    }
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
                                      "Finish",
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
