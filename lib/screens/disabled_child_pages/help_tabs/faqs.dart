import 'package:divyajaan/controllers/faqs_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../../models/faq_model.dart';

class FAQsScreen extends StatelessWidget {
  FAQsScreen({Key? key}) : super(key: key);
  // final faqs = FAQModel().faqs;

  @override
  Widget build(BuildContext context) {
    // List<FAQTopics> selectedfaqs = f6aqs;
    return Material(
      child: Consumer<FAQsController>(
        builder: (context, model, child) {
          return Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  onChanged: (value) {},
                  controller: model.editingController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              Expanded(
                child: ListView(
                    children : [...model.selectedfaqs.map((selectedfaq) => Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                          child: ExpansionTile(
                            iconColor: const Color(0xffEF6B2D),
                            textColor: const Color(0xffEF6B2D),
                            initiallyExpanded: true,
                            title: Text(
                              selectedfaq.topic,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            children: [
                              ...selectedfaq.faqs.map((faq) => ExpansionTile(
                                    iconColor: const Color(0xff00B374),
                                    textColor: const Color(0xff00B374),
                                    title: Text(faq.question,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    children: [
                                      ListTile(
                                        title: Text(faq.answer,
                                            style:
                                                const TextStyle(fontSize: 20)),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ))]),
              )
            ],
          );
        },
      ),
    );
  }
}
