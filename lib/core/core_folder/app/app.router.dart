// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:roomstatus/ui/screens/authentication/create_account/create_account_screen.dart'
    as _i5;
import 'package:roomstatus/ui/screens/authentication/create_account/create_account_second_screen.dart'
    as _i6;
import 'package:roomstatus/ui/screens/authentication/login/user_login_screen.dart'
    as _i4;
import 'package:roomstatus/ui/screens/authentication/otp/otp_screen.dart'
    as _i7;
import 'package:roomstatus/ui/screens/dashboard/dashboard_screen.dart' as _i2;
import 'package:roomstatus/ui/screens/dashboard/pos/add_sales/all_sales_history_screen.dart'
    as _i8;
import 'package:roomstatus/ui/screens/dashboard/pos/add_sales/single_sale_details_screen.dart'
    as _i9;
import 'package:roomstatus/ui/screens/dashboard/report/payment/booking_history_screen.dart'
    as _i13;
import 'package:roomstatus/ui/screens/dashboard/report/payment/payment_history_screen.dart'
    as _i14;
import 'package:roomstatus/ui/screens/dashboard/report/report_payment_screen.dart'
    as _i12;
import 'package:roomstatus/ui/screens/dashboard/report/report_room_screen.dart'
    as _i10;
import 'package:roomstatus/ui/screens/dashboard/report/report_sales_screen.dart'
    as _i11;
import 'package:roomstatus/ui/screens/onbarding1_screen.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;

class Routes {
  static const dashboard = '/';

  static const onboarding = '/Onboarding';

  static const userLoginScreen = '/user-login-screen';

  static const createAccountScreen = '/create-account-screen';

  static const createAccountSecondScreen = '/create-account-second-screen';

  static const oTPScreen = '/o-tp-screen';

  static const allSalesHistoryScreen = '/all-sales-history-screen';

  static const singleSaleDetailsScreen = '/single-sale-details-screen';

  static const reportRoomScreen = '/report-room-screen';

  static const reportSalesScreen = '/report-sales-screen';

  static const reportPaymentScreen = '/report-payment-screen';

  static const bookingHistoryScreen = '/booking-history-screen';

  static const paymentHistoryScreen = '/payment-history-screen';

  static const all = <String>{
    dashboard,
    onboarding,
    userLoginScreen,
    createAccountScreen,
    createAccountSecondScreen,
    oTPScreen,
    allSalesHistoryScreen,
    singleSaleDetailsScreen,
    reportRoomScreen,
    reportSalesScreen,
    reportPaymentScreen,
    bookingHistoryScreen,
    paymentHistoryScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.dashboard,
      page: _i2.Dashboard,
    ),
    _i1.RouteDef(
      Routes.onboarding,
      page: _i3.Onboarding,
    ),
    _i1.RouteDef(
      Routes.userLoginScreen,
      page: _i4.UserLoginScreen,
    ),
    _i1.RouteDef(
      Routes.createAccountScreen,
      page: _i5.CreateAccountScreen,
    ),
    _i1.RouteDef(
      Routes.createAccountSecondScreen,
      page: _i6.CreateAccountSecondScreen,
    ),
    _i1.RouteDef(
      Routes.oTPScreen,
      page: _i7.OTPScreen,
    ),
    _i1.RouteDef(
      Routes.allSalesHistoryScreen,
      page: _i8.AllSalesHistoryScreen,
    ),
    _i1.RouteDef(
      Routes.singleSaleDetailsScreen,
      page: _i9.SingleSaleDetailsScreen,
    ),
    _i1.RouteDef(
      Routes.reportRoomScreen,
      page: _i10.ReportRoomScreen,
    ),
    _i1.RouteDef(
      Routes.reportSalesScreen,
      page: _i11.ReportSalesScreen,
    ),
    _i1.RouteDef(
      Routes.reportPaymentScreen,
      page: _i12.ReportPaymentScreen,
    ),
    _i1.RouteDef(
      Routes.bookingHistoryScreen,
      page: _i13.BookingHistoryScreen,
    ),
    _i1.RouteDef(
      Routes.paymentHistoryScreen,
      page: _i14.PaymentHistoryScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Dashboard: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Dashboard(),
        settings: data,
      );
    },
    _i3.Onboarding: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Onboarding(),
        settings: data,
      );
    },
    _i4.UserLoginScreen: (data) {
      final args = data.getArgs<UserLoginScreenArguments>(
        orElse: () => const UserLoginScreenArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.UserLoginScreen(key: args.key),
        settings: data,
      );
    },
    _i5.CreateAccountScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CreateAccountScreen(),
        settings: data,
      );
    },
    _i6.CreateAccountSecondScreen: (data) {
      final args =
          data.getArgs<CreateAccountSecondScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CreateAccountSecondScreen(
            key: args.key,
            address: args.address,
            hotelname: args.hotelname,
            city: args.city,
            state: args.state,
            country: args.country),
        settings: data,
      );
    },
    _i7.OTPScreen: (data) {
      final args = data.getArgs<OTPScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.OTPScreen(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i8.AllSalesHistoryScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AllSalesHistoryScreen(),
        settings: data,
      );
    },
    _i9.SingleSaleDetailsScreen: (data) {
      final args =
          data.getArgs<SingleSaleDetailsScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.SingleSaleDetailsScreen(key: args.key, code: args.code),
        settings: data,
      );
    },
    _i10.ReportRoomScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ReportRoomScreen(),
        settings: data,
      );
    },
    _i11.ReportSalesScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ReportSalesScreen(),
        settings: data,
      );
    },
    _i12.ReportPaymentScreen: (data) {
      final args = data.getArgs<ReportPaymentScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.ReportPaymentScreen(
            key: args.key, name: args.name, amount: args.amount, id: args.id),
        settings: data,
      );
    },
    _i13.BookingHistoryScreen: (data) {
      final args = data.getArgs<BookingHistoryScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.BookingHistoryScreen(
            key: args.key, id: args.id, name: args.name),
        settings: data,
      );
    },
    _i14.PaymentHistoryScreen: (data) {
      final args = data.getArgs<PaymentHistoryScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.PaymentHistoryScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class UserLoginScreenArguments {
  const UserLoginScreenArguments({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant UserLoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CreateAccountSecondScreenArguments {
  const CreateAccountSecondScreenArguments({
    this.key,
    required this.address,
    required this.hotelname,
    required this.city,
    required this.state,
    required this.country,
  });

  final _i16.Key? key;

  final String? address;

  final String? hotelname;

  final String? city;

  final String? state;

  final String? country;

  @override
  String toString() {
    return '{"key": "$key", "address": "$address", "hotelname": "$hotelname", "city": "$city", "state": "$state", "country": "$country"}';
  }

  @override
  bool operator ==(covariant CreateAccountSecondScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.address == address &&
        other.hotelname == hotelname &&
        other.city == city &&
        other.state == state &&
        other.country == country;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        address.hashCode ^
        hotelname.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode;
  }
}

class OTPScreenArguments {
  const OTPScreenArguments({
    this.key,
    required this.email,
  });

  final _i16.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant OTPScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class SingleSaleDetailsScreenArguments {
  const SingleSaleDetailsScreenArguments({
    this.key,
    required this.code,
  });

  final _i16.Key? key;

  final String? code;

  @override
  String toString() {
    return '{"key": "$key", "code": "$code"}';
  }

  @override
  bool operator ==(covariant SingleSaleDetailsScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.code == code;
  }

  @override
  int get hashCode {
    return key.hashCode ^ code.hashCode;
  }
}

class ReportPaymentScreenArguments {
  const ReportPaymentScreenArguments({
    this.key,
    required this.name,
    required this.amount,
    required this.id,
  });

  final _i16.Key? key;

  final String? name;

  final String? amount;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "amount": "$amount", "id": "$id"}';
  }

  @override
  bool operator ==(covariant ReportPaymentScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.amount == amount &&
        other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ name.hashCode ^ amount.hashCode ^ id.hashCode;
  }
}

class BookingHistoryScreenArguments {
  const BookingHistoryScreenArguments({
    this.key,
    required this.id,
    required this.name,
  });

  final _i16.Key? key;

  final String? id;

  final String? name;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "name": "$name"}';
  }

  @override
  bool operator ==(covariant BookingHistoryScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id && other.name == name;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ name.hashCode;
  }
}

class PaymentHistoryScreenArguments {
  const PaymentHistoryScreenArguments({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant PaymentHistoryScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
  Future<dynamic> navigateToDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboarding([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboarding,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserLoginScreen({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userLoginScreen,
        arguments: UserLoginScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createAccountScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountSecondScreen({
    _i16.Key? key,
    required String? address,
    required String? hotelname,
    required String? city,
    required String? state,
    required String? country,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createAccountSecondScreen,
        arguments: CreateAccountSecondScreenArguments(
            key: key,
            address: address,
            hotelname: hotelname,
            city: city,
            state: state,
            country: country),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOTPScreen({
    _i16.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.oTPScreen,
        arguments: OTPScreenArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllSalesHistoryScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allSalesHistoryScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingleSaleDetailsScreen({
    _i16.Key? key,
    required String? code,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.singleSaleDetailsScreen,
        arguments: SingleSaleDetailsScreenArguments(key: key, code: code),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportRoomScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportRoomScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportSalesScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportSalesScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportPaymentScreen({
    _i16.Key? key,
    required String? name,
    required String? amount,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reportPaymentScreen,
        arguments: ReportPaymentScreenArguments(
            key: key, name: name, amount: amount, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBookingHistoryScreen({
    _i16.Key? key,
    required String? id,
    required String? name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bookingHistoryScreen,
        arguments: BookingHistoryScreenArguments(key: key, id: id, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentHistoryScreen({
    _i16.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.paymentHistoryScreen,
        arguments: PaymentHistoryScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboarding([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboarding,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserLoginScreen({
    _i16.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userLoginScreen,
        arguments: UserLoginScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateAccountScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createAccountScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateAccountSecondScreen({
    _i16.Key? key,
    required String? address,
    required String? hotelname,
    required String? city,
    required String? state,
    required String? country,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createAccountSecondScreen,
        arguments: CreateAccountSecondScreenArguments(
            key: key,
            address: address,
            hotelname: hotelname,
            city: city,
            state: state,
            country: country),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOTPScreen({
    _i16.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.oTPScreen,
        arguments: OTPScreenArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllSalesHistoryScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allSalesHistoryScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingleSaleDetailsScreen({
    _i16.Key? key,
    required String? code,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.singleSaleDetailsScreen,
        arguments: SingleSaleDetailsScreenArguments(key: key, code: code),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportRoomScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportRoomScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportSalesScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportSalesScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportPaymentScreen({
    _i16.Key? key,
    required String? name,
    required String? amount,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reportPaymentScreen,
        arguments: ReportPaymentScreenArguments(
            key: key, name: name, amount: amount, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBookingHistoryScreen({
    _i16.Key? key,
    required String? id,
    required String? name,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bookingHistoryScreen,
        arguments: BookingHistoryScreenArguments(key: key, id: id, name: name),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentHistoryScreen({
    _i16.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.paymentHistoryScreen,
        arguments: PaymentHistoryScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
