import 'package:mushroom_dick_sdk/mushroom_dick.dart';
import 'package:mushroom_dick_sdk/src/mushroom_dick_base.dart';
import 'package:mushroom_dick_sdk/src/mushroom_dick.dart';
import 'package:mushroom_dick_sdk/mushroom_dick_types.dart';

String username = '';
String password = '';

Future<void> main(List<String> args) async {
  if(args.contains('procedure')) {
    await procedureMode();
  } else {
    await objectMode();
  }
}

Future<void> procedureMode() async {
  var mushroom = MushroomDickBase();
  var user = await mushroom.login(username: username, password: password);
  var plans = (await mushroom.getPlanId(token: user['data']['token']))['data'];
  print(await mushroom.signIn(token: user['data']['token'], type: MushRoomDickType.START_WORK,planId: plans[0]['planId']));
}

Future<void> objectMode() async {
  var student = await MushroomDick.login(username: username, password: password);
  var plans = await student.planList();
  print(plans);
  print(await plans[0].signIn(type: MushRoomDickType.END_WORK));
}
