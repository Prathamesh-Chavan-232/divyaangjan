class FAQModel{
  var faqs = [
    FAQTopics(
      topic: "Exam Related Questions", 
      faqs: [
        FAQs(question: "Why exams happen?", answer: "I don't know."), 
        FAQs(question: "Why do we have to give exams?", answer: "I still don't know.")
        ]),
    FAQTopics(
      topic: "Assignment Related Questions", 
      faqs: [
        FAQs(question: "Why assignments happen?", answer: "I don't know."), 
        FAQs(question: "Why do we have to write assignments?", answer: "I still don't know.")
        ]),
    FAQTopics(
      topic: "Class Related Questions", 
      faqs: [
        FAQs(question: "Why classes happen?", answer: "I don't know."), 
        FAQs(question: "Why do we have to sit in classes?", answer: "I still don't know.")
        ]),
  ];
}

class FAQTopics {
  String topic;
  List<FAQs>faqs;
  FAQTopics({
    required this.topic,
    required this.faqs,
  });
}

class FAQs {
  String question;
  String answer;
  FAQs({
    required this.question,
    required this.answer,
  });
}
