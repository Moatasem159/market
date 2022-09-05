import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';

abstract class ProfileDataSource {
  Future<UserModel> getProfile({required String? token});

  Future<UserModel> updateUserData(
      {required String? token,
      required String name,
      required String email,
      required String phone});

  Future<AddressModel> getUserAddresses({required String? token});

  Future<AddressModel> addAddress({
    required String? token,
    required String addressName,
    required String city,
    required String region,
    required String details,
    required String notes,
    required int latitude,
    required int longitude,
  });
}

class ProfileDataSourceImpl implements ProfileDataSource {
  ApiConsumer apiConsumer;

  ProfileDataSourceImpl({required this.apiConsumer});

  @override
  Future<UserModel> getProfile({required String? token}) async {
    final response = await apiConsumer.get(EndPoints.profile, token: token);
    return UserModel.fromJson(response);
  }

  @override
  Future<AddressModel> getUserAddresses({required String? token}) async {
    final response = await apiConsumer.get(EndPoints.addresses, token: token);
    return AddressModel.fromJson(response);
  }

  @override
  Future<AddressModel> addAddress(
      {required String? token,
      required String addressName,
      required String city,
      required String region,
      required String details,
      required String notes,
      required int latitude,
      required int longitude}) async {
    final response =
        await apiConsumer.post(EndPoints.addresses, token: token, body: {
      "name": addressName,
      "city": city,
      "region": region,
      "details": details,
      "notes": notes,
      "latitude": latitude,
      "longitude": longitude,
    });
    return AddressModel.fromJson(response);
  }

  @override
  Future<UserModel> updateUserData(
      {required String? token,
      required String name,
      required String email,
      required String phone})async {
    final response=await apiConsumer. put(EndPoints.updateProfile,
        token: token,
        body: {
          'name':name,
          'email':email,
          'phone':phone
        });
    return UserModel.fromJson(response);
  }
}
