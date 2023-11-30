import 'package:flutter/material.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:translator_openai/clients/languages.dart';

import '../translator_openai.dart';



class TranslatorClient{

  final TranslatorOpenAIClient mainClient;

  TranslatorClient({required this.mainClient});


  ///METHOD FOR TRANSLATING A TEXT
  Future<Map<String, dynamic>> translate(String fromLanguage, String toLanguage, String text)async{
    final client = OpenAIClient(
      apiKey: mainClient.openAIApikey,
      organization: mainClient.openAIOrgID,
    );

    if(kAvailableLanguages.contains(fromLanguage) == false){
      return {"status" : "error", "message" : "The from-language '$fromLanguage' is not yet supported"};
    }else if(kAvailableLanguages.contains(toLanguage) == false){
      return {"status" : "error", "message" : "The to-language '$toLanguage' is not yet supported"};
    }else{
      ///CHECK IF THE MODEL EXISTS
      if(kAllowedModels.contains(mainClient.model)){
        final res = await client.createChatCompletion(
          request: CreateChatCompletionRequest(
            model: ChatCompletionModel.modelId(mainClient.model),
            maxTokens: 2000,
            temperature: 0,
            topP: 1,
            messages: [
              const ChatCompletionMessage.system(
                content: "You are a helpful translator that detect a text and return only the locale code of the language the text was written in. Example format ' en_us ' ",
              ),
              ChatCompletionMessage.user(
                content: ChatCompletionUserMessageContent.string("translate '$text' from $fromLanguage to $toLanguage "),
              ),
            ],
          ),
        );
        return {"status" : "success", "translation" : res.choices.first.message.content, "original_text" : text, "from" : fromLanguage, "to" : toLanguage};
      }else{
        return {"status" : "error", "message" : "Invalid or unsupported openAI model"};
      }
    }
  }





  ///METHOD FOR DETECTING A STRING OF TEXT LANGUAGE
  Future<dynamic> detect(String text)async{
    final client = OpenAIClient(
      apiKey: mainClient.openAIApikey,
      organization: mainClient.openAIOrgID,
    );

      ///CHECK IF THE MODEL EXISTS
      if(kAllowedModels.contains(mainClient.model)){
        final res = await client.createChatCompletion(
          request: CreateChatCompletionRequest(
            model: ChatCompletionModel.modelId(mainClient.model),
            maxTokens: 5,
            messages: [
              const ChatCompletionMessage.system(
                content: "You are a helpful translator that detect a text and return only the locale code of the language the text was written in. Example format ' en_us ' ",
              ),
              ChatCompletionMessage.user(
                content: ChatCompletionUserMessageContent.string("what language is '$text' written in"),
              ),
            ],
            temperature: 0,
          ),
        );
        return {"status" : "success", "detected_language" : res.choices.first.message.content, "original_text" : text};
      }else{
        return {"status" : "error", "message" : "Invalid or unsupported openAI model"};
      }
  }


  ///METHOD FOR DETECTING AND TRANSLATING A MESSAGE
  Future<dynamic> detectTranslate(String text, toLang)async{
    final client = OpenAIClient(
      apiKey: mainClient.openAIApikey,
      organization: mainClient.openAIOrgID,
    );




    if(kAvailableLanguages.contains(toLang) == false){
      return {"status" : "error", "message" : "The to-language '$toLang' is not yet supported"};
    }else{
      ///CHECK IF THE MODEL EXISTS
      if(kAllowedModels.contains(mainClient.model)){
        final res = await client.createChatCompletion(
          request: CreateChatCompletionRequest(
            model: ChatCompletionModel.modelId(mainClient.model),
            maxTokens: 5,
            messages: [
              const ChatCompletionMessage.system(
                content: "You are a helpful translator that translate a string or text to another language. ",
              ),
              ChatCompletionMessage.user(
                content: ChatCompletionUserMessageContent.string("translate '$text' to '$toLang'"),
              ),
            ],
            temperature: 0,
          ),
        );

        return {"status" : "success", "translation" : res.choices.first.message.content, "original_text" : text, "to" : toLang};
      }else{
        return {"status" : "error", "message" : "Invalid or unsupported openAI model"};
      }
    }

  }

}