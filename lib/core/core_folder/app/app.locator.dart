// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../../api_folder/auth_api.dart';
import '../../api_folder/booking_api.dart';
import '../../api_folder/report_api.dart';
import '../../api_folder/sales_api.dart';
import '../../connect_end/contract/booking_contract_impl.dart';
import '../../connect_end/contract/contract_implementation.dart';
import '../../connect_end/contract/report_contract_impl.dart';
import '../../connect_end/contract/sales_contract_impl.dart';
import '../../connect_end/repo/booking_repo_impl.dart';
import '../../connect_end/repo/repo_implementation.dart';
import '../../connect_end/repo/report_repo_impl.dart';
import '../../connect_end/repo/sales_repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../../connect_end/view_model/booking_view_model.dart';
import '../../connect_end/view_model/report_view_model.dart';
import '../../connect_end/view_model/sales_view_model.dart';
import '../manager/shared_preferance.dart';
import '../network/network_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => SharedPreferencesService());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => AuthApi());
  locator.registerLazySingleton(() => BookingApi());
  locator.registerLazySingleton(() => SalesApi());
  locator.registerLazySingleton(() => ReportApi());
  locator.registerLazySingleton(() => AuthContractsImpl());
  locator.registerLazySingleton(() => BookingContractImpl());
  locator.registerLazySingleton(() => SalesContractImpl());
  locator.registerLazySingleton(() => ReportContractImpl());
  locator.registerLazySingleton(() => BookingRepoImpl());
  locator.registerLazySingleton(() => SalesRepoImpl());
  locator.registerLazySingleton(() => ReportRepoImpl());
  locator.registerLazySingleton(() => AuthRepoImpl());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => BookingViewModel());
  locator.registerLazySingleton(() => SalesViewModel());
  locator.registerLazySingleton(() => ReportViewModel());
}
