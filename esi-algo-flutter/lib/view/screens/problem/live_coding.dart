import 'package:code_text_field/code_text_field.dart';
import 'package:esi_algo/controller/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/live_controller.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/nav_bar.dart';
import '../../themes/theme.dart';

import 'package:flutter_highlight/themes/an-old-hope.dart';

class LiveCodingScreen extends StatelessWidget {
  final int id;

  LiveCodingScreen({Key? key, required this.id}) : super(key: key);

  final LiveController liveController = Get.put(LiveController());
  final AuthController authController = Get.put(AuthController());
  final GetStorage storage = GetStorage();
  final GlobalKey<ScaffoldState> scafKey = GlobalKey();

  void handleDecrementIndex() {
    liveController.decrementIndex();
    liveController.updateStarterCode();
  }

  void handleIncrementIndex() {
    liveController.incrementIndex();
    liveController.updateStarterCode();
  }

  Widget buildProblemTab(BuildContext context, int index) {
    final controller = liveController;
    final exo = controller.exos[controller.exoIndex];

    controller.input = exo.input;
    controller.output = exo.output;

    switch (index) {
      case 0:
        return Padding(
          padding: EdgeInsets.all(15.r),
          child: Markdown(
            selectable: true,
            data: exo.description,
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontSize: 16.sp,
              ),
              code: TextStyle(
                backgroundColor: Colors.black.withOpacity(0.7),
                fontFamily: GoogleFonts.firaCode().fontFamily,
                fontSize: 14.sp,
                color: WebColor.background,
              ),
            ),
          ),
        );
      case 1:
        return const Center(child: Text("No Hints For Now..."));
      case 2:
        return const Center(child: Text("No Solution For Now..."));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafKey,
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
        sKey: scafKey,
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
              onPressed: () {
                authController.logout();
                Get.offAllNamed(RouteClass.getHome());
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
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 50.r, 50.r),
        child: FloatingActionButton(
          backgroundColor: WebColor.primary,
          onPressed: () => liveController
              .setStdOut(liveController.codeController!.text.toString()),
          tooltip: "Run",
          child: Icon(
            Icons.play_arrow,
            size: 30.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: liveController.getTdExos(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            liveController.startCode =
                liveController.exos[liveController.exoIndex].startCode;

            return Container(
              padding: const EdgeInsets.fromLTRB(40, 25, 40, 40),
              child: GetBuilder<LiveController>(
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: handleDecrementIndex,
                          icon: const Icon(Icons.skip_previous_outlined),
                          iconSize: 30.sp,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "TD°$id - Exercise N°${liveController.exoIndex + 1}",
                          style: TextStyle(
                            fontFamily: GoogleFonts.workSans(
                              fontWeight: FontWeight.w500,
                            ).fontFamily,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        IconButton(
                          onPressed: handleIncrementIndex,
                          icon: const Icon(Icons.skip_next_outlined),
                          iconSize: 30.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Container(
                                padding: EdgeInsets.all(2.r),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: DefaultTabController(
                                  length: 3,
                                  child: Scaffold(
                                    appBar: const TabBar(
                                      unselectedLabelColor: Colors.black,
                                      dividerColor: WebColor.background,
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        color: Colors.black,
                                      ),
                                      indicatorColor: Colors.black,
                                      labelColor: Colors.white,
                                      tabs: [
                                        Tab(
                                          child: Text("Problem"),
                                        ),
                                        Tab(
                                          child: Text("Hint"),
                                        ),
                                        Tab(
                                          child: Text("Solution"),
                                        ),
                                      ],
                                    ),
                                    body: TabBarView(
                                      children: List.generate(
                                        3,
                                        (index) =>
                                            buildProblemTab(context, index),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CodeTheme(
                                data:
                                    const CodeThemeData(styles: anOldHopeTheme),
                                child: CodeField(
                                  textStyle: TextStyle(
                                    fontFamily:
                                        GoogleFonts.firaCode().fontFamily,
                                    fontSize: 16,
                                  ),
                                  controller: liveController.codeController!,
                                  expands: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
