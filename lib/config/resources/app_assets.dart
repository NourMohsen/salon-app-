abstract class AppImagesAssets {
  static const String _basePath = 'assets/images';

  //png
  static String pLogo = "$_basePath/logo.png";

  //svg
  static String sAvatar = "$_basePath/avatar.svg";

}

abstract class AppIconsAssets {
  static const String _basePath = 'assets/icons';

  static String sSaudiFlag = "$_basePath/saudi.svg";
  static String sStar = "$_basePath/star.svg";
  static String sLocation = "$_basePath/location.svg";
  static String sLanguage = "$_basePath/language.svg";
  static String sTheme = "$_basePath/theme.svg";
  static String sLogout = "$_basePath/logout.svg";
  static String sBarber = "$_basePath/barber.svg";
  static String sTime = "$_basePath/time.svg";
  static String sShare = "$_basePath/share.svg";}

abstract class AppLottieAssets {
  static const String _basePath = 'assets/lottie/';
  static const String sManReadQuran = '${_basePath}man-read-quran.json';
}
