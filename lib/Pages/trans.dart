import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:translator_2/Utils/Methods.dart';
import '../Gif/GifData.dart';
import '../Theme/theme.dart';

List<int> alphabetNumbers = [];
String Result = "";

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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                      ? theme.primary
                      : theme.onPrimary,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
        leading: Icon(
          Icons.translate,
          color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
              ? theme.primary
              : theme.tertiary,
        ),
        centerTitle: true,
        title: Text(
          'Translation',
          style: TextStyle(color: theme.onPrimary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.primaryContainer,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            SizedBox(
              height: height * 0.4,
              child: Card(
                color: theme.primaryContainer,
                margin: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      'English US: ',
                      style: TextStyle(color: theme.onPrimary),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    TextField(
                      controller: textcontroller,
                      cursorColor: theme.primary,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryContainer),
                      decoration: InputDecoration(
                          fillColor:
                              Provider.of<ThemeProvider>(context, listen: false)
                                      .isDarkMode
                                  ? theme.background
                                  : theme.background,
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
                          hintStyle: TextStyle(color: theme.primaryContainer)),
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
                      text: TextSpan(
                        style: TextStyle(color: theme.onPrimary),
                        children: <TextSpan>[
                          const TextSpan(text: 'TO: '),
                          TextSpan(
                              text: ' (Arabic)',
                              style: TextStyle(
                                color: Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .isDarkMode
                                    ? theme.primary
                                    : theme.tertiary,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      translated,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                    .isDarkMode
                                ? theme.primary
                                : theme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? theme.primary
                          : theme.primaryContainer,
                ),
                onPressed: () {
                  // print("Textfield controller: ${textcontroller.text}");
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
            const Gap(40),
            SizedBox(
              height: height * 0.5,
              width: width * 0.8,
              child: Result.isNotEmpty
                  ? Image.asset(Result)
                  : Column(
                      children: [
                        Text(
                          "Gif Not Availabe",
                          style: TextStyle(
                            color: Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .isDarkMode
                                ? theme.primary
                                : theme.primaryContainer,
                            fontSize: 30,
                          ),
                        ),
                        Image.asset(
                          "gif/error.png",
                          color:
                              Provider.of<ThemeProvider>(context, listen: false)
                                      .isDarkMode
                                  ? theme.primary
                                  : theme.primaryContainer,
                        ),
                      ],
                    ),
            ),

            // Text("$errorMessage")
          ],
        ),
      ),
    );
  }

// Error handler
  void handleError(dynamic error, StackTrace stackTrace) {
    print('Error: $error');
    print('Stack trace: $stackTrace');
    setState(() {
      var errorMessage = 'An error occurred: $error';
      const trans = "Translation";
      translated = trans;
    });
  }

// Translate Text
  Future<void> translateText(String text) async {
    try {
      if (text.trim().isNotEmpty) {
        // print("if");
        // print("translate text: ${translation.text}");
        final translation = await text.translate(
          from: 'auto',
          to: 'ar',
        );
        setState(() {
          // print(" Empty space: ${text.trim().isNotEmpty}");
          translated = translation.text;
          // print("translate text: ${translation.text}");
        });
      } else {
        // print("else");
        translated = "Translation";
      }
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
    }
  }
  // }

// Sign coverision
  void sign_block(String text) async {
    if (text.isNotEmpty) {
      try {
        // if (Result.isEmpty) {
        setState(() {
          alphabetNumbers.clear();
        });
        final List<String> characters = text.toLowerCase().characters.toList();
        for (String character in characters) {
          alphabetNumber = My_services().getAlphabetNumber(character);
          alphabetNumbers.add(alphabetNumber);
        }
        // }
        if (text.trim().isNotEmpty) {
          for (int i = 0; i < gif.length; i++) {
            print(text);

            if (text.toLowerCase() == gif[i].GifName) {
              // print("if statement");
              setState(() {
                Result = gif[i].GifImg;
              });
              break;
            } else {
              Result = "";
            }
          }
        } else {
          setState(() {
            Result = "gif/error.png";
          });
        }
      } catch (error, stackTrace) {
        handleError(error, stackTrace);
      }
    } else if (text.trim().isEmpty) {
      setState(() {
        Result = "gif/error.png";
      });
    } else {
      alphabetNumbers.clear();
    }
  }
}
