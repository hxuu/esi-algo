import 'package:esi_algo/controller/auth_controller.dart';
import 'package:esi_algo/controller/pset_controller.dart';
import 'package:esi_algo/view/home.dart';
import 'package:esi_algo/view/screens/problem/live_coding.dart';
import 'package:esi_algo/view/widgets/custom_app_bar.dart';
import 'package:esi_algo/view/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/theme.dart';

class ProblemSetPage extends StatelessWidget {
  ProblemSetPage({Key? key}) : super(key: key);

  final GetStorage storage = GetStorage();
  final AuthController authController = Get.put(AuthController());
  final PsetController psetController = Get.put(PsetController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WebColor.background,
      key: scaffoldKey,
      drawer: NavBarLogged(
        username: storage.read('username'),
        image: Image.asset(
          "../assets/user.png",
        ),
        firstLeading: const Icon(Icons.logout),
        secondLeading: const Icon(Icons.info_outline_rounded),
        firstTitle: const Text("Logout"),
        secondTitle: const Text("About Us"),
      ),
      appBar: CustomAppBar(
        sKey: scaffoldKey,
        titleWidget: Center(
          child: Text(
            "Welcome Back, ${storage.read('username')}!",
            style: TextStyle(
              fontFamily: GoogleFonts.workSans(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ).fontFamily,
            ),
          ),
        ),
        leading: Icons.menu,
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: WebColor.primary,
                disabledForegroundColor: Colors.blue.withOpacity(0.38),
                disabledBackgroundColor: Colors.blue.withOpacity(0.12),
                minimumSize: Size(50.w, 50.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
              onPressed: () {
                authController.logout();
                Get.offAll(() => const HomePage());
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  fontFamily: GoogleFonts.workSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ).fontFamily,
                ),
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: psetController.getTds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "List Of All TD/TP/EMD",
                    style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontSize: 56.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  TableExo(controller: psetController),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class TableExo extends StatelessWidget {
  final PsetController controller;

  const TableExo({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      clipBehavior: Clip.antiAlias,
      border: TableBorder.all(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.r),
      ),
      headingRowColor: MaterialStateProperty.all(Colors.grey),
      dividerThickness: 16.sp,
      headingTextStyle: WebTextStyle.smallTextStyle,
      dataTextStyle: WebTextStyle.smallTextStyle,
      columns: [
        DataColumn(
          label: Text(
            "Semester",
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            "TD/TP/EMD",
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            "Topic",
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            "Status",
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
        ),
        const DataColumn(label: Text("")),
      ],
      rows: [
        for (int i = 0; i < controller.pset.length; i++)
          DataRow(
            cells: [
              DataCell(Text(
                "S${controller.pset[i].semester.toString()}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                controller.pset[i].title.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                controller.pset[i].topic.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                "X",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(
                TextButton(
                  onPressed: () =>
                      Get.to(() => LiveCodingScreen(id: controller.pset[i].id)),
                  child: Text(
                    "Try",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
