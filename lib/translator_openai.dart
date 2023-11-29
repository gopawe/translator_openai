library translator_openai;

import 'package:translator_openai/clients/translator.dart';


class TranslatorOpenAIClient{

  final String openAIApikey;
  final String openAIOrgID;
  final String model;

  TranslatorOpenAIClient({
    required this.openAIApikey,
    required this.openAIOrgID,
    required this.model
  });

  TranslatorClient get translator => TranslatorClient(mainClient: this);
}