import 'package:api_bloc/quotes_model.dart';

abstract class QuoteState{}

class QuoteInitialState extends QuoteState{}
class QuoteLoadingState extends QuoteState{}
class QuoteLoadedState extends QuoteState{
  DataModel resData;
  QuoteLoadedState({required this.resData});
}
class QuoteErrorState extends QuoteState{
  String errorMsg;
  QuoteErrorState({required this.errorMsg});
}