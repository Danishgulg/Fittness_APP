import 'package:bloc/bloc.dart';
import 'package:fit_now/home/calender/calender_data.dart';
import 'package:meta/meta.dart';

part 'calender_data_event.dart';
part 'calender_data_state.dart';

class CalenderDataBloc extends Bloc<CalenderDataEvent, CalenderDataState> {

  // get the list from the database or firebase and save them according to month name 

 
  
  CalenderDataBloc() : super(CalenderDataInitialState()) {
    on<CalenderDataEvent>((event, emit) {

    });
  }
}
