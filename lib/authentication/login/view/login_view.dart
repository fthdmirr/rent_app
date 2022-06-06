import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:rent_app/utils/widget/custom_input_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            SizedBox(height: context.dynamicHeight(0.15)),
            Center(
              child: Text(
                'Login an account',
                style: context.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            context.emptySizedHeightBoxNormal,
            CustomInputWidget(
              labelText: 'Email Address',
              controller: TextEditingController(),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            context.emptySizedHeightBoxLow3x,
            CustomInputWidget(
              labelText: 'Password',
              controller: TextEditingController(),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            context.emptySizedHeightBoxNormal,
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xffFCDE69)),
                minimumSize: MaterialStateProperty.all<Size>(Size(
                    context.dynamicWidth(0.8), context.dynamicHeight(0.06))),
              ),
              child: const Text('Login an account'),
            ),
            context.emptySizedHeightBoxNormal,
            ElevatedButton.icon(
              icon: const Icon(FontAwesomeIcons.github),
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size>(Size(
                    context.dynamicWidth(0.8), context.dynamicHeight(0.06))),
              ),
              label: const Text('Continue with Github'),
            ),
          ],
        ),
      ),
    );
  }
}
