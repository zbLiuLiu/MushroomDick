import '../config.dart';
import 'network.dart';

Future<Map> mushroom_signIn(
  String token, 
  String planId, 
  String type, 
  {
    String address, 
    String description, 
    String province, 
    String longitude, 
    String latitude, 
    String city, 
    String country 
  }){
  address ??= Config.defaultData.containsKey('address') ? Config.defaultData['address'] : '';
  description ??= Config.defaultData.containsKey('description') ? Config.defaultData['description'] : '';
  province ??= Config.defaultData.containsKey('province') ? Config.defaultData['province'] : '';
  longitude ??= Config.defaultData.containsKey('longitude') ? Config.defaultData['longitude'] : '0.000000';
  latitude ??= Config.defaultData.containsKey('latitude') ? Config.defaultData['latitude'] : '0.000000';
  city ??= Config.defaultData.containsKey('city') ? Config.defaultData['city'] : '';
  country ??= Config.defaultData.containsKey('country') ? Config.defaultData['country'] : '';

  return network(Uri.https(Config.host, Config.utils['signIn']),
  {
    'address':address,
    'description':description,
    'province':province,
    'longitude':longitude,
    'latitude':latitude,
    'city':city,
    'country':country,
    'device':Config.device,
    'planId':planId,
    'type':type
  },
  token: token);
}