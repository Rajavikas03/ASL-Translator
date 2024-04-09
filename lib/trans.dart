import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:translator/translator.dart';

class Gif {
  final String GifName;
  final String GifImg;

  Gif({
    required this.GifName,
    required this.GifImg,
  });
}

// import 'package:translator/translator.dart';
List<int> alphabetNumbers = [];
List<Gif> gif = [
  Gif(GifName: "baby", GifImg: "gif/baby.gif"),
  Gif(GifName: "change", GifImg: "gif/change.gif"),
  Gif(GifName: "clean", GifImg: "gif/clean.gif"),
  Gif(GifName: "dirty", GifImg: "gif/dirty.gif"),
  Gif(GifName: "food", GifImg: "gif/food.gif")
];

class transs extends StatefulWidget {
  const transs({super.key});

  @override
  State<transs> createState() => _transsState();
}

// ignore: camel_case_types
class _transsState extends State<transs> {
  String translated = 'Translation';
  TextEditingController textcontroller = TextEditingController();
  late int alphabetNumber;

  @override
  void initState() {
    super.initState();
    alphabetNumbers.clear();
  }

  @override
  void dispose() {
    alphabetNumbers.clear();
    super.dispose();
  }

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
                      controller: textcontroller,
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
            const Gap(20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  translateText(textcontroller.text);
                  sign_block(textcontroller.text);
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 10, right: 10),
                  child: Text(
                    "Generate",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                )),
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < alphabetNumbers.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        // print()
                        width: width * 0.8,
                        height: height * 0.5,
                        child: Image.asset(
                          "assets/${alphabetNumbers[i]}.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Gap(40),
            Container(
              height: height * 0.4,
              width: width * 0.8,
              child: Image.asset(gif[4].GifImg),
            )
          ],
        ),
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

  Future<void> translateText(String text) async {
    if (text.isNotEmpty) {
      try {
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
    } else {
      translated = "Translation";
    }
  }

  sign_block(String text) async {
    if (text.isNotEmpty) {
      try {
        alphabetNumbers.clear();
        final List<String> characters = text.toLowerCase().characters.toList();
        for (String character in characters) {
          alphabetNumber = getAlphabetNumber(character);
          alphabetNumbers.add(alphabetNumber);
        }
      } catch (error, stackTrace) {
        handleError(error, stackTrace);
      }
    } else {
      alphabetNumbers.clear();
    }
  }

  int getAlphabetNumber(String character) {
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
    int index = alphabets.indexOf(character.toLowerCase());
    return index + 1;
  }
}
