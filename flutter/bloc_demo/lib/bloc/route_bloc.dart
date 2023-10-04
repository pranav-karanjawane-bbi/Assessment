

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/route_event.dart';
import 'package:bloc_demo/bloc/route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState>{
  RouteBloc() : super(DummyScreenState()) {
    on<HomeScreenEvent>((event, emit) => emit(HomeState()));
    on<DummyScreenEvent>((event, emit) => emit (DummyScreenState()));
  }

  loadDummyScreen(){
    add(DummyScreenEvent());
  }


  loadHomeScreen(){
    add(HomeScreenEvent());
  }
}