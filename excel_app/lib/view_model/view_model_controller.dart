import 'package:excel_app/models/excel_data_model.dart';
import 'package:excel_app/network/api_remote_service.dart';
import 'package:get/get.dart';

class ViewModelController extends GetxController
    with StateMixin<List<ExcelDataModel>> {
  RxList<ExcelDataModel> excelDataList = RxList();
  final ApiRemoteService apiRemoteService = ApiRemoteService();

  @override
  void onInit() {
    super.onInit();
    getExcelData();
  }

  void getExcelData() async {
    try {
      final getExcelData = await apiRemoteService.fetchExcelData();
      excelDataList.value = getExcelData;
      if (excelDataList.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(excelDataList, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}





// import 'dart:developer';
// import 'dart:io';

// import 'package:excel_app/models/excel_data_model.dart';
// import 'package:get/get.dart';
// import 'package:excel/excel.dart';

// class ViewModelController extends GetxController
//     with StateMixin<List<ExcelDataModel>> {
//   RxList<ExcelDataModel> excelDataList = RxList();
//   // var dataList = <ExcelDataModel>[].obs;

//   @override
//   void onInit() {
//     fetchExcelData();
//     super.onInit();
//   }

//   void fetchExcelData() async {
//     try {
//       final excel = Excel.decodeBytes(
//           await File('C:\\Users\\User\\Downloads\\Programs\\DL.xlsx')
//               .readAsBytes());
//       final sheetName = excel.tables['Sheet'];

//       if (sheetName != null) {
//         for (dynamic row in sheetName.rows) {
//           final name = row[0]?.value ?? 0;
//           final email = row[1]?.value ?? 0;
//           final phoneNumber = row[2]?.value ?? 0;
//           final distance = row[3]?.value ?? 0;
//           final postcode = row[4]?.value ?? 0;

//           excelDataList.add(ExcelDataModel(
//               name: name.toString(),
//               email: email.toString(),
//               phoneNumber: phoneNumber.toString(),
//               distance: distance.toString(),
//               postcode: postcode.toString()));

//           change(excelDataList, status: RxStatus.success());

//         }
//       } else if (excelDataList.isEmpty) {
//             change(null, status: RxStatus.empty());
//           } else {
//         throw Exception("sheet is null");
//       }
//     } catch (e) {
//       change(null, status: RxStatus.error(e.toString()));
//     }
//   }
// }