import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salongly/ui/screens/authentication/login_page/login_view.dart';
import 'package:salongly/ui/screens/authentication/registration_page/registration_viewmodel.dart';
import 'package:salongly/ui/screens/home_page/home_view.dart';
import 'package:salongly/ui/widgets/error_column.dart';
import 'package:salongly/ui/widgets/text_input.dart';
import 'package:salongly/ui/widgets/top_bar.dart';
import 'package:salongly/ui/widgets/wide_button.dart';

import 'package:stacked/stacked.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewmodel>.reactive(
      viewModelBuilder: () => RegistrationViewmodel(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Topbar(text: "Register"),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(height: 1),
                  TextInputWidget(
                    labelText: 'Email',
                    hint: 'Enter Your Email',
                    onChanged: (value) => model.user.email = value,
                  ),
                  SizedBox(height: 20),
                  TextInputWidget(
                    labelText: 'Name',
                    hint: 'Enter Your Name',
                    onChanged: (value) => model.user.name = value,
                  ),
                  SizedBox(height: 20),
                  TextInputWidget(
                    labelText: 'Mobile Number',
                    hint: 'Enter Your Mobile Number',
                    onChanged: (value) => model.user.phoneNumber = value,
                    isNumber: true,
                  ),
                  SizedBox(height: 20),
                  TextInputWidget(
                    labelText: 'Password',
                    hint: 'Enter Your Password',
                    onChanged: (value) => model.user.password = value,
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  TextInputWidget(
                    labelText: 'Repeat Password',
                    hint: 'Enter Your Repeat Password',
                    onChanged: (value) => model.repeatedPassword = value,
                    isPassword: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(),
                        child: Checkbox(
                            value: model.checked,
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            side: BorderSide(color: Colors.black),
                            onChanged: (newState) => model.checked = newState),
                      ),
                      Text(
                        "I agree to the terms and conditions",
                        style: const TextStyle(
                            color: const Color(0xff212121),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Lato",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),

                  if (model.validatingErrors.isNotEmpty) ErrorList(validatingErrors: model.validatingErrors),
                  SizedBox(height: 30.0),
                  WideButton(
                    text: 'Register',
                    color: Color(0xff78bd76),
                    onTap: () => model.register(context),
                    showWideButton: true,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color(0xff212121),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginView()),
                          );
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Color(0xff78bd76),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView(), settings: RouteSettings()),
                      );
                    },
                    child: Text("Continue as Guest",
                        style: const TextStyle(
                          color: const Color(0xff78bd76),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Lato",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(height: 80.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
