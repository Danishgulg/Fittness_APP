import 'package:bloc/bloc.dart';
import 'package:fit_now/requirments/model/height_model.dart';
import 'package:meta/meta.dart';

part 'height_event.dart';
part 'height_state.dart';

class HeightBloc extends Bloc<HeightEvent, HeightState> {
  HeightBloc() : super(HeightInitial()) {
      int height = 3;
      int pointValue = 0;
      String type = 'cm';

      on<OKHeightEvent>((event, emit) {
        emit(HeightValuedState(HeightModel(
            heightType: type,
            heightPointVlue: pointValue,
            height: height)));
      });

      on<HeightAddEvent>((event, emit) {
        height = event.height;
      });
      on<HeightPointValueAddEvent>((event, emit) {
        pointValue = event.pointValue;
      });
      on<HeightTypeAddEvent>((event, emit) {
         type = event.heightType;
      });
    
  }
}
