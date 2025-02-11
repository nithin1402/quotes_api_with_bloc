
class DataModel{

  num total;
  int skip;
  int limit;
  List<QuotesModel> quotes;

  DataModel({required this.total,required this.skip,required this.limit,required this.quotes});

  factory DataModel.fromJson(Map<String,dynamic> json){

    List<QuotesModel> mQuotes = [];

    for(Map<String,dynamic> eachQuotes in json["quotes"]){
      var eachModel = QuotesModel.fromJson(eachQuotes);
      mQuotes.add(eachModel);
    }

    return DataModel(
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
        quotes: mQuotes);
  }

}

class QuotesModel{

  int id;
  String quote;
  String author;

  QuotesModel({required this.id,required this.quote,required this.author});

  factory QuotesModel.fromJson(Map<String,dynamic> json){
    return QuotesModel(
        id: json["id"],
        quote: json["quote"],
        author: json["author"]);
  }

}
