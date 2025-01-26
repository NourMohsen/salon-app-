part of '../../salon.dart';


extension SalonStatusX on SalonState {
  bool get isInitial => status == HomeStatus.initial;
  bool get isSalonsLoading => status == HomeStatus.salonsLoading;
  bool get isSalonsLoaded => status == HomeStatus.salonsLoaded;
  bool get isSalonDetailsLoading => status == HomeStatus.salonDetailsLoading;
  bool get isSalonDetailsLoaded => status == HomeStatus.salonDetailsLoaded;
  bool get isServicesLoading => status == HomeStatus.servicesLoading;
  bool get isServicesLoaded => status == HomeStatus.servicesLoaded;
  bool get isError => status == HomeStatus.error;

}

class SalonState {
  late PagingController<int, SalonModel> pagingController;
  final HomeStatus status;
  final List<SalonModel>? salons;
  final List<ServiceModel>? services;
  final SalonModel? salonDetails;
  final Failure? error;
  SalonState(
      {required this.status,this.salons,this.services,this.salonDetails,this.error,required this.pagingController});

  SalonState copyWith({
    HomeStatus? status,
    List<SalonModel>? salons,
    List<ServiceModel>? services,
    SalonModel? salonDetails,
    PagingController<int, SalonModel>? pagingController,
    Failure? error,
  }) {
    return SalonState(
      status: status ?? this.status,
      salons: salons ?? this.salons,
      services: services ?? this.services,
      salonDetails: salonDetails ?? this.salonDetails,
      pagingController: pagingController ?? this.pagingController,
      error: error ?? this.error,
    );
  }


}



