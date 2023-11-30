# Translator Openai

This is a translator package for your flutter app by Abel V. Massaley.
This package uses the openai service to translate your text which is cheaper, fast and reliable.

![Logo](https://www.gopawe.com/robot_image.png)

# How it works?

There are two main translation functions to use.

Key Entry Points:
- **Translate** - same as the `translate` this method is used to translate a text from one language to another.
- **Detect** - same as `detect` this method can be used to detect the language of a given text or string of characters.
- **Detect and Translate** - same as `detectTranslate` this method can be used to detect a language of a given text or string of characters and then translate to another language.


## Installation

Add the following line to your `pubspec.yaml:`.

```yaml
dependecies:
  translator_openai: ^0.0.1
```

## Initialization

Import and use anywhere in the project
```dart
import 'package:translator_openai/translator_openai.dart';

var client = TranslatorOpenAIClient(openAIApikey: 'YOUR_OPENAI_KEY', openAIOrgID: 'YOUR_OPENORG_ID', model: 'gpt-4');
```


### Translating a text

```dart 
var translate = await client.translator.translate(fromLang, toLang, text) /// Translate a text

///RETURNS A MAP ON SUCCESS
{
    "status" : "success",
    "original_text" : "Hello, how are you today",
    "translation" : "안녕, 오늘은 어때?",
    "from" : "english",
    "to" : "korean"
}

```


### Detecting a Language from a text

```dart 
var translate = await client.translator.detect(text_to_detect) /// Detect a language

///RETURNS A MAP ON SUCCESS WITH THE DETECTED LANGUAGE LOCALE CODE like `en_us`
{
    "status" : "success",
    "original_text" : "Hello, how are you today",
    "detected_language" : "en_us",
    "from" : "english",
    "to" : "korean"
}

```


### Detecting and translate a text

```dart 
var translate = await client.translator.detectTranslate(text_to_detect, Tolanguage) /// Auto Detect a language and then translate to another language

///RETURNS A MAP ON SUCCESS WITH THE DETECTED LANGUAGE LOCALE CODE like `en_us`
{
    "status" : "success",
    "original_text" : "Hello, how are you today",
    "translation" : "안녕, 오늘은 어때?",
    "to" : "korean"
}

```


### LANGUAES AVAILABLE FOR TRANSLATIONS
It is `VERY IMPORTANT` to use these languages as stated below otherwise there might be errors.

- **English** - Parse as `english`.
- **Korean** - Parse as `korean`.
- **French** - Parse as `french`.
- **Japanese** - Parse as `japanese`.
- **Chinese** - Parse as `chinese`.
- **Arabic** - Parse as `arabic`.
- **Urdu** - Parse as `urdu`.
- **Russian** - Parse as `russian`.
- **Spanish** - Parse as `spanish`.
- **Italian** - Parse as `italian`.
- **Bengali** - Parse as `bengali`.
- **Nepali** - Parse as `nepali`.


### ALLOWED OPENAI MODELS THAT CAN BE USED
Only models listed below can be used with this package

- **gpt-4-1106-preview** - Parse as `gpt-4-1106-preview`.
- **gpt-4** - Parse as `gpt-4`.
- **gpt-4-32k** - Parse as `gpt-4-32k`.
- **gpt-4-0613** - Parse as `gpt-4-0613`.
- **gpt-4-32k-0613** - Parse as `gpt-4-32k-0613`.
- **gpt-3.5-turbo-1106** - Parse as `gpt-3.5-turbo-1106`.
- **gpt-3.5-turbo** - Parse as `gpt-3.5-turbo`.
- **gpt-3.5-turbo-16k** - Parse as `gpt-3.5-turbo-16k`.


Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change. Or connect with me on [GITHUB](https://github.com/gopawe) | [INSTAGRAM](https://www.instagram.com/abel.massaley)

## About Me
A Software Engineer Living in Seoul, South Korea
![](https://avatars.githubusercontent.com/u/69279168?v=4)


Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)