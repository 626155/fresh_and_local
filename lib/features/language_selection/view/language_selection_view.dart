import 'package:flutter/material.dart';
import 'package:fresh_and_local/features/language_selection/model/language_selection_model.dart';
import 'package:fresh_and_local/features/language_selection/view_model/language_selection_view_model.dart';
import 'package:fresh_and_local/localization/generated/l10n.dart';
import 'package:provider/provider.dart';

class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageSelectionViewModel>(context, listen: false);
    var languageList = [
      LanguageList(
          id: 1,
          languageCode: 'en',
          language: 'English',
          languageText: S.of(context).englishText),
      LanguageList(
          id: 2,
          languageCode: 'hi',
          language: "हिंदी",
          languageText: S.of(context).hindiText)
    ];
    return Scaffold(
      body: Center(
        child: ListTile(
          minLeadingWidth: 15,
          leading: const Icon(Icons.language),
          title: Text(
            S.of(context).appLanguage,
            style: const TextStyle(fontSize: 14),
          ),
          onTap: () {
            showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 29.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 22.0,
                                ),
                              ),
                              const SizedBox(width: 26.0),
                              Text(
                                S.of(context).appLanguage,
                                style: const TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        const Divider(thickness: 0.5),
                        Expanded(
                          child: ListView.builder(
                            itemCount: languageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Radio(
                                  activeColor: Colors.blue,
                                  value: languageList[index].languageCode.toString(),
                                  groupValue: language.locale.languageCode,
                                  onChanged: (value) {
                                    language.changeLanguage(Locale(languageList[index].languageCode.toString()));
                                    Navigator.pop(context);
                                  },
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${languageList[index].language}',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text('${languageList[index].languageText}',
                                      style: const TextStyle(
                                        fontSize: 13.0,
                                        color: Color(0xFFB2B6BB)
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration:  const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff827c03),
              offset:  Offset(0.0, 10.0),
              blurRadius: 20.0,
            )
          ],
        ),
        height: 70,
        child : Padding(
          padding: const EdgeInsets.all(10.0),
          child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff827c03), // background
              ),
              onPressed: () async {

              },
              child: const Text("Next",textScaleFactor: 1,)),
        ),
      ),
    );
  }
}
