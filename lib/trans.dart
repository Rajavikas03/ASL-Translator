import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:translator/translator.dart';

// import 'package:translator/translator.dart';
List<int> alphabetNumbers = [];

class transs extends StatefulWidget {
  const transs({super.key});

  @override
  State<transs> createState() => _transsState();
}

// ignore: camel_case_types
class _transsState extends State<transs> {
  String translated = 'Translation';
  late int alphabetNumber;
  @override
  void initState() {
    super.initState();

    alphabetNumbers.clear();
    // Initialize the list
    // alphabetNumbers = List<int>.generate(26, (i) => i + 1);
  }

  // @override
  // void dispose() {
  //   // Dispose of the list
  //   alphabetNumbers.clear();

  //   // Call the superclass dispose method
  //   super.dispose();
  // }

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                        sign_block(text);
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
            Gap(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 1; i <= 26; i++) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        // print()
                        width: width * 0.8,
                        height: height * 0.5,
                        child: Image.asset(
                          "assets/$i.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // Gap(10),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  // Future<dynamic> build_row(){

  // }

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
      // (text)
      // print("hiiii${text.length}");
      // List<String> characters = text.split('');
      // List<int> alphabetNumbers = [];

      // for (String character in characters) {
      //   int alphabetNumber = getAlphabetNumber(character);
      //   alphabetNumbers.add(alphabetNumber);
      // }

      // print("hiiii$alphabetNumbers");
      // print(characters);
      // print(characters.length);
      // switch (val) {
      //   case "":
      //     break;
      //   default:
      // }
      final translation = await text.translate(
        from: 'auto',
        to: 'ar',
      );
      setState(() {
        translated = translation.text;
      });
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
    }
  }

  sign_block(text) async {
    print("hiiii${text.length}");
    List<String> characters = text.split('');

    for (String character in characters) {
      alphabetNumber = getAlphabetNumber(character);
      // alphabetNumbers.add(alphabetNumber);
      print("$alphabetNumber");
    }

    // print("hiiii$alphabetNumber");
  }

  int getAlphabetNumber(String character) {
    // The list of alphabets
    List<String> alphabets = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];

    // Get the index of the character in the alphabets list
    int index = alphabets.indexOf(character.toLowerCase());

    // Return the alphabet number
    return index + 1;
  }
}

// import 'dart:async';

Future<dynamic> build_row() async {
  // Perform an asynchronous operation
  await Future.delayed(Duration(seconds: 3));

  // Build a widget asynchronously
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (int i = 1; i <= 26; i++) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              // print()
              // width: width * 0.8,
              // height: height * 0.5,
              child: Image.asset(
                "assets/$i.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Gap(10),
        ],
      ],
    ),
  );
}

// In a Flutter widget

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: build_row(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else {
          return Gap(10);
        }
      },
    );
  }
}
