import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:synd_innovate/dashboard_screen.dart';
import 'package:synd_innovate/sign_in.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  FocusNode _addressFocusNode = FocusNode();
  String newAddress;

  List _genders = ["Male", "Female"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentGender;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentGender = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String gender in _genders) {
      items.add(new DropdownMenuItem(value: gender, child: new Text(gender)));
    }
    return items;
  }

  void changedDropDownItem(String selectedGender) {
    setState(() {
      _currentGender = selectedGender;
    });
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      // setState(() {
      //   _autoValidate = true;
      // });
      _autoValidate = true;
    }
  }

  String validateAddress(String value) {
    if (value.length == 0)
      return 'Address cannot be empty';
    else
      return null;
  }

  void _add() {
    DocumentReference documentReferencer =
        documentReference.collection('user_data').document(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "image_url": imageUrl,
      "name": name,
      "leads": 0,
      "level": 0,
      "reward_points": 0,
      "gender": _currentGender,
      "address": newAddress,
    };

    documentReferencer.setData(data).whenComplete(() {
      print("document added");
    }).catchError((e) => print(e));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xffFFCD00),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          child: SafeArea(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 10,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      'User Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: <Widget>[
                        Text(
                          'Name: ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          'Gender: ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Expanded(
                          child: Center(
                            child: DropdownButton(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              value: _currentGender,
                              items: _dropDownMenuItems,
                              onChanged: changedDropDownItem,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Container(
                        constraints:
                            BoxConstraints.loose(Size.fromHeight(300.0)),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          focusNode: _addressFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'Enter address',
                              labelText: 'Address',
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              hoverColor: Colors.black),
                          validator: validateAddress,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          onSaved: (val) {
                            newAddress = val;
                            _addressFocusNode.unfocus();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: FlatButton(
                            color: Color(0xFFF6711D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                'SAVE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              _validateInputs();
                              _add();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DashboardScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
