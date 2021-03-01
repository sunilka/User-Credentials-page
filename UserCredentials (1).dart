import 'package:flutter/material.dart';
import 'UserCredentials_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String name, email, phone, _currentSelectedItem;
  List<String> _locations = [
    'Office 1',
    'Office 2',
    'Office 3',
    'Office 4',
    'Office 5',
  ];
  String _dropdownError;

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  _validateForm() {
    bool _isValid = _formkey.currentState.validate();
    if (_currentSelectedItem == null) {
      setState(() => _dropdownError = '');
      _isValid = false;
    }

    if (_isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        blurRadius: 6.0,
                        offset: Offset(4.0, 4.0),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF1264D1),
                    radius: 60,
                    child: Image.asset(
                      'assets/images/details.png',
                      height: 70,
                      width: 70,
                      fit: BoxFit.scaleDown,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Tell us a little about yourself!',
                  style: TextStyle(
                    color: Color.fromRGBO(42, 45, 54, 1.0),
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.person_rounded, 'Name'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your name!';
                      } else if (value.length < 3) {
                        return 'Name must be more than 2 characters!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.email_rounded, 'Email'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter you email id!';
                      }
                      if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                          .hasMatch(value)) {
                        return 'Please enter a valid email id!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      email = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.work_rounded, 'Designation'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your designation!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 328,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F0),
                        border: Border.all(
                          width: 1.5,
                          color: Color(0xFFF2F2F0),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor: Color(0xFFF2F2F0),
                            buttonTheme: ButtonTheme.of(context).copyWith(
                              alignedDropdown: true,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            items: _locations.map(
                              (val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Align(
                                    alignment: Alignment(-0.8, -0.1),
                                    child: Text(
                                      val,
                                      style: TextStyle(
                                        color: Color.fromRGBO(42, 45, 54, 1.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            hint: Align(
                              alignment: Alignment(-0.78, -0.25),
                              child: Text(
                                'Location',
                              ),
                            ),
                            value: _currentSelectedItem,
                            onChanged: (value) {
                              setState(() {
                                _currentSelectedItem = value;
                                _dropdownError = null;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    _dropdownError == null
                        ? SizedBox.shrink()
                        : Text(
                            _dropdownError,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.only(top: 14.0, left: 11.0),
                      child: Icon(
                        Icons.location_on_rounded,
                        color: Color.fromRGBO(42, 45, 54, 1.0),
                        size: 26.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 348,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        buildInputDecoration(Icons.phone_rounded, 'Contact'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your contact!';
                      } else if (value.length != 10) {
                        return 'Contact must be of 10 digits!';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      phone = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 6.0,
                          offset: Offset(4.0, 4.0),
                        ),
                      ],
                    ),
                    child: RaisedButton(
                      splashColor: Colors.white,
                      color: Color(0xFF1264D1),
                      onPressed: () {
                        _validateForm();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      textColor: Colors.white,
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
