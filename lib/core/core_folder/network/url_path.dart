// ignore_for_file: constant_identifier_names

class UrlConfig {
  static const String register = 'v1/register';
  static const String login = 'v1/login';
  static const String otp = 'v1/otp';
  static const String resend_otp = 'v1/otp/resend';
  static const String country = 'v1/countries';
  static const String state = 'v1/states';
  static const String city = 'v1/cities';
  static const String profile = 'v1/profile';
  static const String deleteAccount = 'v1/account/delete';

  static const String get_all_rooms = 'v1/rooms';
  static const String get_room = 'v1/room';
  static const String get_status = 'v1/rooms/statuses';

  static const String find_customer = 'v1/bookings/findCustomer';
  static const String booking_companies = 'v1/reports/corporates';
  static const String show_booking = 'v1/bookings/';
  static const String get_payment_mode = 'v1/bookings/mode-of-payment';
  static const String get_bookings = 'v1/bookings';
  static const String add_bookings = 'v1/bookings/room/';
  static const String get_ids = 'v1/ids';
  static const String get_occupied_bookings = 'v1/bookings/occupied';
  static const String get_all_items = 'v1/items';
  static const String get_all_items_categories = 'v1/items/categories';

  static const String all_sales = 'v1/sales';
  static const String add_sales = 'v1/sales/add';
  static const String customer_type = '1/sales/customer-type';

  static const String all_booking_hall = 'v1/bookings/hall';
  static const String all_booking_room = 'v1/bookings/room';

  static const String report_from_room = 'v1/reports/rooms';

  static const String report_from_hall = 'v1/reports/halls';
  static const String sales_report = 'v1/reports/sales';
  static const String corporate_reminder = 'v1/reports/corporates';
  static const String make_payment = 'v1/reports/corporates';
  static const String booking_history = 'v1/reports/corporates';
  static const String get_due = 'v1/bookings/getDue';
  static const String profit_and_loss = 'v1/reports/profit-and-loss';
  static const String guest_list = 'v1/reports/guestlist';
  static const String payroll = 'v1/reports/payroll';
}
