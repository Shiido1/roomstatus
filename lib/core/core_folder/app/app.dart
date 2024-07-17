import 'package:roomstatus/core/api_folder/booking_api.dart';
import 'package:roomstatus/core/api_folder/sales_api.dart';
import 'package:roomstatus/core/connect_end/contract/sales_contract_impl.dart';
import 'package:roomstatus/core/connect_end/repo/booking_repo_impl.dart';
import 'package:roomstatus/core/connect_end/repo/sales_repo_impl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/screens/authentication/create_account/create_account_screen.dart';
import '../../../ui/screens/authentication/create_account/create_account_second_screen.dart';
import '../../../ui/screens/authentication/login/user_login_screen.dart';
import '../../../ui/screens/authentication/otp/otp_screen.dart';
import '../../../ui/screens/dashboard/dashboard_screen.dart';
import '../../../ui/screens/dashboard/pos/add_sales/all_sales_history_screen.dart';
import '../../../ui/screens/dashboard/pos/add_sales/single_sale_details_screen.dart';
import '../../../ui/screens/dashboard/report/payment/booking_history_screen.dart';
import '../../../ui/screens/dashboard/report/payment/payment_history_screen.dart';
import '../../../ui/screens/dashboard/report/report_payment_screen.dart';
import '../../../ui/screens/dashboard/report/report_room_screen.dart';
import '../../../ui/screens/dashboard/report/report_sales_screen.dart';
import '../../../ui/screens/onbarding1_screen.dart';
import '../../api_folder/auth_api.dart';
import '../../api_folder/report_api.dart';
import '../../connect_end/contract/booking_contract_impl.dart';
import '../../connect_end/contract/contract_implementation.dart';
import '../../connect_end/contract/report_contract_impl.dart';
import '../../connect_end/repo/repo_implementation.dart';
import '../../connect_end/repo/report_repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../../connect_end/view_model/booking_view_model.dart';
import '../../connect_end/view_model/report_view_model.dart';
import '../../connect_end/view_model/sales_view_model.dart';
import '../manager/shared_preferance.dart';
import '../network/network_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: Dashboard, initial: true),
  MaterialRoute(page: Onboarding, initial: false),
  MaterialRoute(page: UserLoginScreen, initial: false),
  MaterialRoute(page: CreateAccountScreen, initial: false),
  MaterialRoute(page: CreateAccountSecondScreen, initial: false),
  MaterialRoute(page: OTPScreen, initial: false),
  MaterialRoute(page: AllSalesHistoryScreen, initial: false),
  MaterialRoute(page: SingleSaleDetailsScreen, initial: false),
  MaterialRoute(page: ReportRoomScreen, initial: false),
  MaterialRoute(page: ReportSalesScreen, initial: false),
  MaterialRoute(page: ReportPaymentScreen, initial: false),
  MaterialRoute(page: BookingHistoryScreen, initial: false),
  MaterialRoute(page: PaymentHistoryScreen, initial: false),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: SharedPreferencesService),
  LazySingleton(classType: NetworkService),
  LazySingleton(classType: AuthApi),
  LazySingleton(classType: BookingApi),
  LazySingleton(classType: SalesApi),
  LazySingleton(classType: ReportApi),
  LazySingleton(classType: AuthContractsImpl),
  LazySingleton(classType: BookingContractImpl),
  LazySingleton(classType: SalesContractImpl),
  LazySingleton(classType: ReportContractImpl),
  LazySingleton(classType: BookingRepoImpl),
  LazySingleton(classType: SalesRepoImpl),
  LazySingleton(classType: ReportRepoImpl),
  LazySingleton(classType: AuthRepoImpl),
  LazySingleton(classType: AuthViewModel),
  LazySingleton(classType: BookingViewModel),
  LazySingleton(classType: SalesViewModel),
  LazySingleton(classType: ReportViewModel),
], logger: StackedLogger())
class App {}
