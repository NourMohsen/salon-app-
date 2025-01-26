part of '../../salon.dart';


class SalonRepository {
  Future<Either<Failure, List<SalonModel>>> getSalons() async {
    try {
      final response = await dioService.get(
          endpoint: EndPoints.salons);
      if (response.data["status"]) {
        final List<SalonModel> salons = [];
        for (var i = 0; i < response.data["data"]["data"].length; i++){
          salons.add(SalonModel.fromJson(response.data["data"]["data"][i]));
        }
        return Right(salons);
      } else {
        return Left(ServerFailure(response.data['message']));
      }
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }


  Future<Either<Failure, List<ServiceModel>>> getServices() async {
    try {
      final response = await dioService.get(
          endpoint: EndPoints.services);
      if (response.data["status"]) {
        final List<ServiceModel> services = [];
        for (var i = 0; i < response.data["data"].length; i++){
          services.add(ServiceModel.fromJson(response.data["data"][i]));
        }
        return Right(services);
      } else {
        return Left(response.data['message']);
      }
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }



  Future<Either<Failure, SalonModel>> getSalonDetails(int salonId) async {
    try {
      final response = await dioService.get(
          endpoint: EndPoints.salonsDetails(salonId));
      if (response.data["status"]) {
        return Right(SalonModel.fromJson(response.data["data"]));
      } else {
        return Left(ServerFailure(response.data['message']));
      }
    }catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
