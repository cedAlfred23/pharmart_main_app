// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Symptoma extends StatefulWidget {
  const Symptoma({super.key});

  @override
  State<Symptoma> createState() => _SymptomaState();
}

class _SymptomaState extends State<Symptoma> {

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [

          WebView(
            onPageStarted: (url) {
              showDialog(context: context, 
            builder: (context){
              return Dialog(
              child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a survey to get your diagnosis!')),
              );
            });
            },
            onWebResourceError: (error) {
              Navigator.pop(context);
              showDialog(context: context, 
            builder: (context){
              return const Dialog(
              insetPadding: EdgeInsets.all(12),
              child: Text('Failed'),
              );
            });
            },
              initialUrl: "https://www.buoyhealth.com/symptom-checker/",
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
          // Prevent any navigation requests to external URLs
          if (!request.url.startsWith("https://www.buoyhealth.com/symptom-checker/")) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
          ),
          Container(
            color: Colors.blue,
            height: 60,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('', style: TextStyle(color: Colors.white, fontSize: 30),),
            ),
          )
        ],
      ),


    );
  }
}