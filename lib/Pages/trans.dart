import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:gif_view/gif_view.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:translator_2/Utils/Methods.dart';
import '../Gif/GifData.dart';
import '../Theme/theme.dart';

List<int> alphabetNumbers = [];
// ignore: non_constant_identifier_names
String Result = "";

// ignore: camel_case_types
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
      drawer: Drawer(
        backgroundColor: theme.background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Icon(
                    Icons.translate,
                    size: 80,
                    color: Provider.of<ThemeProvider>(context, listen: false)
                            .isDarkMode
                        ? theme.primary
                        : theme.tertiary,
                  ),
                  const Text(
                    "ASL Trans",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: theme.primaryContainer,
                  title: Row(
                    children: [
                      const Text(
                        "Theme :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? const Text(" DarkMode")
                          : const Text(" LightMode")
                    ],
                  ),
                  trailing: CupertinoSwitch(
                    activeColor:
                        Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode
                            ? theme.primary
                            : theme.tertiary,
                    trackColor:
                        Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode
                            ? theme.onPrimary
                            : theme.onPrimary,
                    thumbColor:
                        Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode
                            ? theme.onPrimaryContainer
                            : theme.background,
                    value: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkMode,
                    onChanged: (value) =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  // height: height * 0.6,
                  child: Card(
                    color: theme.primaryContainer,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "About",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              Gap(8),
                              Icon(
                                Icons.info_outline,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Text to ASL Generator Tool\nAmerican Sign Language (ASL) is a natural language. It is the primary sign language used by the deaf and people with hearing impairment in the USA and Canada.\nEnglish to Sign Language (ASL) Translator\nEnter English Text\nEnter English Text Here...\nText to ASL Generator Tool\nAmerican Sign Language (ASL) is a natural language. It is the primary sign language used by the deaf and people with hearing impairment in the USA and Canada.\nAmerican Sign Language is one of the most popular sign languages around the world. Although it contains the same alphabets as English, it is not a subset of the English language. Sentence formation or the sequence of words in a sentence is different in ASL as compared to English because of its unique grammar rules. ASL is considered to be a descendant of French Sign Language that is also influenced by Martha's Vineyard Sign Language and some other local sign languages. ASL uses the one-hand fingerspelling method for the English Alphabet.\nThis WeCapable Tool easily converts English text into sign language symbols. This tool will be very useful for both teaching and learning American sign language.\nSign language alphabet\nTranslation of text to sign language is also be given as a task during sign language study session. This tool can easily produce the correct answers and because the visual stays on screen, students can follow the hand movements at their own pace.",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: theme.background,
      appBar: AppBar(
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
              height: height * 0.45,
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
                  signBlock(textcontroller.text);
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
            // SizedBox(
            // height: height * 0.5,
            // width: width * 0.8,
            // child:
            Result.isNotEmpty
                ? SizedBox(
                    height: height * 0.25,
                    width: width * 0.8,
                    child: GifView.asset(
                      Result,
                      height: 400,
                      repeat: ImageRepeat.repeat,
                    ),
                  )
                : SizedBox(
                    height: height * 0.5,
                    width: width * 0.8,
                    child: Column(
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
            // ),
            const Gap(50),

            // Text("$errorMessage")
          ],
        ),
      ),
    );
  }

// Error handler
  void handleError(dynamic error, StackTrace stackTrace) {
    // print('Error: $error');
    // print('Stack trace: $stackTrace');
    setState(() {
      // var errorMessage = 'An error occurred: $error';
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
  void signBlock(String text) async {
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
