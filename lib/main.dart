import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import "package:universal_html/js.dart" as js;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final prefs = await SharedPreferences.getInstance();
        const isWebDialogShownKey = "is-web-dialog-shown";
        final isWebDialogShown = prefs.getBool(isWebDialogShownKey) ?? false;
        if (!isWebDialogShown) {
          final bool isDeferredNotNull =
          js.context.callMethod("isDeferredNotNull") as bool;

          if (isDeferredNotNull) {
            debugPrint(">>> Add to HomeScreen prompt is ready.");
            await showAddHomePageDialog(context);
            prefs.setBool(isWebDialogShownKey, true);
          } else {
            debugPrint(">>> Add to HomeScreen prompt is not ready yet.");
          }
        }
      });
    }
  }

  Future<bool?> showAddHomePageDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Icon(
                    Icons.add_circle,
                    size: 70,
                    color: Theme.of(context).primaryColor,
                  )
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Add to Homepage',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Want to add this application to home screen?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      js.context.callMethod("presentAddToHome");
                      Navigator.pop(context, false);
                    },
                    child: const Text("Yes!"))
              ],
            ),
          ),
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}