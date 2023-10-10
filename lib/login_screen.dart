
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  LoginScreenState createState() => LoginScreenState();

}

  class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFormVisible = false;

    void _toggleForm() {
      setState(() {
        isFormVisible = !isFormVisible;
      });
    }

   return Scaffold(
     // appBar: AppBar(
     //   automaticallyImplyLeading: false,
     //   backgroundColor: Colors.transparent.withOpacity(0),
     //   elevation: 0,
     // ),
     body: Container(
       padding: const EdgeInsets.all(8),
       decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/images/loginLady.png'),
           fit: BoxFit.cover,
         ),
       ),
       child: Column(
         children: [
           SizedBox(
             height: 14,
           ),
           Row(
             children: [
               IconButton(onPressed: (){
                 Navigator.of(context).pop();
               }, icon: Icon(Icons.arrow_back_sharp),color: Colors.white,iconSize: 35),
               SizedBox(width: 20,),
               Text('Welcome',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28),)
             ],
           )
         ],
       ),
     ),
   );

  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      _openBottomSheet();
    });
  }
  void _openBottomSheet() {
    showModalBottomSheet(

      context: context,
      builder: (BuildContext context) {
        return  Scaffold(
          appBar: AppBar(
            title: Text('Animated Form Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // _toggleForm();
                  },
                  child: Text('Toggle Form'),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500), // Adjust animation duration
                  height: 250, // Set height based on visibility
                  curve: Curves.easeInOut, // Add animation curve
                  child:  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.blue,
                    child: Form(
                      // Your form widgets go here
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add form submission logic
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  )

                ),
              ],
            ),
          ),
        );
      },
    );
  }
  }


