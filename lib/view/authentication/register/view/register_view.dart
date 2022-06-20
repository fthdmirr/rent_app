import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../../../../utils/widget/custom_input_widget.dart';
import '../../login/view/login_view.dart';

import '../view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: Provider.of<RegisterViewModel>(context).formKey,
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              SizedBox(height: context.dynamicHeight(0.15)),
              Center(
                child: Text(
                  'Create an account',
                  style: context.textTheme.headline6
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              context.emptySizedHeightBoxNormal,
              CustomInputWidget(
                labelText: 'Email Address',
                controller: context.read<RegisterViewModel>().email,
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
                                obscureText: true,

                controller: context.read<RegisterViewModel>().password,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              context.emptySizedHeightBoxLow3x,
              CustomInputWidget(
                labelText: 'Repeat Password',
                obscureText: true,
                controller: context.read<RegisterViewModel>().repeatPassword,
                validator: (String? value) {
                  if (context.read<RegisterViewModel>().repeatPassword.text !=
                      context.read<RegisterViewModel>().password.text) {
                    return 'Passwords must be same';
                  }
                  return null;
                },
              ),
              context.emptySizedHeightBoxNormal,
              Consumer<RegisterViewModel>(
                builder: (context, viewModel, _) => viewModel.isDone
                    ? ElevatedButton(
                        onPressed: () {
                          viewModel.register(context);
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffFCDE69)),
                          minimumSize: MaterialStateProperty.all<Size>(Size(
                              context.dynamicWidth(0.8),
                              context.dynamicHeight(0.06))),
                        ),
                        child: Text(
                          'Create an account',
                          style: context.textTheme.button
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    : const CircularProgressIndicator.adaptive(),
              ),
              context.emptySizedHeightBoxLow3x,
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ));
                },
                child: const Text('Already have an account?',
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black)),
              ),
              context.emptySizedHeightBoxNormal,
              Divider(thickness: context.dynamicHeight(0.0025)),
              context.emptySizedHeightBoxNormal,
              ElevatedButton.icon(
                icon: const Icon(FontAwesomeIcons.github),
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(Size(
                      context.dynamicWidth(0.8), context.dynamicHeight(0.06))),
                ),
                label: const Text('Continue with Github'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
