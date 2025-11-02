import 'package:esi_algo/controller/auth_controller.dart';
import 'package:esi_algo/controller/routes.dart';
import 'package:esi_algo/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Scaffold(
      body: Center(
        child: Container(
          height: 490.h,
          width: 550.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 50.w,
              vertical: 40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ESI Algo",
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 27.h),
                Text(
                  "Create New Account",
                  style: TextStyle(
                    fontFamily: GoogleFonts.workSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.sp,
                    ).fontFamily,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 27.h),
                TextBarUsername(
                  textController: controller.usernameController,
                  hintText: "*Username",
                  leading: const Icon(Icons.person),
                ),
                SizedBox(height: 27.h),
                TextBarPassword(
                  textController: controller.passwordController,
                  hintText: "*Password",
                  leading: const Icon(Icons.lock_rounded),
                ),
                SizedBox(height: 27.h),
                TextButton(
                  onPressed: () async {
                    if (controller.usernameController.text.isEmpty ||
                        controller.passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Please fill in all the fields",
                        backgroundColor: const Color(0xffd1495b),
                        borderRadius: 15.r,
                        margin: EdgeInsets.all(15.r),
                        snackPosition: SnackPosition.TOP,
                      );
                      return;
                    }
                    await controller.createUser(
                      controller.usernameController.text,
                      controller.passwordController.text,
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 27.h),
                Column(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontFamily: GoogleFonts.workSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp,
                        ).fontFamily,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextButton(
                      onPressed: () => Get.toNamed(RouteClass.getLogin()),
                      child: Text(
                        "Login Here",
                        style: TextStyle(
                          fontFamily: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ).fontFamily,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "© 2023 ESI Algo",
              style: TextStyle(
                fontFamily: GoogleFonts.workSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.sp,
                ).fontFamily,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 40.w),
            Text(
              "API",
              style: TextStyle(
                fontFamily: GoogleFonts.workSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.sp,
                ).fontFamily,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 40.w),
            Text(
              "Contact Us",
              style: TextStyle(
                fontFamily: GoogleFonts.workSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.sp,
                ).fontFamily,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextBarPassword extends StatelessWidget {
  final String hintText;
  final Icon leading;
  final bool? isObscure;
  final TextEditingController textController;

  const TextBarPassword({
    super.key,
    required this.hintText,
    required this.leading,
    this.isObscure,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => TextFormField(
        controller: textController,
        style: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.workSans(
            fontWeight: FontWeight.w300,
            fontSize: 18.sp,
          ).fontFamily,
        ),
        cursorColor: Colors.black,

        // password related
        obscureText: controller.isObscure,
        obscuringCharacter: '*',

        // decoration of text field
        decoration: InputDecoration(
          filled: true,
          fillColor: WebColor.background,

          // hintText & hintStyle
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.workSans(
              fontWeight: FontWeight.w300,
              fontSize: 18.sp,
            ).fontFamily,
          ),

          // prefix-suffix icons
          prefixIcon: leading,
          prefixIconColor: Colors.black,

          suffixIcon: controller.isObscure
              ? IconButton(
                  onPressed: () => controller.toggleObscure(),
                  icon: const Icon(Icons.visibility_off),
                )
              : IconButton(
                  onPressed: () => controller.toggleObscure(),
                  icon: const Icon(Icons.visibility),
                ),
          suffixIconColor: Colors.black,

          // border: OutlineInputBorder
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
        ),
      ),
    );
  }
}

class TextBarUsername extends StatelessWidget {
  final String hintText;
  final Icon leading;
  final TextEditingController textController;

  const TextBarUsername({
    super.key,
    required this.hintText,
    required this.leading,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => TextFormField(
        controller: textController,
        style: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.workSans(
            fontWeight: FontWeight.w300,
            fontSize: 18.sp,
          ).fontFamily,
        ),
        cursorColor: Colors.black,

        // decoration of text field
        decoration: InputDecoration(
          filled: true,
          fillColor: WebColor.background,

          // hintText & hintStyle
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.workSans(
              fontWeight: FontWeight.w300,
              fontSize: 18.sp,
            ).fontFamily,
          ),

          // prefix-suffix icons
          prefixIcon: leading,
          prefixIconColor: Colors.black,

          // border: OutlineInputBorder
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: WebColor.primary),
          ),
        ),
      ),
    );
  }
}
