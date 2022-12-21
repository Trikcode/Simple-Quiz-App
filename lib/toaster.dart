import 'package:flutter/material.dart';  
import 'package:fluttertoast/fluttertoast.dart';  
  
class ToastDisplay extends StatefulWidget {  
  @override  
  _ToastDisplayState createState() {  
    return _ToastDisplayState();  
  }  
} 

class _ToastDisplayState extends State<ToastDisplay> {  
		@override  
		Widget build(BuildContext context) {  
				return Scaffold(  
						appBar: AppBar(  
								title: Text('Toast Display'),  
						),  
						body: Center(  
								child: RaisedButton(  
										child: Text('Show Toast'),  
										onPressed: () {  
												Fluttertoast.showToast(  
																msg: "You can attempt quiz now !",  
																toastLength: Toast.LENGTH_SHORT,  
																gravity: ToastGravity.BOTTOM,  
																timeInSecForIosWeb: 1,  
																backgroundColor: Colors.red,  
																textColor: Colors.white,  
																fontSize: 16.0  
												);  
										},  
								),  
						),  
				);  
		}  
}

