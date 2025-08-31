import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';
import 'package:tasky/features/navigation/main_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSvgPicture.withoutColor(
                        path: 'assets/images/logo.svg',
                        height: 42.h,
                        width: 42.w,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "Tasky",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 118),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To Tasky ",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      CustomSvgPicture.withoutColor(
                          path: "assets/images/waving_hand.svg"),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Your productivity journey starts here.",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 24),
                  CustomSvgPicture.withoutColor(
                    path: 'assets/images/welcome.svg',
                    width: 215,
                    height: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: controller,
                          hintText: 'e.g. Sarah Khalid',
                          title: "Full Name",
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please Enter Your Full Name ";
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 40),
                          ),
                          onPressed: () async {
                            if (_key.currentState?.validate() ?? false) {
                              await PreferencesManager().setString(
                                  StorageKey.username, controller.value.text);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return MainScreen();
                                  },
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please Enter Your Full Name"),
                                ),
                              );
                            }
                          },
                          child: Text("Let’s Get Started"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
