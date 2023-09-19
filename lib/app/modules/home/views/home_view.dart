import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<HomeController>(builder: (controller) {
          return Text(controller.token);
        }),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: GetBuilder<HomeController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: controller.onTapLogout,
              )
            ],
          );
        }),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return GridView.builder(
          controller: controller.scroll,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: controller.listDataPokemon.length,
          itemBuilder: (BuildContext context, int index) {
            var data = controller.listDataPokemon[index];
            return Card(
              color: Colors.amber,
              child: Center(
                child: Text(
                  data.name,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
