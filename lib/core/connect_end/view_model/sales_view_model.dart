// ignore_for_file: unrelated_type_equality_checks

import 'package:roomstatus/core/connect_end/model/get_all_items_response_model/get_all_items_response_model.dart';
import 'package:roomstatus/core/connect_end/repo/sales_repo_impl.dart';
import 'package:roomstatus/core/core_folder/app/app.router.dart';
import 'package:roomstatus/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import "package:collection/collection.dart";
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validation.dart';
import '../../../ui/widgets/button_widget.dart';
import '../../../ui/widgets/text_form_widget.dart';
import '../../../ui/widgets/text_widget.dart';
import '../../constants.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/add_sales_entity_model/add_sales_entity_model.dart';
import '../model/add_sales_entity_model/item.dart';
import '../model/add_sales_response_modell/add_sales_response_modell.dart';
import '../model/get_all_items_response_model/datum.dart';
import '../model/get_all_sales_response_model/sale.dart';
import '../model/get_all_sales_response_model/get_all_sales_response_model.dart';
import '../model/get_items_category_response_model/get_items_category_response_model.dart';
import '../model/get_single_items_response_model/get_single_items_response_model.dart';
import '../model/single_sales_response_model/single_sales_response_model.dart';
import '../model/update_sales_response_model/update_sales_response_model.dart';
import 'package:roomstatus/core/connect_end/model/add_sales_entity_model/item.dart'
    as add;
import 'package:roomstatus/core/connect_end/model/single_sales_response_model/item.dart'
    as sales;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'booking_view_model.dart';

class SalesViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('SalesViewModel');

  final repositoryImply = SalesRepoImpl();
  bool? _isLoading;
  bool? get isLoading => _isLoading;

  bool isItemTapped = false;

  List<Datum>? _getAllItemsResponseModelList;
  List<Datum>? get getAllItemsResponseModelList =>
      _getAllItemsResponseModelList;
  // ignore: prefer_final_fields
  List<Datum> _getAllItemsList = [];
  List<Datum> get getAllItemsList => _getAllItemsList;
  List<Datum>? _getAllItemsResponseModelListCopy;
  GetAllItemsResponseModel? _getAllItemsResponseModel;
  GetAllItemsResponseModel? get getAllItemsResponseModel =>
      _getAllItemsResponseModel;
  GetSingleItemsResponseModel? _getSingleItemResponseModel;
  GetSingleItemsResponseModel? get getSingleItemResponseModel =>
      _getSingleItemResponseModel;
  GetItemsCategoryResponseModel? _getCategoryItemResponseModel;
  GetItemsCategoryResponseModel? get getCategoryItemResponse =>
      _getCategoryItemResponseModel;
  GetItemsCategoryResponseModelList? _getCategoryItemResponseModelList;
  GetItemsCategoryResponseModelList? get getCategoryItemResponseList =>
      _getCategoryItemResponseModelList;
  GetAllSalesResponseModel? get getAllSalesResponseModel =>
      _getAllSalesResponseModel;
  GetAllSalesResponseModel? _getAllSalesResponseModel;
  List<Sale>? get getAllSalesResponseModelList => _getAllSalesResponseModelList;
  List<Sale>? _getAllSalesResponseModelList = [];
  List<Sale>? _getAllSalesResponseModelListCopy;
  AddSalesResponseModell? get addSalesResponseModel => _addSalesResponseModel;
  AddSalesResponseModell? _addSalesResponseModel;
  UpdateSalesResponseModel? get updateSalesResponseModel =>
      _updateSalesResponseModel;
  UpdateSalesResponseModel? _updateSalesResponseModel;
  SingleSalesResponseModel? get singleSalesResponseModel =>
      _singleSalesResponseModel;
  SingleSalesResponseModel? _singleSalesResponseModel;

  int page = 1;
  int pageAllSales = 1;
  bool isLoadNoMore = false;
  bool isLoadNoMoreSales = false;

  final pdf = pw.Document();

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController customerType = TextEditingController();
  TextEditingController selectRoom = TextEditingController();
  TextEditingController item = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController paymode = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController total = TextEditingController();

  RefreshController refreshController = RefreshController();

  String bookingId = 'null';

  bool onTapItem = false;

  bool onTap1 = false;
  bool onTapCustomer = false;
  bool onTapRoom = false;

  bool onTapItemSales = false;
  List<add.Item> addedItemListSales = [];
  List<sales.Item> addedItemListSingleSales = [];
  List<String> customerKind = ["guest", "in-room guest"];
  String s = "in-room guest";

  List<String> _itemList = [];
  List<String> get itemList => _itemList;

  List<Datum> addedItemList = [];
  List<Item> _items = [];
  List<Item> get items => _items;

  SalesViewModel({this.context});

  Future<void> getItems(contxt) async {
    try {
      _isLoading = true;
      _getAllItemsResponseModel = await runBusyFuture(
          repositoryImply.getAllItems(page: page.toString()),
          throwException: true);
      _getAllItemsResponseModelList = _getAllItemsResponseModel!.data!;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_getAllItemsResponseModel!.data!.length <
        _getAllItemsResponseModel!.meta!.total!) {
      page++;
      try {
        _getAllItemsResponseModel = await runBusyFuture(
            repositoryImply.getAllItems(page: page.toString()));
        _getAllItemsResponseModelListCopy!
            .addAll(_getAllItemsResponseModel!.data!);
        _getAllItemsResponseModelList!
            .addAll(_getAllItemsResponseModelListCopy!);
        _getAllItemsResponseModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMore = true;
      null;
    }
    notifyListeners();
  }

  groupItems(item) {
    Map<String?, List<Datum>> groupedValue;
    groupedValue =
        groupBy(getAllItemsResponseModel!.data!, (obj) => obj.category);
    _getAllItemsList.clear();
    _itemList.clear();
    if (item == 'all') {
      _getAllItemsList.addAll(getAllItemsResponseModel!.data!);
      _itemList.add(item);
    } else {
      _getAllItemsList.addAll(groupedValue[item]!);
      _itemList.add(item);
    }

    print('$item   $_getAllItemsList and $_itemList, $groupedValue');
    notifyListeners();
  }

  Future<void> getSingleItem(contxt, String id) async {
    try {
      _isLoading = true;
      _getSingleItemResponseModel = await runBusyFuture(
          repositoryImply.getSingleItems(id),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getCategoryItems(contxt) async {
    try {
      _isLoading = true;
      _getCategoryItemResponseModelList = await runBusyFuture(
          repositoryImply.getItemCategory(),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllSales(contxt) async {
    try {
      _isLoading = true;
      _getAllSalesResponseModel = await runBusyFuture(
          repositoryImply.getAllSales(),
          throwException: true);
      _getAllSalesResponseModelList = _getAllSalesResponseModel!.data!.sales;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefreshAllSales() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoadingAllSales() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_getAllSalesResponseModel!.data!.sales!.length <
        _getAllSalesResponseModel!.meta!.total!) {
      pageAllSales++;
      try {
        _getAllSalesResponseModel = await runBusyFuture(
            repositoryImply.getAllSales(page: page.toString()));
        _getAllSalesResponseModelListCopy!
            .addAll(_getAllSalesResponseModel!.data!.sales!);
        _getAllSalesResponseModelList!
            .addAll(_getAllSalesResponseModelListCopy!);
        _getAllSalesResponseModelListCopy?.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMoreSales = true;
      null;
    }
    notifyListeners();
  }

  Future<void> addSales(contxt, AddSalesEntityModel addSalesEntity) async {
    try {
      _isLoading = true;
      _addSalesResponseModel = await runBusyFuture(
          repositoryImply.addSale(addSalesEntity),
          throwException: true);
      _isLoading = false;
      await AppUtils.snackbar(contxt,
          message: _addSalesResponseModel?.message ?? '');
      if (_addSalesResponseModel?.success == true) {
        _items.clear();
        navigate.navigateTo(Routes.singleSaleDetailsScreen,
            arguments: SingleSaleDetailsScreenArguments(
                code: _addSalesResponseModel!.data!.code));
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateSales(
      contxt, String bookingCode, AddSalesEntityModel updateEntity) async {
    try {
      _isLoading = true;
      _updateSalesResponseModel = await runBusyFuture(
          repositoryImply.updateSales(bookingCode, updateEntity),
          throwException: true);
      _isLoading = false;
      AppUtils.snackbar(contxt,
          message: _updateSalesResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getSingleSales(contxt, String code) async {
    try {
      _isLoading = true;
      _singleSalesResponseModel = await runBusyFuture(
          repositoryImply.sinlgeSales(code),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteSales(contxt, String code) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.deleteSales(code),
          throwException: true);
      _isLoading = false;
      AppUtils.snackbar(contxt,
          message: 'Sales has been successfully deleted.');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  showAlertDialog(BuildContext context, String code) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: TextView(
        text: "Cancel",
        color: AppColor.red,
        fontSize: 17.2.sp,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: TextView(
        text: "Yes",
        color: AppColor.green,
        fontSize: 17.2.sp,
      ),
      onPressed: () {
        deleteSales(context, code);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: TextView(
        text: "Alert Dialog",
        color: AppColor.black,
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
      ),
      content: TextView(
        text: "Would you like to delete this Sales?",
        fontSize: 14.2,
        fontWeight: FontWeight.w400,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  printReceiptWidget() async {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(
                  height: 20.h,
                ),
                pw.Text('Sales Detail',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 51.2.sp,
                    )),
                pw.SizedBox(
                  height: 20.h,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Discount(%)',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 32.2.sp,
                            )),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(
                            singleSalesResponseModel!.items![0].discount == null
                                ? '0'
                                : singleSalesResponseModel!.items![0].discount
                                    .toString(),
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 32.2.sp,
                            )),
                      ],
                    ),
                    pw.SizedBox(
                      height: 46.h,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Item:',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 32.2.sp,
                            )),
                        pw.SizedBox(
                          width: 400.w,
                          child: pw.Text(
                              loopString(singleSalesResponseModel!.items!),
                              maxLines: 10,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 33.2.sp,
                              )),
                        )
                      ],
                    ),
                    pw.SizedBox(
                      height: 40.h,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Mode of Payment',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 32.2.sp,
                            )),
                        pw.SizedBox(
                          height: 5.0.h,
                        ),
                        pw.Text(singleSalesResponseModel?.modeOfPayment ?? '',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 30.2.sp,
                            )),
                      ],
                    ),
                    pw.SizedBox(
                      height: 56.0.h,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(singleSalesResponseModel?.code ?? '',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 38.2.sp,
                                )),
                            pw.SizedBox(height: 30.h),
                            pw.Text(singleSalesResponseModel?.customer ?? '',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 32.2.sp,
                                ))
                          ],
                        ),
                        pw.Spacer(),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Text(
                                'NGN${oCcy.format(sumUsingLoop(singleSalesResponseModel!.items!))}',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 32.2.sp,
                                )),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 46.0.h,
                    ),
                  ],
                )
              ]);
        }));
    printerCall();
  }

  int sumUsingLoop(List<sales.Item> numbers) {
    int sum = 0;
    for (var number in numbers) {
      sum += number.totalPrice!;
    }
    return sum;
  }

  String loopString(List<sales.Item> e) {
    String quantityAndItems = '';
    for (var q in e) {
      quantityAndItems += '${q.quantity} ${q.item}, ';
    }
    return quantityAndItems;
  }

  void printerCall() async {
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  body(context,
          {String? item, String? price, String? quantity, String? image}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    image ?? '',
                    fit: BoxFit.cover,
                    height: 202.h,
                    width: double.infinity.w,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: AppColor.black,
                  thickness: .3.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Discount(%)',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.2.sp,
                      color: AppColor.inGrey,
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    TextView(
                      text: singleSalesResponseModel?.items?[0].discount == null
                          ? '0'
                          : singleSalesResponseModel!.items![0].discount
                              .toString(),
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2.sp,
                      color: AppColor.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Item Price',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.2.sp,
                      color: AppColor.inGrey,
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    TextView(
                      text:
                          '${getCurrency()}${oCcy.format(int.parse(price.toString()))}',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2.sp,
                      color: AppColor.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Qantity:',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.2.sp,
                      color: AppColor.inGrey,
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    TextView(
                      text: quantity ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2.sp,
                      color: AppColor.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Item',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.2.sp,
                      color: AppColor.inGrey,
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    TextView(
                      text: item ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2.sp,
                      color: AppColor.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Mode of Payment',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.2.sp,
                      color: AppColor.inGrey,
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    TextView(
                      text: singleSalesResponseModel?.modeOfPayment ?? '',
                      fontWeight: FontWeight.w700,
                      fontSize: 15.2.sp,
                      color: AppColor.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  itemContainerWidget({
    String? image,
    String? name,
    dynamic price,
    int? index,
    int? quantity,
    Key? key,
    Function(DismissDirection)? onDissmiss,
    Function()? increment,
    Function()? decrement,
  }) =>
      Dismissible(
        background: Container(color: AppColor.red),
        onDismissed: onDissmiss,
        key: key!,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.deepprimary.withOpacity(.9),
              borderRadius: BorderRadius.circular(13.6.r),
              border: Border.all(color: AppColor.white)),
          padding: EdgeInsets.all(13.6.w),
          margin: EdgeInsets.only(bottom: 10.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.white, width: 2)),
                    child: CircleAvatar(
                      radius: 34.0.r,
                      backgroundImage: NetworkImage(image ?? ''),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: TextView(
                          maxLines: 2,
                          text: name ?? '',
                          textAlign: TextAlign.start,
                          textOverflow: TextOverflow.fade,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.2.sp,
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        maxLines: 1,
                        text: '${getCurrency()}${oCcy.format(price)}',
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.fade,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: AppColor.primaryGrey1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.8.w,
                  ),
                  if (index == 0)
                    GestureDetector(
                      onTap: () {
                        onTapItemSales = !onTapItemSales;
                        notifyListeners();
                      },
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                            color: AppColor.green9ja1, shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 12.8.w,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: increment,
                    child: Container(
                      padding: EdgeInsets.all(4.4.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: .7),
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.add,
                        size: 20.sp,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.2.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.white, width: .7),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextView(
                      text: '$quantity',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.2.w,
                  ),
                  GestureDetector(
                    onTap: decrement,
                    child: Container(
                      padding: EdgeInsets.all(4.4.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white, width: .7),
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(
                        Icons.remove,
                        size: 20.sp,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  void displayEditSalesModalBottomSheet({BuildContext? context, String? code}) {
    showModalBottomSheet(
        backgroundColor: AppColor.primary,
        context: context!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        builder: (context) => ViewModelBuilder<SalesViewModel>.reactive(
            viewModelBuilder: () => locator<SalesViewModel>(),
            onViewModelReady: (model) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await model.getSingleSales(context, code!);
                model.getItems(context);
                model.customerType.text =
                    model.singleSalesResponseModel?.customerType ?? '';
                model.paymode.text =
                    model.singleSalesResponseModel?.modeOfPayment ?? '';

                addedItemListSingleSales =
                    model.singleSalesResponseModel!.items!;
                addedItemListSales.clear();
                for (var v in addedItemListSingleSales) {
                  addedItemListSales
                      .add(add.Item(itemId: v.itemId, quantity: v.quantity));
                }
                model.total.text =
                    model.sumUsingLoop(addedItemListSingleSales).toString();
              });
            },
            disposeViewModel: false,
            builder: (_, SalesViewModel model, __) {
              return DraggableScrollableSheet(
                expand: false,
                initialChildSize: .4,
                maxChildSize: .99,
                minChildSize: .32,
                builder:
                    (BuildContext context, ScrollController scrollController) =>
                        SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                        key: formKey1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_sharp,
                                    size: 26.8.sp,
                                    color: AppColor.white,
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextView(
                                text: 'Update Sales',
                                fontSize: 24.2.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.white,
                              ),
                              SizedBox(
                                height: 26.2.h,
                              ),
                              ...List.generate(addedItemListSingleSales.length,
                                  (index) {
                                final element = addedItemListSingleSales[index];
                                return itemContainerWidget(
                                  key: UniqueKey(),
                                  onDissmiss: (direction) {
                                    if (direction ==
                                        DismissDirection.startToEnd) {
                                      addedItemListSingleSales.removeAt(index);
                                      addedItemListSales.removeAt(index);
                                      notifyListeners();
                                    } else {
                                      addedItemListSingleSales.removeAt(index);
                                      addedItemListSales.removeAt(index);
                                      notifyListeners();
                                    }
                                  },
                                  index: index,
                                  image: element.image,
                                  name: element.item,
                                  price: element.itemPrice,
                                  quantity: element.quantity,
                                  increment: () {
                                    element.quantity = element.quantity! + 1;
                                    addedItemListSales.insert(
                                        index,
                                        add.Item(
                                            itemId: element.itemId,
                                            quantity: element.quantity));
                                    addedItemListSales.removeAt(index + 1);
                                    model.notifyListeners();
                                  },
                                  decrement: () {
                                    if (element.quantity == 1) return;
                                    element.quantity = element.quantity! - 1;
                                    addedItemListSales.insert(
                                        index,
                                        add.Item(
                                            itemId: element.itemId,
                                            quantity: element.quantity));

                                    addedItemListSales.removeAt(index + 1);
                                    model.notifyListeners();
                                  },
                                );
                              }),
                              SizedBox(
                                height: 22.2.h,
                              ),
                              SizedBox(
                                height: !model.onTapItemSales ? 0.h : 16.h,
                              ),
                              !model.onTapItemSales
                                  ? const SizedBox.shrink()
                                  : Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.w, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.r),
                                        color: AppColor.white,
                                      ),
                                      child: SizedBox(
                                        height: 200,
                                        child: SmartRefresher(
                                          key: const PageStorageKey(
                                              'storage_key_single_sales'),
                                          enablePullUp: true,
                                          enablePullDown: false,
                                          onRefresh: () async {
                                            await model.onRefresh();
                                            model.getItems(context);
                                            refreshController
                                                .refreshCompleted();
                                          },
                                          onLoading: () async {
                                            await model.onLoading();
                                            refreshController.loadComplete();
                                          },
                                          controller: refreshController,
                                          footer: CustomFooter(
                                              builder: ((context, m) {
                                            Widget body;
                                            if (model.getAllItemsResponseModel !=
                                                    null &&
                                                model.getAllItemsResponseModel!
                                                    .data!.isEmpty) {
                                              body = TextView(
                                                  text: "You're caught up",
                                                  color: AppColor.textColor);
                                            } else if (model ==
                                                    LoadStatus.idle &&
                                                model.isLoadNoMore == false) {
                                              body = TextView(
                                                text: "Pull up load",
                                                color: AppColor.textColor,
                                              );
                                            } else if (model ==
                                                LoadStatus.loading) {
                                              body =
                                                  const CupertinoActivityIndicator();
                                            } else if (model ==
                                                LoadStatus.failed) {
                                              body = TextView(
                                                  text:
                                                      "Load Failed!Click retry!",
                                                  color: AppColor.textColor);
                                            } else if (model ==
                                                LoadStatus.canLoading) {
                                              body = TextView(
                                                  text: "release to load more",
                                                  color: AppColor.textColor);
                                            } else {
                                              body = TextView(
                                                  text: "You're caught up",
                                                  color: AppColor.textColor);
                                            }
                                            return SizedBox(
                                              height: 50.0,
                                              child: Center(child: body),
                                            );
                                          })),
                                          child: SingleChildScrollView(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...getAllItemsResponseModelList!
                                                      .map((o) => Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.w),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                addedItemListSingleSales.add(sales.Item(
                                                                    id: o.id,
                                                                    itemId:
                                                                        o.id,
                                                                    item:
                                                                        o.name,
                                                                    itemPrice:
                                                                        o.price,
                                                                    image:
                                                                        o.image,
                                                                    quantity: 1,
                                                                    totalPrice:
                                                                        o.price));

                                                                onTapItemSales =
                                                                    false;
                                                                notifyListeners();
                                                              },
                                                              child: TextView(
                                                                text: o.name!,
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ))
                                                ]),
                                          ),
                                        ),
                                      )),
                              Column(
                                children: [
                                  TextFormWidget(
                                    hint: 'Customer Type',
                                    label: 'Select Service',
                                    hintColor: AppColor.white,
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.2.sp,
                                        color: AppColor.inGrey),
                                    fillColor: AppColor.white,
                                    isFilled: true,
                                    readOnly: true,
                                    suffixWidget: IconButton(
                                        onPressed: () {
                                          onTapCustomer = !onTapCustomer;
                                          model.notifyListeners();
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down_sharp,
                                          size: 26.sp,
                                        )),
                                    controller: customerType,
                                    validator: AppValidator.validateString(),
                                  ),
                                  SizedBox(
                                    height: !onTapCustomer ? 0.h : 16.h,
                                  ),
                                  !onTapCustomer
                                      ? const SizedBox.shrink()
                                      : Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16.w, horizontal: 10.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                            color: AppColor.white,
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...customerKind.map((o) =>
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.w),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          customerType.text = o;
                                                          onTapCustomer = false;
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child: TextView(
                                                          text: o.capitalize!,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ))
                                              ])),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ViewModelBuilder<BookingViewModel>.reactive(
                                      viewModelBuilder: () =>
                                          BookingViewModel(),
                                      onViewModelReady: (mode) {
                                        mode.getOccupiedBookings(context);
                                      },
                                      disposeViewModel: false,
                                      builder: (_, BookingViewModel mode, __) {
                                        return customerType.text == s
                                            ? Column(
                                                children: [
                                                  TextFormWidget(
                                                    hint: 'Select Room',
                                                    label: 'Select Service',
                                                    hintColor: AppColor.white,
                                                    labelStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15.2.sp,
                                                        color: AppColor.inGrey),
                                                    fillColor: AppColor.white,
                                                    isFilled: true,
                                                    readOnly: true,
                                                    suffixWidget: IconButton(
                                                        onPressed: () {
                                                          onTapRoom =
                                                              !onTapRoom;
                                                          notifyListeners();
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_drop_down_sharp,
                                                          size: 26.sp,
                                                        )),
                                                    controller: selectRoom,
                                                    validator: AppValidator
                                                        .validateString(),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        !onTapRoom ? 0.h : 16.h,
                                                  ),
                                                  !onTapRoom
                                                      ? const SizedBox.shrink()
                                                      : Container(
                                                          width:
                                                              double.infinity,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      16.w,
                                                                  horizontal:
                                                                      10.w),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14.r),
                                                            color:
                                                                AppColor.white,
                                                          ),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ...mode
                                                                    .getOccupiedBookingsResponseModel!
                                                                    .occupiedBookings!
                                                                    .map((o) =>
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(bottom: 10.w),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              selectRoom.text = o.details ?? '';
                                                                              bookingId = o.id.toString();
                                                                              onTapRoom = false;

                                                                              notifyListeners();
                                                                            },
                                                                            child:
                                                                                TextView(
                                                                              text: o.details ?? '',
                                                                              fontSize: 18.sp,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        ))
                                                              ])),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox.shrink();
                                      }),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ViewModelBuilder<BookingViewModel>.reactive(
                                      viewModelBuilder: () =>
                                          BookingViewModel(),
                                      onViewModelReady: (m) {
                                        m.paymentModel(context);
                                      },
                                      disposeViewModel: false,
                                      builder: (_, BookingViewModel m, __) {
                                        return Column(
                                          children: [
                                            TextFormWidget(
                                              hint: 'Mode of Payment',
                                              label: 'Select Service',
                                              hintColor: AppColor.white,
                                              labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.2.sp,
                                                  color: AppColor.inGrey),
                                              fillColor: AppColor.white,
                                              isFilled: true,
                                              readOnly: true,
                                              suffixWidget: IconButton(
                                                  onPressed: () {
                                                    model.onTap1 =
                                                        !model.onTap1;

                                                    model.notifyListeners();
                                                  },
                                                  icon: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    size: 26.sp,
                                                  )),
                                              controller: model.paymode,
                                              validator:
                                                  AppValidator.validateString(),
                                            ),
                                            SizedBox(
                                              height:
                                                  !model.onTap1 ? 0.h : 16.h,
                                            ),
                                            !model.onTap1
                                                ? const SizedBox.shrink()
                                                : Container(
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 16.w,
                                                            horizontal: 10.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.r),
                                                      color: AppColor.white,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ...m.paymentModeResponseModel!
                                                            .data!
                                                            .map((o) => Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              10.w),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      model
                                                                          .paymode
                                                                          .text = o;
                                                                      model.onTap1 =
                                                                          false;
                                                                      model
                                                                          .notifyListeners();
                                                                    },
                                                                    child:
                                                                        TextView(
                                                                      text: o,
                                                                      fontSize:
                                                                          18.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                ))
                                                      ],
                                                    ),
                                                  ),
                                          ],
                                        );
                                      }),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormWidget(
                                    hint: 'Total Price',
                                    label: 'Select Service',
                                    hintColor: AppColor.white,
                                    keyboardType: TextInputType.number,
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.2.sp,
                                        color: AppColor.inGrey),
                                    fillColor: AppColor.white,
                                    isFilled: true,
                                    controller: model.total,
                                    validator: AppValidator.validateString(),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  ButtonWidget(
                                      buttonText: 'Proceed',
                                      color: AppColor.white,
                                      border: 24,
                                      isLoading: model.isLoading,
                                      buttonWidth: double.infinity,
                                      buttonColor: AppColor.deepprimary,
                                      buttonBorderColor: Colors.transparent,
                                      onPressed: () async {
                                        if (formKey1.currentState!.validate()) {
                                          await getUpdateProcess();
                                          model.updateSales(
                                              context,
                                              code!,
                                              AddSalesEntityModel(
                                                type: customerType.text.trim(),
                                                items: addedItemListSales,
                                                discount:
                                                    singleSalesResponseModel!
                                                            .items![0]
                                                            .discount ??
                                                        0,
                                                modeOfPayment:
                                                    paymode.text.trim(),
                                                bookingId:
                                                    customerType.text == 'guest'
                                                        ? null
                                                        : int.parse(bookingId),
                                              ));
                                        }
                                      }),
                                  SizedBox(
                                    height: 16.0.h,
                                  ),
                                ],
                              ),
                            ])),
                  ),
                ),
              );
            }));
  }

  getProcess() {
    for (var r in addedItemList) {
      _items.add(Item(quantity: r.quantity, itemId: r.id));
      notifyListeners();
    }
  }

  getUpdateProcess() {
    addedItemListSales.clear();
    for (var v in addedItemListSingleSales) {
      addedItemListSales.add(add.Item(itemId: v.itemId, quantity: v.quantity));
    }
  }
}
