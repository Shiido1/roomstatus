import 'package:roomstatus/core/connect_end/model/add_sales_response_modell/add_sales_response_modell.dart';
import 'package:roomstatus/core/connect_end/model/get_all_items_response_model/get_all_items_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_all_sales_response_model/get_all_sales_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_items_category_response_model/get_items_category_response_model.dart';
import 'package:roomstatus/core/connect_end/model/get_single_items_response_model/get_single_items_response_model.dart';
import 'package:roomstatus/core/connect_end/model/single_sales_response_model/single_sales_response_model.dart';
import 'package:roomstatus/core/connect_end/model/update_sales_response_model/update_sales_response_model.dart';
import 'package:injectable/injectable.dart';

import '../connect_end/model/add_sales_entity_model/add_sales_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class SalesApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('SalesViewModel');

  //get all sales

  Future<GetAllSalesResponseModel> allSales({String? page}) async {
    try {
      final response = await _service
          .call(UrlConfig.all_sales, RequestMethod.get, data: {"page": page});
      logger.d(response.data);
      return GetAllSalesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //add sales

  Future<AddSalesResponseModell> addSales(
      AddSalesEntityModel addSalesEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.add_sales, RequestMethod.post,
          data: addSalesEntity.toJson());
      logger.d(response.data);
      return AddSalesResponseModell.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //customer type sales

  Future<dynamic> salesCustomerType() async {
    try {
      final response = await _service.call(
        UrlConfig.customer_type,
        RequestMethod.get,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //update sales

  Future<UpdateSalesResponseModel> updateSales(
      String bookingCode, AddSalesEntityModel entity) async {
    try {
      final response = await _service.call(
        '${UrlConfig.all_sales}/$bookingCode/update',
        data: entity.toJson(),
        RequestMethod.put,
      );
      logger.d(response.data);
      return UpdateSalesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  //get single sales

  Future<SingleSalesResponseModel> getSingleSales(String bookingCode) async {
    try {
      final response = await _service.call(
        '${UrlConfig.all_sales}/$bookingCode',
        RequestMethod.get,
      );
      logger.d(response.data);
      return SingleSalesResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
  //delete sales

  Future<dynamic> deleteSales(String bookingCode) async {
    try {
      final response = await _service.call(
        '${UrlConfig.all_sales}/$bookingCode',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //get all items
  Future<GetAllItemsResponseModel> getAllItems({String? page}) async {
    try {
      final response = await _service.call(
          UrlConfig.get_all_items, RequestMethod.get,
          data: {"page": page});
      logger.d(response.data);
      return GetAllItemsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get single item
  Future<GetSingleItemsResponseModel> getSingleItem(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_all_items}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetSingleItemsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  //get get item category
  Future<GetItemsCategoryResponseModelList> getItemCategory() async {
    try {
      final response = await _service.call(
        UrlConfig.get_all_items_categories,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetItemsCategoryResponseModelList.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
