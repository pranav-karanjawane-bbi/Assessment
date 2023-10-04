import 'package:flutter/material.dart';
import 'package:json_to_ui/Provider/name_change_provider.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final TextEditingController updatedNameController = TextEditingController();

  // getName() {
  //   final String? signUpName = prefs!.getString('signUpName');
  //   gotName = signUpName;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<NameChangeProvider>(builder: (context, provider, child) {
            return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 380.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "${getName()}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Center(
                            child: Text(
                              "Update Your Name",
                              style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          content: TextField(
                            controller: updatedNameController,
                          ),
                          actions: <Widget>[
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  provider.changeName(updatedNameController.text);
                                  prefs!.setString('signUpName', updatedNameController.text);
                                  getName();
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  color: Colors.cyanAccent,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text(
                                    "UPDATE",
                                    style:
                                        TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const SizedBox(
                      child: Icon(Icons.edit_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade200,
              ),
              onPressed: () {
                prefs!.remove('checkbox');
                Navigator.of(context).pushNamedAndRemoveUntil(
                    'login', (Route route) => false);

                // Navigator.pushReplacementNamed(context, 'login');
                // Navigator.pop(context,'home');
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              ))
        ],
            );
          }),
      ),
    );
  }
}
