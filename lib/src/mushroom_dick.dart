import 'mushroom_dick_base.dart';

class MushroomDick{
  final MushroomDickBase _mushroomDickBase;
  final Map _user;
  MushroomDick(this._mushroomDickBase,this._user);
  static Future<MushroomDick> login({String username, String password}) async {
    var mushroom = MushroomDickBase();
    var user = await mushroom.login(username: username, password: password);
    if(user['code']==200) {
      return MushroomDick(mushroom,user['data']);
    } else {
      throw MushroomDickException('Login Error', user['code']);
    }
  }
  Future<List> planList() async {
    var plans = (await _mushroomDickBase.getPlanId(token:_user['token']))['data'];
    var planList = <MushroomDickPlan>[];
    for (var plan in plans) {
      planList.add(MushroomDickPlan(_user['token'], plan,_mushroomDickBase));
    }
    return planList;
  }
}

class MushroomDickPlan{
  final MushroomDickBase _mushroomDickBase;
  final _map;
  final _token;
  MushroomDickPlan(this._token,this._map,this._mushroomDickBase);
  Future<void> signIn({
    String type, 
    String address, 
    String description, 
    String province, 
    String longitude, 
    String latitude, 
    String city, 
    String country 
  }) async {
    print(_map);
    var result = await _mushroomDickBase.signIn(token: _token,planId: _map['id'],type: type,address: address,description: description,province: province,longitude: longitude,latitude: latitude,city: city,country: country);
    if(result['code']!=200) throw MushroomDickException(result['msg'], result['code']);
  }
}

class MushroomDickException implements Exception{
  final message;
  final code;
  MushroomDickException(this.message, this.code);
  @override
  String toString(){
    return '[MushroomDickException]: '+code.toString()+' - '+message.toString();
  }
}