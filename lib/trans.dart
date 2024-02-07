import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
// import 'package:translator/translator.dart';

class transs extends StatefulWidget {
  const transs({super.key});

  @override
  State<transs> createState() => _transsState();
}

// ignore: camel_case_types
class _transsState extends State<transs> {
  String translated = 'Translation';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: const Icon(
          Icons.translate,
          color: Colors.lightBlueAccent,
        ),
        centerTitle: true,
        title: const Text(
          'Translation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.04
              // .height * 0.04,
              ),
          SizedBox(
            height: height * 0.4,
            child: Card(
              color: Colors.black,
              margin: const EdgeInsets.all(12),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'English US: ',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  TextField(
                    cursorColor: Colors.lightBlueAccent,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey[850],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Enter text",
                    ),
                    onChanged: (text) async {
                      try_block(text);
                    },
                  ),
                  Divider(
                    thickness: width * 0.0009,
                    height: height * 0.06,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(text: 'TO: '),
                        TextSpan(
                            text: ' (Arabic)',
                            style: TextStyle(color: Colors.lightBlueAccent))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    translated,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Error handler for null vale passed in textfield  #######
  void handleError(dynamic error, StackTrace stackTrace) {
    print('Error: $error');
    print('Stack trace: $stackTrace');
    setState(() {
      var errorMessage = 'An error occurred: $error';
      const trans = "Translation";
      translated = trans;
    });
  }

  Future<void> try_block(String text) async {
    try {
      final translation = await text.translate(
        from: 'en',
        to: 'ar',
      );
      setState(() {
        translated = translation.text;
      });
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
    }
  }
}
