import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_ui_clean_architecture/features/authentication/presentation/bloc/authentication_data_bloc.dart';
import 'package:json_ui_clean_architecture/features/home_data/data/datasources/home_data_local_data_source.dart';
import 'package:json_ui_clean_architecture/features/home_data/presentation/bloc/home_data_bloc.dart';
import 'package:json_ui_clean_architecture/features/home_data/presentation/pages/home_data_page.dart';
import 'package:provider/provider.dart';
import 'package:json_ui_clean_architecture/injection_container.dart'as di;
import 'core/util/name_change_provider.dart';
import 'features/authentication/presentation/pages/authentication_login_page.dart';
import 'features/authentication/presentation/pages/authentication_signup_page.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NameChangeProvider>(
      create: (context) => NameChangeProvider(),
      child: const MaterialApp(
        home: BlocHandler(),

      ),
    );
  }
}


class BlocHandler extends StatelessWidget {
  const BlocHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<HomeDataBloc>(
            create: (BuildContext context) => sl<HomeDataBloc>()),

        BlocProvider<AuthenticationDataBloc>(
          create: (BuildContext context) => sl<AuthenticationDataBloc>())


      ],
      child: BlocBuilder<AuthenticationDataBloc, AuthenticationDataState>(

          builder: (BuildContext context, state) {

            if(state is AuthenticationDataInitial){
              return const LoginPage();
            }
            else if( state is AuthenticationDataLoginToSignupState) {
              return const SignUp();
            }
            else if(state is AuthenticationDataSignupState) {
              return const LoginPage();
            }
            else if (state is AuthenticationDataLoginState)
              {
                return BlocBuilder<HomeDataBloc, HomeDataState>(
                builder: (BuildContext context, state){
                  if (state is HomeDataInitial) {
                return const HomePage();

              }else {
                    return container();
                  }
            },
              );
              }
            else {return LoginPage();}
          }
      ),
    );
  }

   container() {}
}