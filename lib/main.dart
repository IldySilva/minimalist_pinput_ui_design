import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlueAccent, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final cursor = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: 21,
      height: 1,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 146, 160, 1),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle:  TextStyle(fontSize: 20, color:  Theme.of(context).colorScheme.onBackground),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 235, 241, 0.37),
        borderRadius: BorderRadius.circular(24),
      ),
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.flutter_dash,
                color: Colors.grey,
                size: 80,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "V E R I F I C A T I O N",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const Text(
                "Enter The Code sent to your number",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 25,
              ),
              Pinput(
                length: 4,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 16),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                        offset: Offset(0, 3),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                ),
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   controller.setText(value);
                // },
                showCursor: true,
                cursor: cursor,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Validate")),
              const SizedBox(
                height: 200,
              ),
              const Text("Didn't receive a code?"),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Resend",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
