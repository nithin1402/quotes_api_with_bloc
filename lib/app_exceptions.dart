class AppExceptions implements Exception{

  String title;
  String msg;
  AppExceptions({required this.title,required this.msg});

  String toErrorMsg() {
    return "$title : $msg";
  }

}

class FetchDataException extends AppExceptions{
  FetchDataException({required String errorMsg}) : super(title: "Netword Error",msg: errorMsg);
}
class BadRequestException extends AppExceptions{
  BadRequestException({required String errorMsg}) : super(title: "Invalid Request: ",msg: errorMsg);
}
class UnauthorisedException extends AppExceptions{
  UnauthorisedException({required String errorMsg}) : super(title: "Unauthorised : ",msg: errorMsg);
}
class InvalidException extends AppExceptions{
  InvalidException({required String errorMsg}) : super(title: "Invalid Input: ",msg: errorMsg);
}