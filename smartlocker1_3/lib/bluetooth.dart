//This file is used to scan and connect to nearby bluetooth devices.

//flutter plugin to implement Material Design
import 'package:flutter/material.dart';
//flutter plugin for using bluetooth
import 'package:flutter_blue/flutter_blue.dart';
//importing file to control lock state
import 'controller.dart';

class BluetoothDeviceListScreen extends StatefulWidget {
  const BluetoothDeviceListScreen({super.key});

  @override
  _BluetoothDeviceListScreenState createState() => _BluetoothDeviceListScreenState();
}
//class for listing,connecting and refreshing existing list of near by bluetooth device
class _BluetoothDeviceListScreenState extends State<BluetoothDeviceListScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;//creating an instance for flutterblue package
  List<BluetoothDevice> devicesList = [];//creating an empty list to store name of near by bluetooth devices

  @override
  void initState() {
    super.initState();
    //calling function for scanning nearby bluetooth devices
    _startScanning();
  }
//identify near by devices and add them to a list
  void _startScanning() {
    flutterBlue.scanResults.listen((List<ScanResult> scanResults) {
      for (ScanResult result in scanResults) {
        if (!devicesList.contains(result.device) && result.device.name != null) {
          //checking if the found device already exist on the list and the
          // found device has a name. Only a new device with a name can be
          // added to the list
          setState(() {
            devicesList.add(result.device);
          });
        }
      }
    });

    flutterBlue.startScan();
  }

//connecting to device
  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect(autoConnect: false);
      //creating a dialogue box for showing successful connection
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Connection Successful'),
            content: Text('Connected to ${device.name ?? "Unnamed Device"}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => const LockState(),),);// Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    //dialogue box for showing connection failure
    catch (e) {
      print('Error connecting to device: $e');
    }
  }

  void _refreshDeviceList() {
    // Clear the existing device list and trigger a new scan
    setState(() {
      devicesList.clear();
    });
    _startScanning();
  }


  @override
  void dispose() {
    flutterBlue.stopScan();//to stop scanning device
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Devices'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshDeviceList,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: devicesList.length,//count number of devices displayed
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devicesList[index].name),//title of device
            subtitle: Text(devicesList[index].id.toString()),//id of device
            onTap: () {
              _connectToDevice(devicesList[index]);//for connecting selected device
            },
          );
        },
      ),
    );
  }
}
