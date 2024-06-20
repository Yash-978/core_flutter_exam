import '../Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../Screens/showdetail.dart';

class AppRoutes
{
  static Map<String,Widget Function (BuildContext)>routes={

    '/':(context)=>HomeScreen(),
    '/detail':(context)=>ShowDetail(),


  };
}




/*ByteData? imgbyteData = await image.toByteData(
                                  format: ui.ImageByteFormat.png);
                                  final path = getApplicationDocumentsDirectory();

                              Uint8List img = imgbyteData!.buffer.asUint8List();

                              File file = File('${path}/img.png');

                              file.writeAsBytes(img);

                              ShareExtend.share(file.path, "IMG");



                              */