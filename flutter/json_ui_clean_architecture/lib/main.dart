import 'package:flutter/material.dart';
import 'package:json_ui_clean_architecture/features/home_data/presentation/pages/home_data_page.dart';
import 'package:provider/provider.dart';
import 'package:json_ui_clean_architecture/injection_container.dart'as di;
import 'core/util/name_change_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//
//       home: HomePage(),
//     );
//   }
// }

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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          routes: {

            'home': (context) => const HomePage(),
          }
      ),
    );
  }
}

