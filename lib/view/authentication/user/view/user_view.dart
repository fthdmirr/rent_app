import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../utils/widget/custom_input_widget.dart';
import '../view_model/user_view_model.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: context.paddingNormal,
      child: Column(
        children: [
          context.emptySizedHeightBoxNormal,
          InkWell(
            onTap: () {
              context.read<UserViewModel>().getPhotoFromGallery();
            },
            child: Consumer<UserViewModel>(
              builder: (context, viewModel, _) => CircleAvatar(
                radius: context.dynamicHeight(0.125),
                backgroundColor: const Color(0xffFCDE69),
                foregroundColor: Colors.black.withOpacity(0.7),
                foregroundImage: viewModel.imageFile != null
                    ? FileImage(viewModel.imageFile!)
                    : null,
                child: Icon(
                  Icons.camera_alt,
                  size: context.dynamicHeight(0.1),
                ),
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          CustomInputWidget(
            controller: context.watch<UserViewModel>().getNameController,
            labelText: 'First Name',
          ),
          context.emptySizedHeightBoxLow3x,
          CustomInputWidget(
            controller: context.watch<UserViewModel>().getLastNameController,
            labelText: 'Last Name',
          ),
          context.emptySizedHeightBoxNormal,
          Consumer<UserViewModel>(
            builder: (context, viewModel, _) => viewModel.isDone
                ? ElevatedButton.icon(
                    icon: const Icon(Icons.done),
                    label: Text('Done',
                        style: context.textTheme.button
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      context
                          .read<UserViewModel>()
                          .sendInfosToServiceAndNavigateToHome(context);
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
                  )
                : const CircularProgressIndicator.adaptive(),
          ),
        ],
      ),
    ));
  }
}
