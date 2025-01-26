class EndPoints {
  static const String baseUrl = "https://gold-hamster-143901.hostingersite.com/api";
  static const String baseImageUrl = 'https://api.lappaika.com/api/storage/';

  static String imagePath(String imgPath) => '$baseImageUrl$imgPath';

  ///auth
  static const String login = '/login';
  static const String completeRegistration = '/complete-registration';
  static const String sendOTP = '/active-code';
  static const String logoutPath = '/logout';
  static const String salons = "/salons";
  static const String services = "/services";
  static String salonsDetails(int salonId) => '/salon-details/$salonId';
}
