import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:rent_app/profile/view_model/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text('My Profile'),
        ),
        body: Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.emptySizedHeightBoxNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  Text(
                    'Edward Larry',
                    style: context.textTheme.headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.pencil,
                      ))
                ],
              ),
              context.emptySizedHeightBoxLow3x,
              Text(
                'My Products',
                style: context.textTheme.bodyText2
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxLow,
              SizedBox(
                height: context.dynamicHeight(0.175),
                width: double.infinity,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    width: context.dynamicWidth(0.45),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.dynamicWidth(0.05)),
                      color: Colors.red,
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: context.lowValue),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              TextButton(
                onPressed: () {
                  context
                      .read<ProfileViewModel>()
                      .logoutAndNavigateToRegister(context);
                },
                child: Text('Log Out',
                    style: context.textTheme.bodyText1?.copyWith(
                        color: Colors.red, fontWeight: FontWeight.w800)),
              )
            ],
          ),
        ));
  }
}
