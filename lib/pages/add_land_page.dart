import 'package:flutter/material.dart';
import 'package:intellifarm/pages/landlord_dashboard.dart';
import '../models/land.dart';

class AddLand extends StatefulWidget {
  const AddLand({Key? key}) : super(key: key);

  @override
  State<AddLand> createState() => _AddLandState();
}

class _AddLandState extends State<AddLand> {
  final List<Land> _landsList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Add your Land'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text("Please Enter all your Lands below:"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7805,
                  child: ListView.builder(
                    itemCount: _landsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text((index + 1).toString()),
                        title: Text(_landsList[index].surveyNo!),
                        subtitle: Text(_landsList[index].area!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _landsList.remove(_landsList[index]);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: const Color(0xff00c39c),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00c39c),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandlordDashboard(landsList: _landsList),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Done',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff00c39c),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            _showInputDialog(context);
          },
        ),
      ),
    );
  }

  Future<void> _showInputDialog(BuildContext context) async {
    String field1Value = '';
    String field2Value = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Land Values'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Survey Number'),
                onChanged: (value) {
                  field1Value = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'area'),
                onChanged: (value) {
                  field2Value = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle the input values here, e.g., save to variables or perform some action.
                // print('Survey Number: $field1Value');
                // print('area: $field2Value');
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
    setState(() {
      _landsList.add(
        Land(
          surveyNo: field1Value,
          area: field2Value,
        ),
      );
    });
  }
}
