import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiHelper{

  Future<dynamic> getApi({required String url}) async{
    var uri = Uri.parse(url);

    var res = await http.get(uri);
    if(res.statusCode==200){
      var mData = jsonDecode(res.body);
      return mData;
    }else{
      return null;
    }


  }

}