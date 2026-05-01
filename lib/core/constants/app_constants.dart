
class AppConstants{

  static String APP_NAME="KOKO APP";
  static String BASE_URL ="https://api.kokocreates.com";
  //static String BASE_URL ="https://koko.xdtunnel.icu";
  static String API_KEY ="b4a2203fc621433fb1c04443262301";
  //<----> share preference Key <----->//
  static String THEME ="theme";

  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';
  static const String FONT_FAMILY = 'Inter';

  static RegExp emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passwordValidator = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

}