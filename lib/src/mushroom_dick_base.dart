import 'login.dart';
import 'planId.dart';
import 'sign_in.dart';

/// Checks if you are awesome. Spoiler: you are.
class MushroomDickBase {
  Future<Map> login({String username, String password}) async {
    return await mushroom_login(username, password);
  }
  Future<Map> getPlanId({String token}) async {
    return await mushroom_planId(token);
  }
  Future<Map> signIn({
    String token, 
    String planId, 
    String type, 
    String address, 
    String description, 
    String province, 
    String longitude, 
    String latitude, 
    String city, 
    String country 
  }) async {
    return await mushroom_signIn(token, planId, type, address: address,description: description,province: province,longitude: longitude,latitude: latitude,city: city,country: country);
  }
}
