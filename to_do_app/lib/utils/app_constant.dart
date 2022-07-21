

class AppConstant {
  static const String oneSignalAppId = '195e05d7-4d36-4a83-9f1e-8361fe6985c4';
  static NestedScreen nestedScreen = NestedScreen();
  static ErrorMessage errorMessage = ErrorMessage();
  static SharePrefKeys sharePrefKeys = SharePrefKeys();
  static LocaleKey localeKey = LocaleKey();
  static EventKey eventKey = EventKey();
}

class NameFont {
  static String openSans = 'OpenSans';
}

class DateConstant {
  static final String dob = 'dd/MM/yyyy';
  static final String time = 'HH:mm';
  static final String dateServer = 'MM/dd/yyyy';
  static final String dateParseServer = 'MM/dd/yyyy HH:mm:ss';
  static final String dateFull = 'yyyy-MM-ddHH:mm:ss';
  static final String monthYear = 'MMMM yyyy';
  static final String dateConstant = 'hh:mm a - dd/MM/yyyy';
}

class NestedScreen {
  final String nestedHomeScreen = 'NestedHomeScreen';
  final String nestedWalletScreen = 'NestedWalletScreen';
  final String nestedCardScreen = 'NestedCardScreen';
  final String nestedHistoryScreen = 'NestedHistoryScreen';
}

class ErrorMessage {
  final String emailInvalid = 'Email Invalid';
  final String passwordInvalid = 'Password Invalid';
  final String anErrorOccured = 'An error occured';
  final String invalidAccess = 'Your access is invalid';
  final String expiredAccess = 'Your access is expired, please login again';
  String badInternetConnection = 'Network error';
}

class EventKey {
  static final String updateUser = 'update_user';
  static final String logOut = 'log_out';
  static final String reloadFarmerList = 'reloadFarmerList';
  static final String reloadFarmerDetail = 'reloadFarmerDetail';
  static final String reloadAddProduct = 'reloadAddProduct';
  static final String reloadServerPush = 'reloadServerPush';
  static final String getUserProfile = 'getUserProfile';
  static final String reloadRead = 'reload_read';
  static final String reloadSurvey = 'reload_survey';
  static final String reloadServer = 'reload_server';
  static final String navigateTab2 = 'navigateTab2';


  static final String provinceLocal = 'province_local';
  static final String districtLocal = 'district_local';
  static final String wardLocal = 'ward_local';
  static final String rankLocal = 'rank_local';
  static final String hiveDB = 'hive_db_local';
  static final String listFarmerDB = 'hive_list_farmer_';
  static final String listSurveyTabbarDB = 'hive_list_survey_tabbar_';
  static final String listReminderTabbarDB = 'hive_list_reminder_tabbar_';
  static final String currentUserDB = 'hive_current_user_';
  static final String listProductDB = 'hive_list_product_';
  
  static final String listAddFarmerLocalDB = 'hive_add_farmer_local_list_';
  static final String listFarmerGroupDB = 'hive_list_farmer_group_';
  static final String listSurveyFarmerDB = 'hive_list_survey_farmer_';
  static final String listSurveyFieldDB = 'hive_list_survey_field_';
  static final String listSurveyApiLocalDB = 'hive_survey_api_local_';
  static final String listEditSurveyDB = 'hive_edit_survey_api_';
}

class SharePrefKeys {
  final String apiKey = 'apiKey';
  final String authToken = 'authToken';
  final String language = "language";
  final String myLibrary = "myLibrary";
  final String employeeId = 'EmployeeId';
  final String dateLogin = 'DateLogin';
  final String isTour = 'is_tour';
  final String pincode = 'pincode_key';
  final String faceID = 'faceID_key';
  final String touchID = 'touchID_key';
  final String currentEmail = 'current_email';
  final String refreshAuthToken = 'refreshAuthToken';
  final String signUpNotVerify = 'signUpNotVerify';
  final String callApiLanguage = 'callApiLanguage';
  final String rememberMe = 'remember_me';
  final String rememberMeUserName = 'remember_me_username';
  final String rememberMePassword = 'remember_me_password';
  final String username = 'username';
  final String host = 'host_server';
  final String database = 'database_server';
  final String accessMobile = 'access_Mobile';
  final String passwordUser = 'password_user';
}

class LocaleKey {
  static const String EN = "en";
  static const String VI = "vi";
  static const String AR = "ar";
}

class AppString {
  static final String textReplace = '{1}';
  static final String textReplace2 = '{2}';
  static final String textReplace3 = '{3}';
  static final String hostFireBase = 'firebasestorage.googleapis.com';
  static final String basic = 'Basic ';
  static final String authorization = 'Authorization';
  static final String contentType = "Content-Type";
  static final String applicationJson = "application/json";
  static final String expiredToken = 'Invalid FileMaker Data API token (*)';
  static final String ha = ' Ha';
  static final String noRecords = 'No records match the request'.toLowerCase();
  static final String asia = 'Asia';
  
}
