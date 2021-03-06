import 'package:flutter/material.dart';
import 'package:salongly/app/theme.dart';
import 'package:salongly/ui/screens/authentication/recover_password_page/recover_password_viewmodel.dart';
import 'package:salongly/ui/widgets/error_column.dart';
import 'package:salongly/ui/widgets/text_input.dart';
import 'package:salongly/ui/widgets/top_bar.dart';
import 'package:salongly/ui/widgets/wide_button.dart';
import 'package:stacked/stacked.dart';

class RecoverPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecoverPasswordViewModel>.reactive(
      viewModelBuilder: () => RecoverPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Topbar(
                  text: "Recover Password",
                  onTap: () => Navigator.pop(context),
                ),
              ),
              // UPPP
              // SizedBox(height: UiMeasurments.mediumRowSpace),
              Flexible(
                flex: 4,
                child: Container(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Column(
                          children: [
                            TextInputWidget(
                              labelText: 'Email',
                              hint: 'Enter Your Email',
                              onChanged: (value) => model.user.email = value,
                            ),
                            SizedBox(height: UiMeasurments.mediumRowSpace),
                            Text(
                                '''Please provide the email address you used to register.\nWe will send you an email.\nWith a link to reset your password''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: CustomeColors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            // Text('We will send you an email.'),
                            // Text('with a link to reset your password')
                          ],
                        ),
                      ),
                      if (model.validatingErrors.isNotEmpty) ErrorList(validatingErrors: model.validatingErrors),
                      if (model.isSent)
                        Text(
                          'A reset password is sent',
                          style: TextStyle(
                            fontFamily: 'ITCAvantGardeStd-Bold',
                            color: CustomeColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      Flexible(
                        flex: 1,
                        child: WideButton(
                          text: 'Send',
                          showWideButton: true,
                          onTap: () => model.userService.recoverPassword(model.user),
                          color: CustomeColors.green,
                        ),
                      ),
                      SizedBox(height: UiMeasurments.smallRowSpace),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
