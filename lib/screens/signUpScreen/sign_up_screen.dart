import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/screens/homeScreen/home_screen.dart';
import 'package:job_portal/screens/loginScreen/login_screen.dart';
import 'package:job_portal/screens/mainScreen/main_screen.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends HookWidget {
  static const String routeName = "signUP";
  SignUpScreen({super.key});

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final checked = useState(false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Lottie.asset(
              "assets/lottie/fluid-top.json",
              height: height(context) * .4,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            "0,25,15,15".padding(
              SizedBox(
                height: height(context),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Lottie.asset(
                      //   "assets/lottie/employers.json",
                      //   height: 150,
                      //   width: 150,
                      //   fit: BoxFit.cover,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Sign Up",
                        style: fontSize.headline3(
                          context,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Created an account and get started!!.",
                        style: fontSize.titleSmall(
                          context,
                          color: Colors.black54,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      customTextField(
                        _firstnameController,
                        labelText: "First Name",
                      ),
                      customTextField(
                        _lastnameController,
                        labelText: "Last Name",
                      ),
                      customTextField(
                        _mobileController,
                        labelText: "Mobile",
                      ),
                      customTextField(
                        _emailController,
                        labelText: "Email",
                      ),
                      customTextField(
                        _passwordController,
                        labelText: "Password",
                        hintText: "",
                      ),
                      // Spacer(),
                      Row(
                        children: [
                          Checkbox(
                            value: checked.value,
                            onChanged: ((value) {
                              checked.value = value!;
                            }),
                          ),
                          privacyPolicy(),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      customButtonWidget(
                        context,
                        () {
                          Navigator.pushNamed(context, MainScreen.routeName);
                        },
                        width: width(context),
                        height: 65,
                        title: "Logg In",
                        fontSize: 20,
                        color: blackColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'forgot password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: blackColor,
                            ),
                            children: [
                              const TextSpan(
                                text: "I have an account ",
                              ),
                              TextSpan(
                                text: "Logg-in here.".toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  color: redColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      LoginScreen.routeName,
                                      (route) {
                                        return false;
                                      },
                                    );
                                    print('register here.');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

privacyPolicy() => RichText(
      text: TextSpan(
        style: TextStyle(
          color: blackColor,
        ),
        children: [
          TextSpan(
            text: "I agree to ",
          ),
          TextSpan(
            text: "Usage terms",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Usage terms');
              },
          ),
          TextSpan(
            text: " and ",
          ),
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Privacy Policy');
              },
          ),
        ],
      ),
    );
