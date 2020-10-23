import '../config.dart';
import 'network.dart';

Future<Map> mushroom_planId(String token){
  return network(Uri.https(Config.host, Config.utils['getPlanId']),
  {
    'state':''
  },
  token: token);
}