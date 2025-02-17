import 'dart:convert';
import 'dart:io';

import 'package:api_bloc/app_exceptions.dart';
import 'package:http/http.dart' as http;
class ApiHelper{

  Future<dynamic> getApi({required String url}) async{
    var uri = Uri.parse(url);

    try {
      var res = await http.get(uri);
      return returnJsonResponse(res);
    } on SocketException catch(e){
        throw(FetchDataException(errorMsg: "No Internet!!"));
    }
  }

  dynamic returnJsonResponse(http.Response response){

    switch(response.statusCode){
      case 200:{
        var mData = jsonDecode(response.body);
        return mData;
      }

      case 300:
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
        case 401:
      case 403:
      throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      case 502:
        default:
      throw FetchDataException(errorMsg: "Error occured while communication with serverwith statuscode : ${response.statusCode}");
    }

    if(response.statusCode==200){
      var mData = jsonDecode(response.body);
      return mData;
    }else{
      return null;
    }
  }

}