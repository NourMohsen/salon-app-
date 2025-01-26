part of '../../auth.dart';

class CityModel {
  int? cityId;
  String? cityName;

  CityModel(
      {this.cityId,
        this.cityName,
      });
}


List<CityModel> cities = [
  CityModel(
    cityId: 1,
    cityName: LocaleKeys.riyadh.tr(), // Riyadh
  ),
  CityModel(
    cityId: 2,
    cityName: LocaleKeys.jeddah.tr(), // Jeddah
  ),
  CityModel(
    cityId: 3,
    cityName: LocaleKeys.mecca.tr(), // Mecca
  ),
  CityModel(
    cityId: 4,
    cityName: LocaleKeys.medina.tr(), // Medina
  ),
  CityModel(
    cityId: 5,
    cityName: LocaleKeys.dammam.tr(), // Dammam
  ),
  CityModel(
    cityId: 6,
    cityName: LocaleKeys.taif.tr(), // Taif
  ),
  CityModel(
    cityId: 7,
    cityName: LocaleKeys.tabuk.tr(), // Tabuk
  ),
];