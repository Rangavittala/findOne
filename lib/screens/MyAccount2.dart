import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musopathy/models/data.dart';
import 'package:musopathy/screens/Landingpage.dart';
import 'package:musopathy/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class MyAccount2 extends StatefulWidget {
  @override
  _MyAccount2State createState() => _MyAccount2State();
}

class _MyAccount2State extends State<MyAccount2> {
  final GlobalKey<ScaffoldState> key3 = GlobalKey<ScaffoldState>();
  bool _isEditingdob = false;
  TextEditingController _dobController;

  bool _isEditingphn = false;
  TextEditingController _phnController;

  bool _isEditingcountry = false;
  TextEditingController _countryController;

  int radioValue = 0;
  String dob = "";
  String gender = "male";
  String phn = "";
  String country = "";
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          gender = "male";
          break;
        case 1:
          gender = "female";
          break;
        case 2:
          gender = "others";
          break;
        default:
          print("Nothing selected!");
      }

//      print("Value is ${radioValue.toString()}");
    });
  }

  @override
  void initState() {
    super.initState();

    // dob = Provider.of<Data>(context, listen: false).dob;
    // country = Provider.of<Data>(context, listen: false).country;
    // phn = Provider.of<Data>(context, listen: false).phn;

    _dobController = TextEditingController(text: dob);

    _phnController = TextEditingController(text: phn);
    _countryController = TextEditingController(text: country);
  }

  Widget _editdobTextField() {
    if (_isEditingdob)
      return Center(
        child: TextField(
          onChanged: (newValue) {
            dob = newValue;
          },
          autofocus: true,
          controller: _dobController,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingdob = true;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            // color: Colors.blue.shade50,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                //Provider.ofdsfs
                Provider.of<Data>(context, listen: false).dob ?? dob,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
              ),
            )),
      ),
    );
  }

  Widget _editphnTextField() {
    if (_isEditingphn)
      return Center(
        child: TextField(
          onChanged: (newValue) {
            phn = newValue;
          },
          autofocus: true,
          controller: _phnController,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingphn = true;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            // color: Colors.blue.shade50,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                //Provider.ofdsfs
                Provider.of<Data>(context, listen: false).phn ?? phn,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
              ),
            )),
      ),
    );
  }

  Widget _editcountryTextField() {
    if (_isEditingcountry)
      return Center(
        child: TextField(
          onChanged: (newValue) {
            // setState(() {
            //   country = newValue;
            //   _isEditingcountry = false;
            // });
            country = newValue;
            print(country);
          },
          autofocus: true,
          controller: _countryController,
        ),
      );

    return InkWell(
      onTap: () {
        setState(() {
          _isEditingcountry = true;
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            // color: Colors.blue.shade50,

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                //Provider.ofdsfs
                Provider.of<Data>(context, listen: false).country ?? country,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        key: key3,
        appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
        backgroundColor: Colors.white,
        title: Text(
          'My Account',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            color: Color.fromRGBO(40, 115, 161, 1.0),
            fontWeight: FontWeight.normal,
          ),
        ),
        elevation: 4,
      ),
        drawer: CustomDrawer(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowText("Name"),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 1,
                                    // color: Colors.blue.shade50,

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 8.0),
                                      child: Text(
                                        Provider.of<Data>(
                                              context,
                                            ).userName ??
                                            "",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowText("email"),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 1,
                                    // color: Colors.blue.shade50,

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 8.0),
                                      child: Text(
                                        Provider.of<Data>(
                                              context,
                                            ).email ??
                                            "",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShowText("gender"),
                                Provider.of<Data>(context, listen: false)
                                            .gender ==
                                        null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          //radiobuttons go here
                                          Radio<int>(
                                              activeColor: Colors.blue,
                                              value: 0,
                                              groupValue: radioValue,
                                              onChanged:
                                                  handleRadioValueChanged),
                                          new Text(
                                            "Male",
                                            style: new TextStyle(),
                                          ),
                                          new Radio<int>(
                                              activeColor: Colors.blue,
                                              value: 1,
                                              groupValue: radioValue,
                                              onChanged:
                                                  handleRadioValueChanged),
                                          new Text(
                                            "Female",
                                            style: new TextStyle(),
                                          ),
                                          new Radio<int>(
                                              activeColor: Colors.blue,
                                              value: 2,
                                              groupValue: radioValue,
                                              onChanged:
                                                  handleRadioValueChanged),
                                          Text(
                                            "Other",
                                            style: new TextStyle(),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 1,
                                            // color: Colors.blue.shade50,

                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 8.0),
                                              child: Text(
                                                //Provider.ofdsfs
                                                Provider.of<Data>(
                                                      context,
                                                    ).gender ??
                                                    "",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18),
                                              ),
                                            )),
                                      ),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowText("Date Of Birth(DD/MM/YYYY)"),
                              _editdobTextField()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowText("PhoneNo"),
                              _editphnTextField()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowText("country"),
                              _editcountryTextField()
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.15,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            child: ElevatedButton(
                              onPressed: () async {
                                Provider.of<Data>(context, listen: false)
                                    .updateUserDetails(
                                        gender, dob, country, phn);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LandingPage()),
                                );
                              },
                              child: Text(
                                "Save",
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: Color.fromRGBO(40, 115, 161, 1.0),
                                  onPrimary: Colors.white),
                            ),
                          ),
                        ])))));
  }
}

class ShowText extends StatelessWidget {
  final String text;

  const ShowText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          text,
          style: TextStyle(
              color: Color.fromRGBO(40, 115, 161, 1.0),
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ));
  }
}
