import 'package:roomstatus/core/api_folder/sales_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/add_sales_entity_model/add_sales_entity_model.dart';
import '../model/add_sales_response_modell/add_sales_response_modell.dart';
import '../model/get_all_items_response_model/get_all_items_response_model.dart';
import '../model/get_all_sales_response_model/get_all_sales_response_model.dart';
import '../model/get_items_category_response_model/get_items_category_response_model.dart';
import '../model/get_single_items_response_model/get_single_items_response_model.dart';
import '../model/single_sales_response_model/single_sales_response_model.dart';
import '../model/update_sales_response_model/update_sales_response_model.dart';

class SalesContractImpl {
  final _api = locator<SalesApi>();

  Future<GetAllSalesResponseModel> getAllSales({String? page}) async =>
      await _api.allSales(page: page);
  Future<AddSalesResponseModell> addSales(
          AddSalesEntityModel addSalesEntity) async =>
      await _api.addSales(addSalesEntity);
  Future<dynamic> getCustomerType() async => await _api.salesCustomerType();
  Future<UpdateSalesResponseModel> updateSales(
          String bookingCode, AddSalesEntityModel updateEntity) async =>
      await _api.updateSales(bookingCode, updateEntity);
  Future<SingleSalesResponseModel> singleSales(String bookingCode) async =>
      await _api.getSingleSales(bookingCode);
  Future<dynamic> deleteSales(String bookingCode) async =>
      await _api.deleteSales(bookingCode);
  Future<GetAllItemsResponseModel> allItems({String? page}) async =>
      await _api.getAllItems(page: page);
  Future<GetSingleItemsResponseModel> singleItem(String id) async =>
      await _api.getSingleItem(id);
  Future<GetItemsCategoryResponseModelList> getItemCategory() async =>
      await _api.getItemCategory();
}
