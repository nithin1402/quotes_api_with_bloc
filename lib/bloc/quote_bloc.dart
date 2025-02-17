import 'package:api_bloc/api_helper.dart';
import 'package:api_bloc/app_exceptions.dart';
import 'package:api_bloc/bloc/quote_event.dart';
import 'package:api_bloc/bloc/quote_state.dart';
import 'package:api_bloc/quotes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../urls.dart';

class QuoteBloc extends Bloc<QuoteEvent,QuoteState>{

  ApiHelper apiHelper;

  QuoteBloc({required this.apiHelper}) : super(QuoteInitialState()){

    on<GetQuotesEvent>((event,emit) async{

      emit(QuoteLoadingState());
      try {
        var resJson = await apiHelper.getApi(url: Urls.getQuotesUrl);
        if(resJson!=null){
          var mResData = DataModel.fromJson(resJson);
          emit(QuoteLoadedState(resData: mResData));
        }else{
          emit(QuoteErrorState(errorMsg: "Uhh..No!!, Error Occurred."));
        }
      }catch (e){
        emit(QuoteErrorState(errorMsg: (e as AppExceptions).toErrorMsg()));
      }
     

    });

  }


}