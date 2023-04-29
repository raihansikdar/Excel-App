import 'package:excel_app/models/excel_data_model.dart';

abstract class ApiRepository {
  Future<List<ExcelDataModel>> fetchExcelData();
}
