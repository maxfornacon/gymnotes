import 'package:flutter/material.dart';
import 'package:gymnotes/ui/dumb_widgets/authentication_layout.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: getAppBar('', []),
          body: AuthenticationLayout(
            busy: viewModel.isBusy,
            onMainButtonTapped: viewModel.saveData,
            onCreateAccountTapped: viewModel.navigateToCreateAccount,
            validationMessage: viewModel.validationMessage,
            title: 'Welcome',
            subtitle: 'Enter your email address to sign in',
            mainButtonTitle: 'SIGN IN',
            form: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: kcForegroundColor,
                    ),
                  ),
                ),
                vSpaceTiny,
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: kcForegroundColor,
                      fontSize: 12,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Colors.white10,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: kcForegroundColor,
                  ),
                  cursorColor: kcPrimaryColor,

                ),
                vSpaceRegular,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: kcForegroundColor,
                    ),
                  ),
                ),
                vSpaceTiny,
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,

                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: kcForegroundColor,
                      fontSize: 12,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Colors.white10,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: kcForegroundColor,
                  ),
                  cursorColor: kcPrimaryColor,

                ),
              ],
            ),
            onForgotPassword: () {},
            showTermsText: false,
          )
        );
      },
    );
  }
}
