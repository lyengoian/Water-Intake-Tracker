import 'package:final_project/Profile.dart';
import 'package:flutter/material.dart';
import 'Page.dart';

class ProfileSetter extends StatelessWidget {
  const ProfileSetter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() {
    return HomeState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class HomeState extends State<Home> {
  Profile p = Profile(name: "", activity: "", weight: 0.0);
  String selectedActivity = "Low";
  void _setName(String? value) {
    setState(() {
      p.name = value!;
    });
  }
  void _setWeight(String? value) {
    setState(() {
      p.weight = double.parse(value!);
    });
  }
  double? getWeight() {
    return p.weight;
  }
  String? getActivity() {
    return p.activity;
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 300,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please provide your name.';
                }
                else{
                  _setName(value);
                }
                return null;
                },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your weight',
                labelText: 'Weight (lbs)',
              ),
              validator: (value) {
                if ((value != null && value.isEmpty) || double.tryParse(value!) == null) {
                  return 'Please enter valid weight.';
                }
                else{
                  _setWeight(value);
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                  labelText:'Activity Level'
              ),
              value: selectedActivity,
              hint: const Text(
                'Activity Level',
              ),
              onChanged: (activity) =>
                setState(() => selectedActivity = activity!
                ),
              validator: (value) => value == null ? 'field required' : null,
              items: ['Low', 'Medium', 'High'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
                padding: const EdgeInsets.only(
                    left: 120.0,
                    top: 40.0
                ),
                child: ElevatedButton(
                  child: const Text('Next'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecondPage(title: 'Water Tracker', name: p.name, weight: p.weight, activity: p.activity
                                ),
                          )
                      );
                    }
                    },
                )
            ),
          ],
        ),
      ),
    );
  }
}