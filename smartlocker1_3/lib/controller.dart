//Flutter plugin to implement Material Design.
import 'package:flutter/material.dart';
//This package contains a set of high-level functions and classes that make it easy to consume HTTP resources.
import 'package:http/http.dart' as http;

bool isLEDon = false; // Initialize the LED state

Future<void> toggleLED() async {
  final newState = !isLEDon; // Calculate the new state

  final url = Uri.parse(
    //Blynk api call
      'https://blynk.cloud/external/api/update?token=uaxr4a1XD2dABHkZPk2Ibrk0tStZcSIE&D2=${newState ? 1 : 0}');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Request was successful.
      isLEDon = newState; // Update the LED state
    } else {
      // Request failed.
      Text('Failed to update LED: ${response.reasonPhrase}');
    }
  } catch (e) {
    // Handle any exceptions that occurred during the request.
    Text('Error: $e');
  }
}

class LockState extends StatefulWidget {
  const LockState({super.key});

  @override
  State<LockState> createState() => _LockStateState();
}

class _LockStateState extends State<LockState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Lock'),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //after successful connection displays message
          const Center(child: Text('Successfully connected to the lock'),),
          Padding(padding: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
            onPressed:() {
              //button to update the state of lock
              toggleLED();
              setState(() {});
            },
            //text to be displayed on button depending on the state of lock
            child: Text(isLEDon ? 'Unlock' : 'Lock'),
          ),)
          ],
      )
    );
  }
}


