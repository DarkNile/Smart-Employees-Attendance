import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String employeeName;
  String track;
  String arrivalTime;
  String departureTime;
  String imageURL = '';
  String networkImageURL = '';
  String scanBarcode = '';
  bool isArrival = true;
  //String finalDate = '';

  Widget getMyImage() {
    // GIS & IoT Images
    if (employeeName == 'سارة ثروت محمد كمال') {
      imageURL = 'images/1.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'زينب صبحى على حامد') {
      imageURL = 'images/2.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمد عادل عبدالباقي عبدالله') {
      imageURL = 'images/3.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'فاطمة علي إبراهيم جمال الدين') {
      imageURL = 'images/4.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'نرمين محمود احمد محمد') {
      imageURL = 'images/5.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'نوران محمود يحيى') {
      imageURL = 'images/6.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'كريم وائل عبد المنعم') {
      imageURL = 'images/7.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'سوزان علاء الدين مصطفى') {
      imageURL = 'images/8.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'إبراهيم عادل عبد الفتاح') {
      imageURL = 'images/9.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'ضحى ممدوح محمد') {
      imageURL = 'images/10.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    // Networks Images
    else if (employeeName == 'بسنت فتحي أحمد الرفاعي') {
      imageURL = 'images/11.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'مى وحيد عصمت حسن') {
      imageURL = 'images/12.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'عنان رأفت محمد زويل') {
      imageURL = 'images/13.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمود جمال محمد إبراهيم') {
      imageURL = 'images/14.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمد جمال عبدالمنعم عيد') {
      imageURL = 'images/15.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'إسلام ابو المجد ابو المجد') {
      imageURL = 'images/16.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'عمر أسامة عيد إسماعيل') {
      imageURL = 'images/17.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'احمد محمود نعمان محمد') {
      imageURL = 'images/18.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'مصطفى السيد محمد السيد') {
      imageURL = 'images/19.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'أحمد محمود محمد العيسوي') {
      imageURL = 'images/20.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'شريف عباس مراد') {
      imageURL = 'images/21.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمد خيري صميدة') {
      imageURL = 'images/22.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمود محمد عبد الغني') {
      imageURL = 'images/23.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    // Development Images
    else if (employeeName == 'محمود شكري عبد العظيم حجاب') {
      imageURL = 'images/24.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'عبد المجيد محمد الصاوي') {
      imageURL = 'images/25.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'إبراهيم العراقي الدسوقي') {
      imageURL = 'images/26.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمد عبدالله محمد محمد') {
      imageURL = 'images/27.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمد جمال يسن إسماعيل') {
      imageURL = 'images/28.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمد محمد بلال رزق') {
      imageURL = 'images/29.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'حازم حسن عبدالمجيد الليثي') {
      imageURL = 'images/30.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'مصطفى سيد سنوسي عثمان') {
      imageURL = 'images/31.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'عبدالله سعد محمود مصطفى') {
      imageURL = 'images/32.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'عمرو معز عبدالرحمن شبل') {
      imageURL = 'images/33.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'بيتر نعيم عزمي بستان') {
      imageURL = 'images/34.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'محمود أحمد شتيه سالم') {
      imageURL = 'images/35.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'لمياء عاطف عبد الفتاح محمود') {
      imageURL = 'images/36.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'منة الله صبري موسى عبدالرحمن') {
      imageURL = 'images/37.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'إيمان مجدي محمد حامد') {
      imageURL = 'images/38.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'مروة مصطفى عطية') {
      imageURL = 'images/39.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'سما محمود علي') {
      imageURL = 'images/40.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'أحمد هشام نبيه') {
      imageURL = 'images/41.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'أحمد محمد علام') {
      imageURL = 'images/42.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'إسلام محمد ربيع') {
      imageURL = 'images/43.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'حسام صلاح الدين محمد') {
      imageURL = 'images/44.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'أحمد جمال كمال خضير') {
      imageURL = 'images/45.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if (employeeName == 'السعيد فايد محمود') {
    imageURL = 'images/46.png';
    return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if(employeeName == 'محمود جمال عبد الجواد') {
      imageURL = 'images/47.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if(employeeName == 'محمد صلاح عبد الله') {
      imageURL = 'images/48.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if(employeeName == 'ياسر عزت رجب') {
      imageURL = 'images/49.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    else if(employeeName == 'سارة عبد اللطيف محمد') {
      imageURL = 'images/50.png';
      return Image.asset(imageURL, width: 200, height: 200, fit: BoxFit.fill);
    }
    }


  void sendMyImage() {
    // GIS & IoT Images
    if (employeeName == 'سارة ثروت محمد كمال') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/1.png?alt=media&token=c86aeeef-3cb7-482e-ada5-c70808f4dd84';
    }
    else if (employeeName == 'زينب صبحى على حامد') {
      imageURL = 'images/2.png';
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/2.png?alt=media&token=778eb38a-bcee-4111-8581-80d993533756';
    }
    else if (employeeName == 'محمد عادل عبدالباقي عبدالله') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/3.png?alt=media&token=a46a5ac2-9bdb-4799-a2fd-66634cd970c2';
    }
    else if (employeeName == 'فاطمة علي إبراهيم جمال الدين') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/4.png?alt=media&token=67d3d373-7dc4-41dc-9999-e7ec5a961f36';
    }
    else if (employeeName == 'نرمين محمود احمد محمد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/5.png?alt=media&token=c869d3b2-6c5e-4d33-be3f-5eb7045cab28';
    }
    else if (employeeName == 'نوران محمود يحيى') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/6.png?alt=media&token=51237f61-2d4c-45d6-a292-be730264a7e8';
    }
    else if (employeeName == 'كريم وائل عبد المنعم') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/7.png?alt=media&token=29d4a428-6402-4f0e-b4b2-e50f88be0ff0';
    }
    else if (employeeName == 'سوزان علاء الدين مصطفى') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/8.png?alt=media&token=e0d4bea4-f0c8-437c-b8df-4ec4cadcc182';
    }
    else if (employeeName == 'إبراهيم عادل عبد الفتاح') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/9.png?alt=media&token=d8c98653-05b5-4378-adc0-084391d1e697';
    }
    else if (employeeName == 'ضحى ممدوح محمد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/10.png?alt=media&token=bde197c6-262b-4f09-a64e-35ae00c1ae87';
    }
    // Networks Images
    else if (employeeName == 'بسنت فتحي أحمد الرفاعي') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/11.png?alt=media&token=4b552c48-24e3-47a6-9cc2-2789be0ccfff';
    }
    else if (employeeName == 'مى وحيد عصمت حسن') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/12.png?alt=media&token=236ac1bb-b3ef-4207-a5f6-2da54a30b5a1';
    }
    else if (employeeName == 'عنان رأفت محمد زويل') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/13.png?alt=media&token=605ed51b-1fe9-4d91-9c26-3982af82c6b7';
    }
    else if (employeeName == 'محمود جمال محمد إبراهيم') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/14.png?alt=media&token=2aebffb9-0816-43c5-8827-ed9d319e679f';
    }
    else if (employeeName == 'محمد جمال عبدالمنعم عيد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/15.png?alt=media&token=0b5b3995-a22e-453c-b420-1e4c13d341a7';
    }
    else if (employeeName == 'إسلام ابو المجد ابو المجد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/16.png?alt=media&token=5e72ba84-15e6-4032-9d95-f06742d38d36';
    }
    else if (employeeName == 'عمر أسامة عيد إسماعيل') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/17.png?alt=media&token=c9d8d93f-b5dd-4877-81d4-5a9484962119';
    }
    else if (employeeName == 'احمد محمود نعمان محمد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/18.png?alt=media&token=95fa4446-d687-4b37-961d-931a00633591';
    }
    else if (employeeName == 'مصطفى السيد محمد السيد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/19.png?alt=media&token=900b7b64-0949-46cf-8483-97f64cfe3ef8';
    }
    else if (employeeName == 'أحمد محمود محمد العيسوي') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/20.png?alt=media&token=d1ebc335-ea08-47c1-9398-a5bfb1a69f5c';
    }
    else if (employeeName == 'شريف عباس مراد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/21.png?alt=media&token=b4e54c6e-5450-4a41-8bfd-e4058d01100e';
    }
    else if (employeeName == 'محمد خيري صميدة') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/22.png?alt=media&token=9d0fc628-d63b-43a0-a713-d1e54ee3f87d';
    }
    else if (employeeName == 'محمود محمد عبد الغني') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/23.png?alt=media&token=14819a62-88ad-4b96-8a06-5b660c4f18bd';
    }
    // Development Images
    else if (employeeName == 'محمود شكري عبد العظيم حجاب') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/24.png?alt=media&token=0785b25d-2591-48c4-8b28-95d6c6029fb4';
    }
    else if (employeeName == 'عبد المجيد محمد الصاوي') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/25.png?alt=media&token=ada46102-52cd-4524-8eb0-ae83f4b9a052';
    }
    else if (employeeName == 'إبراهيم العراقي الدسوقي') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/26.png?alt=media&token=7f11a63d-0823-43d2-81ee-7d6667157723';
    }
    else if (employeeName == 'محمد عبدالله محمد محمد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/27.png?alt=media&token=9a41ffa0-421f-418f-9ba6-7c023796b0d7';
    }
    else if (employeeName == 'محمد جمال يسن إسماعيل') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/28.png?alt=media&token=b1d5b989-8fe1-4ee1-b96a-a34448a9b559';
    }
    else if (employeeName == 'محمد محمد بلال رزق') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/29.png?alt=media&token=b0416f8d-149f-4a1b-83b0-69f3a084707a';
    }
    else if (employeeName == 'حازم حسن عبدالمجيد الليثي') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/30.png?alt=media&token=46e8f358-5b90-431f-93fa-35f8e0361a0d';
    }
    else if (employeeName == 'مصطفى سيد سنوسي عثمان') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/31.png?alt=media&token=9a1424dc-a297-4e5f-8abb-fe60c17c1e17';
    }
    else if (employeeName == 'عبدالله سعد محمود مصطفى') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/32.png?alt=media&token=3451fd8a-1db6-4f2f-89f1-282e812b5d93';
    }
    else if (employeeName == 'عمرو معز عبدالرحمن شبل') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/33.png?alt=media&token=16704939-0fad-4e48-a752-0ba6d4353d59';
    }
    else if (employeeName == 'بيتر نعيم عزمي بستان') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/34.png?alt=media&token=846acc1a-bdbe-484d-a625-f27377f645ca';
    }
    else if (employeeName == 'محمود أحمد شتيه سالم') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/35.png?alt=media&token=50ef3f3b-3565-4650-8a38-34db98c725cc';
    }
    else if (employeeName == 'لمياء عاطف عبد الفتاح محمود') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/36.png?alt=media&token=815f579a-107e-4a84-bf95-8c6460d90c7e';
    }
    else if (employeeName == 'منة الله صبري موسى عبدالرحمن') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/37.png?alt=media&token=c8f4bde6-efc5-4d4c-bb73-242a5e460514';
    }
    else if (employeeName == 'إيمان مجدي محمد حامد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/38.png?alt=media&token=6e188963-92d3-4ef2-b18e-2e49716dfe06';
    }
    else if (employeeName == 'مروة مصطفى عطية') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/39.png?alt=media&token=7bbc0a31-7b8d-4fc0-a55e-a209298349e6';
    }
    else if (employeeName == 'سما محمود علي') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/40.png?alt=media&token=2a0f44f9-d216-4c9b-8d35-69a3564efc55';
    }
    else if (employeeName == 'أحمد هشام نبيه') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/41.png?alt=media&token=6e6f36b4-84c8-4b0a-8413-76016c4b99d2';
    }
    else if (employeeName == 'أحمد محمد علام') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/42.png?alt=media&token=53b7ff59-2762-4ee1-a6cc-70a300940b7a';
    }
    else if (employeeName == 'إسلام محمد ربيع') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/43.png?alt=media&token=1956dcb4-76fc-4350-ad3a-d7d5ae63117c';
    }
    else if (employeeName == 'حسام صلاح الدين محمد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/44.png?alt=media&token=35f2f15b-bc9b-4056-aacb-672f6b2bd4aa';
    }
    else if (employeeName == 'أحمد جمال كمال خضير') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/45.png?alt=media&token=d4a3b9fc-9ce3-45e6-a4cf-c01272aa776d';
    }
    else if (employeeName == 'السعيد فايد محمود') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/46.png?alt=media&token=5403d756-8fe1-49f5-b117-4e1be73ebff2';
    }
    else if(employeeName == 'محمود جمال عبد الجواد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/47.png?alt=media&token=80e305d3-4876-48ed-bfd0-771bbc4cff85';
    }
    else if(employeeName == 'محمد صلاح عبد الله') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/48.png?alt=media&token=b117ad05-fe85-4884-b9b4-8e349316cd6c';
    }
    else if(employeeName == 'ياسر عزت رجب') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/49.png?alt=media&token=a4f5a21e-c411-49da-8b04-2fcbd366249a';
    }
    else if(employeeName == 'سارة عبد اللطيف محمد') {
      networkImageURL = 'https://firebasestorage.googleapis.com/v0/b/dtc-smart-attendance.appspot.com/o/50.png?alt=media&token=a3aa41da-c7f4-45f8-a59e-ce5738cd7dd9';
    }
  }


  //------------------------------------------------------------------
  //FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  //------------------------------------------------------------------
//  Future notifySchedule(String payload) async{
//    var scheduledNotificationDateTime = new DateTime.now().add(new Duration(seconds: 1));
//    var android1 = new AndroidNotificationDetails('channel id',
//        'channel NAME', 'CHANNEL DESCRIPTION');
//    var iOS1 = new IOSNotificationDetails();
//    NotificationDetails platform = new NotificationDetails(android1, iOS1);
//    await flutterLocalNotificationsPlugin.schedule(
//        0,
//        'DTC',
//        'you have entered !',
//        scheduledNotificationDateTime, platform,payload:payload );
//  }

  //-----------------------------------------------------------------
  @override
  initState() {
    super.initState();
    loadSavedData();
    //getMyImage();
    //flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    //var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    //var iOS = new IOSInitializationSettings();
    //var initSettings = new InitializationSettings(android, iOS);
    //flutterLocalNotificationsPlugin.initialize(initSettings,onSelectNotification: notifySchedule);
  }

//  getCurrentDate(){
//    var date = new DateTime.now().toString();
//    var dateParse = DateTime.parse(date);
//    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
//    finalDate = formattedDate.toString();
//    print(finalDate);
//  }

  loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      employeeName = prefs.getString('employeeName');
      track = prefs.getString('track');
    });
  }

  Future<void> scanQR(bool isAttending) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#32cd32", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    setState(() {
      scanBarcode = barcodeScanRes;
      sendMyImage();
      String currentTime = DateFormat.jm().format(DateTime.now());
      if (scanBarcode == 'DTC') {
        if(isAttending == true) {
            Firestore.instance.collection('DTC Employees').document('$employeeName')
              .setData({
            "Employee Name": employeeName,
            "Track": track,
            "Arrival Time": currentTime,
            "Departure Time": '',
            "Network Image URL": networkImageURL
          });
        }
        else if(isAttending == false) {
          Firestore.instance.collection('DTC Employees').document('$employeeName')
              .updateData({
            "Departure Time": currentTime,
          });
        }
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Passed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700]),
                  ),
                ),
                content: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(Icons.check_circle,
                      color: Colors.green[700], size: 100),
                ),
              );
            });
        //notifySchedule('you have entered !');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Invalid QR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700]),
                  ),
                ),
                content: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(Icons.cancel, color: Colors.red[700], size: 100),
                ),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$track', style: TextStyle(
            fontSize: 24
        ),),
        backgroundColor: Colors.purple[700],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
                child: CircleAvatar(
                  child: getMyImage(),
                  radius: 100,
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Text('$employeeName', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.purple[900],
            )),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.green[700], // button color
                    child: InkWell(
                      splashColor: Colors.purple[700], // inkwell color
                      child: SizedBox(width: 125, height: 125,
                          child: Center(
                              child: Text('Attend',
                                style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 28
                                ),
                              textAlign: TextAlign.center,
                              ),
                          ),
                      ),
                      onTap: (){
                        scanQR(true);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ClipOval(
                  child: Material(
                    color: Colors.red[700], // button color
                    child: InkWell(
                      splashColor: Colors.purple[700], // inkwell color
                      child: SizedBox(width: 125, height: 125,
                        child: Center(
                          child: Text('Leave',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold,
                                fontSize: 28
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: (){
                        arrivalTime = '';
                        departureTime = DateFormat.jm().format(DateTime.now());
                        scanQR(false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
