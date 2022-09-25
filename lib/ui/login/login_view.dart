import 'package:flutter/material.dart';
import 'package:gymnotes/ui/dumb_widgets/authentication_layout.dart';
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
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
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
