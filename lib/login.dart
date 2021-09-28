import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  validator() {
    if (_formKey.currentState != null && _formKey.currentState.validate()) {
      print("validated");
    }else {
      print ("not validated");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text("SingIn Form" , style: TextStyle(color: Colors.black, fontSize: 30),),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Text (
            "Hi There! :)",
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
              //decoration: TextDecoration.underline,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage('assets/images/logo.jfif'),
                      fit: BoxFit.fitWidth,
                      colorFilter: ColorFilter.mode(Colors.black45,BlendMode.lighten))
              ),
              height: MediaQuery.of(context).size.height-100,
              alignment: Alignment.bottomLeft,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                      child: TextFormField(
                          decoration: InputDecoration(hintText: "Enter your Name",hintStyle: TextStyle (color: Colors.black),
                            focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: OutlineInputBorder(
                            ),
                            //labelText: "Enter your Name "
                          ),
                          validator: (val){
                            if (val== null ||  val.trim().length==0){
                              return "Field is required";
                            }
                            return null;
                          }
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                      child: TextFormField(
                          decoration: InputDecoration(hintText: "Enter your Email",hintStyle: TextStyle (color: Colors.black),
                            focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: OutlineInputBorder(
                            ),
                            //labelText: "Enter your Email "
                          ),
                          validator: (val){
                            if (val== null ||  val.trim().length==0){
                              return "Field is required";
                            }
                            if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)){
                              return "Please Enter valid email address";
                            }
                            return null;
                          }
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                      child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Enter your Password",hintStyle: TextStyle (color: Colors.black),
                            focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: OutlineInputBorder(
                            ),
                            //labelText: ("Enter your password ")
                          ),
                          style: TextStyle(color: Colors.red, fontSize: 16),
                          validator: (val){
                            if (val == null ||  val.trim().length==0){
                              return "Field is required";
                            }
                            if (val.length <=6){
                              return "Please should not be less than 6 characters";
                            }
                            return null;
                          }
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(onPressed: (){
                      validator();
                    },
                        child: Text(
                          ("SingIn"),
                          style: TextStyle(color: Colors.black),
                        )
                    ),
                    SizedBox(
                        height: 16
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text (
                          "Don't have a account!  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            decoration: TextDecoration.underline,

                          ),
                        ),
                        Text (
                          "Signup",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
