import 'package:flutter/material.dart';
import 'package:gymnotes/ui/dumb_widgets/responsive_card.dart';
import 'package:gymnotes/ui/dumb_widgets/rounded_button.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  final void Function()? onMainButtonTapped;
  final void Function()? onCreateAccountTapped;
  final void Function()? onForgotPassword;
  final void Function()? onBackPressed;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.mainButtonTitle,
    required this.form,
    required this.showTermsText,
    required this.onMainButtonTapped,
    this.onCreateAccountTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.validationMessage,
    required this.busy
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveCard(
      child: ListView(
        children: [
          if (onBackPressed != null) vSpaceRegular,
          if (onBackPressed != null) IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            onPressed: onBackPressed,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 34,
              color: kcForegroundColor,
            )
          ),
          vSpaceSmall,
          SizedBox(
            width: screenWidthPercentage(context, percentage: 0.7),
            child: Text(
              subtitle,
              style: ktsMediumGreyBodyText,
            )
          ),
          vSpaceRegular,
          form,
          vSpaceRegular,
          if (onForgotPassword != null) Align(
            alignment: Alignment.centerRight,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onForgotPassword,
                child: Text(
                  'Forgot Password?',
                  style: ktsMediumGreyBodyText.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          vSpaceRegular,
          if (validationMessage != null) Text(
            validationMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: kBodyTextSize
            )
          ),
          if (validationMessage != null) vSpaceRegular,
          RoundedButton(
            onPressed: onMainButtonTapped,
            child: busy
                ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
                : Text(
                mainButtonTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: kBodyTextSize
                )
            ),
          ),
          vSpaceRegular,
          if (onCreateAccountTapped != null) GestureDetector(
            onTap: onCreateAccountTapped,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: kcForegroundColor
                  ),
                ),
                hSpaceTiny,
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                      color: kcPrimaryColor,
                    ),
                  ),
                )
              ],
            )
          ),
          if (showTermsText) const Text(
            'By continuing, you agree to our Terms of Service and Privacy Policy',
            style: ktsMediumGreyBodyText,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
