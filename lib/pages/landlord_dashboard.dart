import 'package:flutter/material.dart';
import 'package:intellifarm/models/farmer.dart';
import '../models/crop.dart';
import '../models/land.dart';

class LandlordDashboard extends StatefulWidget {
  List<Land> landsList;

  LandlordDashboard({super.key, required this.landsList});

  @override
  State<LandlordDashboard> createState() => _LandlordDashboardState();
}

class _LandlordDashboardState extends State<LandlordDashboard> {
  final List<Farmer> _farmersList = [];
  final List<Crop> _cropsList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 5.0,
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xff00c39c),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/83652548?v=4"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount: widget.landsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            child: Text(
                              widget.landsList[index].surveyNo!,
                              style: dr,
                            ),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Farmers:",
                      style: dr,
                    ),
                    FloatingActionButton.small(
                      heroTag: "btn1",
                      onPressed: () {
                        _showFarmerInputDialog(context);
                      },
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xff00c39c),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    itemCount: _farmersList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text((index+1).toString()),
                        title: Text("${_farmersList[index].name!}---${_farmersList[index].phone!}"),
                        subtitle: Text(_farmersList[index].cnic!),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Crops:",
                      style: dr,
                    ),
                    FloatingActionButton.small(
                      heroTag: "btn2",
                      onPressed: () {
                        _showCropInputDialog(context);
                      },
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xff00c39c),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    itemCount: _cropsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text((index+1).toString()),
                        title: Text("${_cropsList[index].name!} --- ${_cropsList[index].price!} PKR"),
                        subtitle: Text("${_cropsList[index].plantingDate!} - ${_cropsList[index].harvestingDate!}"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Future<void> _showFarmerInputDialog(BuildContext context) async {
    String field1Value = '';
    String field2Value = '';
    String field3Value = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Farmer Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  field1Value = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CNIC'),
                onChanged: (value) {
                  field2Value = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (value) {
                  field3Value = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle the input values here, e.g., save to variables or perform some action.
                // print('Name: $field1Value');
                // print('CNIC: $field2Value');
                // print('Phone: $field3Value');
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    setState(() {
      _farmersList.add(
        Farmer(
          name: field1Value,
          cnic: field2Value,
          phone: field3Value,
        ),
      );
    });
  }
  Future<void> _showCropInputDialog(BuildContext context) async {
    String field1Value = '';
    String field2Value = '';
    DateTime field3Value = DateTime.now();
    DateTime field4Value = DateTime.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Crop Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  field1Value = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                onChanged: (value) {
                  field2Value = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Plantation Date'),
                // onChanged: (value) {
                //   field3Value = value;
                // },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harvesting Date'),
                // onChanged: (value) {
                //   field4Value = value;
                // },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle the input values here, e.g., save to variables or perform some action.
                // print('Name: $field1Value');
                // print('Price: $field2Value');
                // print('Plantation Date: $field3Value');
                // print('Harvesting Date: $field4Value');
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    setState(() {
      _cropsList.add(
        Crop(
          name: field1Value,
          price: field2Value,
          plantingDate: field3Value,
          harvestingDate: field4Value,
        ),
      );
    });
  }
}

const TextStyle dr = TextStyle(
  fontSize: 25,
  color: Color(0xff00c39c),
  fontWeight: FontWeight.w500,
);
