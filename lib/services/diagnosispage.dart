// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SymptomCheckerPage extends StatefulWidget {
//   @override
//   _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
// }

// class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
//   final String _apiKey = 'Yc4q8E3Xzk2KFb56H';

//   String _inputText = '';
//   List<dynamic> _possibleConditions = [];

//   void _handleSubmit() async {
//     // Send user input to Apimedic API for analysis
//     final url = Uri.parse('https://sandbox-healthservice.priaid.ch/symptoms');
//     // final url = Uri.parse('https://healthservice.priaid.ch/symptoms?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImNlZHJpY2dnZEBnbWFpbC5jb20iLCJyb2xlIjoiVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjkyNzAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIxMDkiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiMTAwIiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiQmFzaWMiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xhbmd1YWdlIjoiZW4tZ2IiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2V4cGlyYXRpb24iOiIyMDk5LTEyLTMxIiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwc3RhcnQiOiIyMDIzLTAzLTA2IiwiaXNzIjoiaHR0cHM6Ly9hdXRoc2VydmljZS5wcmlhaWQuY2giLCJhdWQiOiJodHRwczovL2hlYWx0aHNlcnZpY2UucHJpYWlkLmNoIiwiZXhwIjoxNjc4MTE5MDM1LCJuYmYiOjE2NzgxMTE4MzV9.QhuxnKeAuTaml80dVdDw3-K0utwTN1QPFnsD8sjZmv4&format=json&language=en-gb');
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $_apiKey',
//     };
//     final body = {
//       'language': 'en-gb',
//       'format': 'json',
//       'symptoms': [_inputText],
//     };
//     final response = await http.post(url, headers: headers, body: jsonEncode(body));
//     final List<dynamic> data = jsonDecode(response.body);

//     // Extract possible conditions from API response
//     setState(() {
//       _possibleConditions = data[0]['Issue'].map((issue) => issue['Name']).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Symptom Checker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Enter your symptoms',
//               ),
//               onChanged: (text) {
//                 setState(() {
//                   _inputText = text;
//                 });
//               },
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _handleSubmit,
//               child: Text('Submit'),
//             ),
//             SizedBox(height: 16),
//             Text('Possible conditions:'),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _possibleConditions.length,
//                 itemBuilder: (context, index) {
//                   final condition = _possibleConditions[index];
//                   return ListTile(
//                     title: Text(condition),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// class UserForm extends StatefulWidget {
//   @override
//   _UserFormState createState() => _UserFormState();
// }

// class _UserFormState extends State<UserForm> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   int age = 0;
//   String gender = '';
//   List<String> symptoms = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your name';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 name = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Age',
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your age';
//                 }
//                 if (int.tryParse(value) == null) {
//                   return 'Please enter a valid age';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 age = int.parse(value!);
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Gender',
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your gender';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 gender = value!;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Symptoms',
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your symptoms';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 symptoms = value!.split(',').map((s) => s.trim()).toList();
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   _sendUserDataToApi(name, age, gender, symptoms);
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _sendUserDataToApi(String name, int age, String gender, List<String> symptoms) {
// ignore: todo
//     // TODO: Implement sending data to Node.js API
//   }
// }



// ignore_for_file: avoid_print, depend_on_referenced_packages

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Question {
//   final String text;
//   final List<Choice> choices;

//   Question({required this.text, required this.choices});

//   factory Question.fromJson(Map<String, dynamic> json) {
//     List<Choice> choices = [];
//     for (var choice in json['items']) {
//       choices.add(Choice.fromJson(choice));
//     }
//     return Question(text: json['text'], choices: choices);
//   }
// }

// class Choice {
//   final String label;
//   final String value;

//   Choice({required this.label, required this.value});

//   factory Choice.fromJson(Map<String, dynamic> json) {
//     return Choice(label: json['label'], value: json['id']);
//   }
// }

// class QuestionsPage extends StatefulWidget {
//   const QuestionsPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _QuestionsPageState createState() => _QuestionsPageState();
// }

// class _QuestionsPageState extends State<QuestionsPage> {
//   List<Question> _questions = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchQuestions();
//   }

//   Future<void> _fetchQuestions() async {
//     print('step 1');
//     try{
//       print('hey');
//       final response = await http.get(
//       Uri.parse('https://api.infermedica.com/v3/'),
//       headers: {
//         'App-Id': '94e30f49',
//         'App-Key': '7fbb334b201c64879eb88f639de3be5f',
//         'Content-Type': 'application/json',
//       },
//     );
//     print(response.statusCode);
//      if (response.statusCode == 200) {
//        print(response.statusCode);
//       print('hey 2');
//       final List<dynamic> data = json.decode(response.body)['questions'];
//       setState(() {
//         _questions = data.map((question) => Question.fromJson(question)).toList();
//       });
//     }else if(response.statusCode == 404){
//        print(response.statusCode);
//       print('Failed to load questions');
//     }
//     }catch(e){
//       print('Failed to load questions');
//       print(e);
      
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Questions')),
//       body: _questions.isNotEmpty
//           ? ListView.builder(
//               itemCount: _questions.length,
//               itemBuilder: (context, index) {
//                 final question = _questions[index];
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         question.text,
//                         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     for (var choice in question.choices)
//                       RadioListTile(
//                         title: Text(choice.label),
//                         value: choice.value,
//                         groupValue: '',
//                         onChanged: (value) {},
//                       ),
//                   ],
//                 );
//               },
//             )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }








import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SymptomCheckerPage extends StatefulWidget {
  const SymptomCheckerPage({super.key});

  @override
  _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  List<dynamic> _symptoms = [];

  @override
  void initState() {
    super.initState();
    _getSymptoms();
  }

  Future<void> _getSymptoms() async {
    final response = await http.get(
      Uri.parse('https://api.infermedica.com/v3/symptoms'),
      headers: {
        'App-Id': '94e30f49',
        'App-Key': '7fbb334b201c64879eb88f639de3be5f',
      },
    );
    final json = jsonDecode(response.body);
    setState(() {
      _symptoms = json['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Checker'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _symptoms.length,
          itemBuilder: (context, index) {
            final symptom = _symptoms[index];
            return ListTile(
              title: Text(symptom['name']),
            );
          },
        ),
      ),
    );
  }
}
