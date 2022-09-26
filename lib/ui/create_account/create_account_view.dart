import 'package:flutter/material.dart';
import 'package:gymnotes/ui/dumb_widgets/authentication_layout.dart';
import 'package:gymnotes/ui/dumb_widgets/custom_app_bar.dart';
import 'package:gymnotes/ui/shared/styles.dart';
import 'package:gymnotes/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_account_view.form.dart';
import 'create_account_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'fullName'),
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => CreateAccountViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: getAppBar('', []),
          body: AuthenticationLayout(
            busy: viewModel.isBusy,
            onMainButtonTapped: () => viewModel.saveData(),
            validationMessage: viewModel.validationMessage,
            title: 'Create Account',
            subtitle: 'Enter your name, email address and password for sign up.',
            mainButtonTitle: 'SIGN UP',
            form: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                      color: kcForegroundColor,
                    ),
                  ),
                ),
                vSpaceTiny,
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
            showTermsText: false,
          )
        );
      },
    );
  }
}
