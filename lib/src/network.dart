import 'dart:convert';

import 'package:http/http.dart' as http;
import '../config.dart';

Future<Map> network(Uri url,Map data,{String token}) async {
  var header = <String,String>{
    'User-Agent':Config.userAgent,
    'roleKey': 'student',
    'Accept-Language': 'zh-CN,en;q=0.8',
    'Accept-Encoding': 'gzip, deflate',
    'Content-Type': 'application/json; charset=UTF-8',
    'Connection': 'close',
    'Cache-Control': 'no-cache'
  };
  if(token != null) header['Authorization'] = token;
  var r = await http.post(url,headers: header,body: jsonEncode(data));
  try{
    return jsonDecode(r.body);
  }on Exception catch(e){
    return {'code':r.statusCode,'error':e};
  }
}