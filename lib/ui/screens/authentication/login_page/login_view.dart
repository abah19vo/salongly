import 'package:flutter/material.dart';
import 'package:salongly/app/theme.dart';
import 'package:salongly/ui/screens/authentication/recover_password_page/recover_password_view.dart';
import 'package:salongly/ui/widgets/costume_loading_indicator.dart';
import 'package:salongly/ui/widgets/error_column.dart';
import 'package:salongly/ui/widgets/text_input.dart';
import 'package:salongly/ui/widgets/top_bar.dart';
import 'package:salongly/ui/widgets/wide_button.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Stack(children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Topbar(
                    text: "Log In",
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                // UPPP
                // SizedBox(height: UiMeasurments.mediumRowSpace),
                Flexible(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: [
                        ///Contains the TextInputs
                        Flexible(
                          flex: 3,
                          child: Column(
                            children: [
                              TextInputWidget(
                                labelText: 'Email',
                                hint: 'Enter Your Email',
                                onChanged: (value) => model.user.email = value,
                              ),
                              SizedBox(height: UiMeasurments.mediumRowSpace),
                              TextInputWidget(
                                labelText: 'Password',
                                hint: 'Enter Your Password',
                                onChanged: (value) => model.user.password = value,
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        if (model.validatingErrors.isNotEmpty) ErrorList(validatingErrors: model.validatingErrors),

                        ///Contains the WideButton and The InkWell
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              WideButton(
                                text: 'Log in',
                                showWideButton: true,
                                onTap: model.login,
                                color: CustomeColors.green,
                              ),
                              SizedBox(height: UiMeasurments.smallRowSpace),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RecoverPasswordView()),
                                  );
                                },
                                child: Text(
                                  'I forget my password',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: CustomeColors.green,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (model.isLoading) CostumeLoadingIndicator(),
        ]),
      ),
    );
  }
}
