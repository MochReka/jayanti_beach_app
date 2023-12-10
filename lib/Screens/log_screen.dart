import 'package:flutter/material.dart';
import 'package:jayanti_beach_app/constants.dart';
import 'package:jayanti_beach_app/screens/signin_screen.dart';
import 'package:jayanti_beach_app/screens/signup_screen.dart';
import 'package:jayanti_beach_app/theme/theme.dart';
import 'package:jayanti_beach_app/widgets/custom_scaffold.dart';
import 'package:jayanti_beach_app/widgets/welcome_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Jayanti Beach Eksplorer\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                '\nPengalaman Terbaik Berwisata \n Di Pantai Jayanti',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
