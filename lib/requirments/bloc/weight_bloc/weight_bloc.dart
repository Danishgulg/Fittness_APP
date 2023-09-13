import 'package:bloc/bloc.dart';
import 'package:fit_now/requirments/model/weight_model.dart';
import 'package:meta/meta.dart';

part 'weight_event.dart';
part 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightInitialState()) {
     int weight = 34;
      int pointValue = 0;
      String typeWeight = 'kg';

    on<OkWeightEvent>((event, emit) {
     
     

      emit(WeightValuedState(WeightModel(
          typeOfWeight: typeWeight,
          weightPointValue: pointValue,
          weight: weight)));
    });

     on<WeightAddEvent>((event, emit) {
        weight = event.weight;
      });
      on<WeightPointValueAddEvent>((event, emit) {
        pointValue = event.pointValue;
      });
      on<WeightTypeAddEvent>((event, emit) {
        typeWeight = event.weightType;
      });
  }
}
