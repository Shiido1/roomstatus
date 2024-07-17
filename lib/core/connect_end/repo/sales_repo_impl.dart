import 'package:roomstatus/core/connect_end/contract/sales_contract_impl.dart';
import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../model/add_sales_entity_model/add_sales_entity_model.dart';
import '../model/add_sales_response_modell/add_sales_response_modell.dart';
import '../model/get_all_items_response_model/get_all_items_response_model.dart';
import '../model/get_all_sales_response_model/get_all_sales_response_model.dart';
import '../model/get_items_category_response_model/get_items_category_response_model.dart';
import '../model/get_single_items_response_model/get_single_items_response_model.dart';
import '../model/single_sales_response_model/single_sales_response_model.dart';
import '../model/update_sales_response_model/update_sales_response_model.dart';

@lazySingleton
class SalesRepoImpl {
  final _contract = locator<SalesContractImpl>();

  Future<GetAllSalesResponseModel> getAllSales({String? page}) async {
    final response = await _contract.getAllSales(page: page);
    return response;
  }

  Future<AddSalesResponseModell> addSale(
      AddSalesEntityModel addSalesEntity) async {
    final response = await _contract.addSales(addSalesEntity);
    return response;
  }

  Future<dynamic> getCustomerType() async {
    final response = await _contract.getCustomerType();
    return response;
  }

  Future<UpdateSalesResponseModel> updateSales(
      String bookingCode, AddSalesEntityModel updateEntity) async {
    final response = await _contract.updateSales(bookingCode, updateEntity);
    return response;
  }

  Future<SingleSalesResponseModel> sinlgeSales(String bookingCode) async {
    final response = await _contract.singleSales(bookingCode);
    return response;
  }

  Future<dynamic> deleteSales(String bookingCode) async {
    final response = await _contract.deleteSales(bookingCode);
    return response;
  }

  Future<GetAllItemsResponseModel> getAllItems({String? page}) async {
    final response = await _contract.allItems(page: page);
    return response;
  }

  Future<GetSingleItemsResponseModel> getSingleItems(String id) async {
    final response = await _contract.singleItem(id);
    return response;
  }

  Future<GetItemsCategoryResponseModelList> getItemCategory() async {
    final response = await _contract.getItemCategory();
    return response;
  }
}
