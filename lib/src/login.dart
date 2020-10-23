import '../config.dart';
import 'network.dart';

Future<Map> mushroom_login(String username, String password) async {
  return network(Uri.https(Config.host, Config.utils['login']),
  {
    'phone':username,
    'uuid':'',
    'password':password,
    'loginType':'android'
  });
}