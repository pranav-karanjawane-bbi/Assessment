import 'package:bloc_demo/bloc/route_bloc.dart';
import 'package:bloc_demo/screens/dumy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/route_state.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlocHandler(),
    );
  }
}


class BlocHandler extends StatelessWidget {
  const BlocHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<RouteBloc>(
            create: (BuildContext context) => RouteBloc())


      ],
      child: BlocBuilder<RouteBloc, RouteState>(

        builder: (BuildContext context, state) {

          if(state is HomeState){
            return HomePage();
          }else
            return TempPage();
          }



      ),
    );
  }
}

