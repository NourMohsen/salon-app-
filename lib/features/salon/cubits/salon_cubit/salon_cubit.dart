part of '../../salon.dart';

class SalonCubit extends Cubit<SalonState> {
  final SalonRepository homeRepository;
  SalonCubit(this.homeRepository) : super( SalonState(status: HomeStatus.initial,pagingController: PagingController<int, SalonModel>(firstPageKey: 0)));

  static const _pageSize = 10;

  Future<void> getSalons(int pageKey) async {
    final res = await homeRepository.getSalons();
    final newItems = res.getOrElse(() => []);
    final isLastPage = newItems.length < _pageSize;

    if (isLastPage) {

      emit(state.copyWith(
        pagingController: state.pagingController..appendLastPage(newItems),
      ));
    } else {
      final nextPageKey = pageKey + newItems.length;
      emit(state.copyWith(
        pagingController: state.pagingController..appendPage(newItems, nextPageKey),
      ));
    }
  }

  Future<void> getServices() async {
    emit(state.copyWith(
      status: HomeStatus.servicesLoading,
    ));
    final res = await homeRepository.getServices();
    res.fold(
          (err) {
        emit(state.copyWith(
          status: HomeStatus.error,
          error: err,
        ));
      },
          (res) {
        emit(state.copyWith(
          services: res,
          status: HomeStatus.servicesLoaded,
        ));
      },
    );
  }


  void getSalonDetails(int salonId)async{
    emit(state.copyWith(
      status: HomeStatus.salonDetailsLoading,
    ));
    var res = await homeRepository.getSalonDetails(salonId);
    res.fold(
          (err) {
        emit(state.copyWith(
          status: HomeStatus.error,
          error: err,
        ));
      },
          (res) {
        emit(state.copyWith(
          status: HomeStatus.salonDetailsLoaded,
          salonDetails: res,
        ));
      },
    );

  }



}
