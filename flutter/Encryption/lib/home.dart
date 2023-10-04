import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:io';

final Directory imageData =
    Directory('/storage/emulated/0/Documents/dummyData');
String filename = "sky.jpeg";
File localImage = File('/storage/emulated/0/Documents/dummyData/sky.jpeg');

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGranted = true;

  Future<Directory> get getMyDir async {
    final internalDir =
        Directory('/storage/emulated/0/Documents/dummyData/sky.jpeg');
    return internalDir;
  }

  Future<Directory> get getExternalVisibleDir async {
    if (await Directory('/storage/emulated/0/Documents/encrypted_data')
        .exists()) {
      final externalDir =
          Directory('/storage/emulated/0/Documents/encrypted_data');
      return externalDir;
    } else {
      await Directory('/storage/emulated/0/Documents/encrypted_data')
          .create(recursive: true);
      final externalDir =
          Directory('/storage/emulated/0/Documents/encrypted_data');
      return externalDir;
    }
  }

  requestStoragePermission() async {
    if (!await Permission.storage.isGranted) {
      PermissionStatus result = await Permission.storage.request();
      if (result.isGranted) {
        setState(() {
          _isGranted = true;
        });
      } else {
        _isGranted = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    requestStoragePermission();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encryption & Decryption"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  if (_isGranted) {
                    Directory d = await getExternalVisibleDir;
                    create(d, filename);

                    Directory m = await getMyDir;
                    var dir = Directory(m.toString());
                   await dir.deleteSync(recursive: true);
                    // Directory m = await getMyDir;
                    // await deleteFile(m);


                  }
                  else {
                    print("No permission granted");
                    requestStoragePermission();
                  }
                },
                child: const Text("Encrypt")),
            ElevatedButton(
                onPressed: () async {
                  if (_isGranted) {
                    Directory d = await getExternalVisibleDir;
                    _getNormalFile(d, filename);
                  }
                },
                child: const Text("Decrypt")),
          ],
        ),
      ),
    );
  }
}


create(Directory d, filename) async {
  Uint8List imgBytes = await localImage.readAsBytes();
  var encResult = _encrypt(imgBytes);
  String p = await _writeData(encResult, d.path + '/$filename.aes');
  print("files encrypted successfully! $p");

}

_encrypt(plainString) {
  print("encripting file...");
  final encrypted =
      PkEncrypt.pkEncrypter.encryptBytes(plainString, iv: PkEncrypt.myIv);
  return encrypted.bytes;
}

Future<String> _writeData(dataToWrite, fileNameWithPath) async {
  print("changing file name extension");
  File f = File(fileNameWithPath);
  await f.writeAsBytes(dataToWrite);
  return f.absolute.toString();
}

class PkEncrypt {
  static final myKey = enc.Key.fromUtf8('Beastkillerrahul');
  static final myIv = enc.IV.fromUtf8('pranavkaranjawa');
  static final pkEncrypter = enc.Encrypter(enc.AES(myKey));
}

//
_getNormalFile(Directory d, filename) async {
  Uint8List encodedData = await _readData(d.path + '/$filename.aes');
  var plainData = await _decrypt(encodedData);
  String p = await _writeData(plainData, d.path + '/$filename');
}

_decrypt(encodedData) {
  enc.Encrypted en = new enc.Encrypted(encodedData);
  return PkEncrypt.pkEncrypter.decryptBytes(en, iv: PkEncrypt.myIv);
}

Future<Uint8List> _readData(fileNameWithPath) async {
  File f = File(fileNameWithPath);
  return await f.readAsBytes();
}

Future<void> deleteFile(file) async {
  await file.delete();
}


