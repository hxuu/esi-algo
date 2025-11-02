import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/routes.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => GetMaterialApp(
        title: 'ESI Algo',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteClass.home,
        getPages: RouteClass.routes,
      ),
      designSize: const Size(1440, 1024),
    );
  }
}
