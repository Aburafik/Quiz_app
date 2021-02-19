class QuizeBank {
  String question;
  bool isCorrect;

  QuizeBank(this.question, this.isCorrect);
}

List<QuizeBank> quizer = [
    QuizeBank("We vote president in November", false),
    QuizeBank("There are 275 constituencies in Ghana", true),
    QuizeBank("There are four arms of government in Ghana", false),
    QuizeBank("There are 17 regions in Ghana", false),
    QuizeBank("The president is the first citizen of the country", true),
    QuizeBank("The sit of government is called the White house", false),
    QuizeBank("Ghana is in west africa", true),
    QuizeBank("There are three seasons in ghana", false),
  ];