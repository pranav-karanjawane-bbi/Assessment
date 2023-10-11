

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/utility.dart';
import '../../data/models/home_data_model.dart';
import '../../domain/usecase/get_offline_home_data.dart';
import '../../domain/usecase/get_online_home_data.dart';

part 'home_data_event.dart';
part 'home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  GetOfflineSwitchedValue getOfflineSwitchedValue;
  GetOnlineSwitchedValue getOnlineSwitchedValue;

  HomeDataBloc(
      {required this.getOfflineSwitchedValue, required this.getOnlineSwitchedValue})
      : super(HomeDataInitial()) {
    on<HomeScreenEvent>((event, emit) => (HomeDataInitial()));
  }


  Future<List<HomeDataModel>> callDecider() async {
    if (isSwitched! == false) {
      await getOfflineSwitchedValue();
    }

    if (isSwitched! == true) {
      await getOnlineSwitchedValue();
    }

    return (objList);
  }

  loadHomeFeatureScreen() {
    add(HomeScreenEvent());
  }

}
