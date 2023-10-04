import 'package:bloc/bloc.dart';
import 'package:bloc_demo/screens/bloc/route_event.dart';
import 'package:bloc_demo/screens/bloc/route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState>{
  RouteBloc() : super(ButtonInitialState()) {
    on<ButtonClickedEvent>((event, emit) => emit(ButtonClickedState()));
  }
}