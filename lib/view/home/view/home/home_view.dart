// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'home_view_view_model.dart';

class HomeView extends HomeViewViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: CustomAppBar(context),
      body: AdList(size),
    );
  }

  // ignore: non_constant_identifier_names
  ListView AdList(Size size) {
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: ((context, index) => Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.width * 0.05),
            child: Container(
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26), color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26)),
                    child: Image.network(
                      models[index].productImages![0],
                      height: size.height * 0.25,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    child: Text(
                      models[index].name!,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${models[index].city} - ${models[index].district}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              '${models[index].price!.toString()}₺',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              '/Saat',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  AppBar CustomAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'AltoRent',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context,
                'productViewRoute');
              },
              icon: Icon(Icons.add_box_outlined))
        ],
        leading: IconButton(
          icon: Icon(Icons.refresh_outlined),
          onPressed: () {
            fetchAllData();
          },
        ));
  }
}
