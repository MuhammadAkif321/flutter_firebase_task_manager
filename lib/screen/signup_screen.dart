import 'package:firebase_demo/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var nameC = TextEditingController();
  var phoneC = TextEditingController();
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var confirmPasswordC = TextEditingController();

  var _obscurePassword  = true;

  String? selectedGender = 'Male'; // 'Male, 'Female', 'Other'
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Sign Up Screen"),
      ),body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextField(
            controller: nameC,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),),

          SizedBox(height: 25,),

          Text('Gender'),
          RadioGroup<String>(
            groupValue: selectedGender,
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue;
              });
            },
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(value: 'Male'),
                    Text('Male'),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 'Female'),
                    Text('Female'),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 'Other'),
                    Text('Other'),
                  ],
                ),
              ],
            ),
          ),

          TextField(
            controller: phoneC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Phone",
            ),),

          SizedBox(height: 25,),

          TextField(
            controller: emailC,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),),

          SizedBox(height: 25,),

          TextField(
            maxLength: 8,
            controller: passwordC,
            keyboardType: TextInputType.text,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });

                }, icon: Icon(_obscurePassword? Icons.visibility : Icons.visibility_off))
            ),),

          SizedBox(height: 25,),

          TextField(
            controller: confirmPasswordC,
            keyboardType: TextInputType.text,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Confirm Password",
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  _obscurePassword =! _obscurePassword;
                });

              }, icon: Icon(_obscurePassword? Icons.visibility: Icons.visibility_off) )
            ),),

          SizedBox(height: 25,),

          ElevatedButton(onPressed: (){
            String name = nameC.text.trim();
            String phone = phoneC.text.trim();
            String email = emailC.text.trim();
            String password = passwordC.text.trim();
            String confirmPassword = confirmPasswordC.text.trim();

            if(name.isEmpty){
              Fluttertoast.showToast(msg: "please provide name");
              return;
            }

            if(phone.isEmpty){
              Fluttertoast.showToast(msg: "please provide phone");
              return;
            }

            if(email.isEmpty){
              Fluttertoast.showToast(msg: "please provide email");
              return;
            }

            if(password.isEmpty){
              Fluttertoast.showToast(msg: "please provide password");
              return;
            }

            if(confirmPassword.isEmpty){
              Fluttertoast.showToast(msg: "please provide confirm password");
              return;
            }

            if(password!=confirmPassword){
              Fluttertoast.showToast(msg: "confirm password are not matchable");
              return;
            }
            if(password.length< 8){
              Fluttertoast.showToast(msg: "Password length must be equal or greater than 8");
              return;

            }



            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return DashboardScreen();
            }));
          }, child: Text("REGISTER")),
        ],
      ),
    ),

    );
  }
}