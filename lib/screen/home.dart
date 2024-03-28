import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/user_controller.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    List<UserModel> userList = controller.userList;
    return Scaffold(
      appBar: AppBar(title:const Text("Getx Demo"),),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child:  CircularProgressIndicator())
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blue[200],
                      child: ListTile(
                        title: Text(
                          '${userList[index].firstName}  ${userList[index].lastName}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          '${userList[index].email}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                             userList[index].avatar.toString()),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}