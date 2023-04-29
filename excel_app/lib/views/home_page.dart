import 'package:excel_app/view_model/view_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<ViewModelController> {
  final ViewModelController viewModelController =
      Get.put(ViewModelController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data List'),
      ),
      body: viewModelController.obx(
        (state) => ListView.builder(
            itemCount: viewModelController.excelDataList.length,
            itemBuilder: (context, index) {
              final data = viewModelController.excelDataList[index];
              return ListTile(
                title: Text(data.name ?? ''),
                subtitle: Text(
                    'Email: ${data.email}, \nPhone Number: ${data.phoneNumber},\nDistance: ${data.distance}, \nPostCode: ${data.postcode} '),
              );
            },
            ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: (error) => Text(error ?? ''),
            onEmpty: const Center(
            child: Text(
            "No result found",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),   
      ),
    );
  }
}
