import 'package:esi_algo/view/screens/auth/sign_in.dart';
import 'package:esi_algo/view/screens/auth/sign_up.dart';
import 'package:esi_algo/view/widgets/custom_app_bar.dart';
import 'package:esi_algo/view/widgets/nav_bar.dart';
import 'package:esi_algo/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const Color primaryColor = WebColor.primary;
  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: GoogleFonts.workSans().fontFamily,
    fontSize: 16.sp,
  );
  static EdgeInsetsGeometry containerPadding =
      EdgeInsets.fromLTRB(0.w, 200.h, 0.w, 0.h);
  static BorderRadius buttonBorderRadius =
      BorderRadius.all(Radius.circular(15.r));

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scafKey = GlobalKey<ScaffoldState>();

    PreferredSizeWidget buildAppBar() {
      return CustomAppBar(
        sKey: scafKey,
        titleWidget: Text(
          "Welcome to ESI Algo!",
          style: WebTextStyle.navBarTextStyle,
          textAlign: TextAlign.center,
        ),
        leading: Icons.menu,
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Get.off(() => LoginPage()),
              child: Text(
                "Login",
                style: buttonTextStyle.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(width: 16.w),
            TextButton(
              onPressed: () => Get.off(() => const SignUpPage()),
              child: Text(
                "Get Started",
                style: buttonTextStyle.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildBody() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 72.w),
          Container(
            width: 580.w,
            padding: containerPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome to ESI Algo",
                  style: WebTextStyle.bigTextStyle,
                ),
                SizedBox(height: 55.h),
                Text(
                  "Your go-to destination for mastering Data Structures and Algorithms concepts and acing your exams!",
                  style: WebTextStyle.midTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55.h),
                Text(
                  "Our platform is a dedicated clone of the popular coding website LeetCode.",
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: WebColor.background,
                        minimumSize: Size(50.w, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: buttonBorderRadius,
                        ),
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      onPressed: () => Get.off(() => LoginPage()),
                      child: Text(
                        "Login",
                        style: buttonTextStyle,
                      ),
                    ),
                    SizedBox(width: 55.w),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: primaryColor,
                        minimumSize: Size(50.w, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: buttonBorderRadius,
                        ),
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      onPressed: () => Get.off(() => const SignUpPage()),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              "../assets/landing.svg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    }

    Widget buildBottomNavigationBar() {
      return Container(
        height: 50.h,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "© 2023 ESI Algo",
              style: WebTextStyle.smallTextStyle,
            ),
            SizedBox(width: 40.w),
            Text(
              "API",
              style: WebTextStyle.smallTextStyle,
            ),
            SizedBox(width: 40.w),
            Text(
              "Contact Us",
              style: WebTextStyle.smallTextStyle,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: WebColor.background,
      key: scafKey,
      drawer: const NavBar(
        firstLeading: Icon(Icons.login),
        secondLeading: Icon(Icons.app_registration),
        firstTitle: Text("Login"),
        secondTitle: Text("Get Started"),
      ),
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
