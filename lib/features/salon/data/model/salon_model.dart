part of '../../salon.dart';


class SalonModel {
  int? id;
  String? name;
  String? desc;
  String? image;
  String? rateAvg;
  int? countProviders;
  String? hourWork;
  bool? isOpen;
  String? timeClose;
  String? timeOpen;
  int? countRate;
  String? distance;
  List<ProviderModel>? providers;
  List<ServiceModel>? services;
  List<AppointmentModel>? appointments;
  List<TypeServiceModel>? typeService;

  SalonModel(
      {this.id,
        this.name,
        this.desc,
        this.image,
        this.rateAvg,
        this.countProviders,
        this.hourWork,
        this.isOpen,
        this.timeClose,
        this.timeOpen,
        this.providers,
        this.appointments,
        this.countRate,
        this.distance,
        this.typeService});

  SalonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    image = json['image'];
    rateAvg = json['rate_avg'];
    countProviders = json['count_providers'];
    hourWork = json['hour_work'];
    isOpen = json['is_open'];
    timeClose = json['time_close'];
    timeOpen = json['time_open'];
    countRate = json['count_rate'];
    distance = json['distance'];
    if (json['providers'] != null) {
      providers = <ProviderModel>[];
      json['providers'].forEach((v) {
        providers!.add(ProviderModel.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <ServiceModel>[];
      json['services'].forEach((v) {
        services!.add(ServiceModel.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = <AppointmentModel>[];
      json['appointments'].forEach((v) {
        appointments!.add(AppointmentModel.fromJson(v));
      });
    }
    if (json['type_service'] != null) {
      typeService = <TypeServiceModel>[];
      json['type_service'].forEach((v) {
        typeService!.add(TypeServiceModel.fromJson(v));
      });
    }
  }

}




