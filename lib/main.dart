import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final bool keyboardAppeared =
        MediaQuery.of(context).viewInsets.bottom == 0 ? false : true;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(255, 140, 50, 1),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black
              // image: DecorationImage(
              //     image: AssetImage("images/background_C.png"),
              //     fit: BoxFit.cover)
          ),
          child: Stack(
            children: [
              Positioned(
                top: keyboardAppeared == false ? 197 : 96,
                left: 32,
                child: AnimatedCrossFade(firstChild: Text(
                    "Enjoy the app",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white)
                ), secondChild: const Text(
                  "Type the info!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),crossFadeState: keyboardAppeared == true ? CrossFadeState.showSecond : CrossFadeState.showFirst , duration: const Duration(seconds: 1)),
              ),

              AnimatedPositioned(
                bottom: keyboardAppeared ? 0 :-258 ,
                  right: 0,
                  left: 0,
                  duration: const Duration(milliseconds: 500),
                  // height: 170,
                  child: Image.asset(
                "images/rectangle570.png",
                    scale: 0.5,
                )
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: (MediaQuery.of(context).size.width - 335) / 2,
                bottom: keyboardAppeared == false ? 102 : 360.5,
                child: Container(
                  width: 335,
                  height: 290,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          smartDashesType: SmartDashesType.disabled,
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: const TextStyle(color: Color.fromRGBO(170, 174, 179, 1)),

                            filled: true,
                            fillColor: const Color.fromRGBO(242, 243, 245, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                        child: TextFormField(
                          // key: UniqueKey(),
                          smartDashesType: SmartDashesType.disabled,
                          autocorrect: false,
                          enableSuggestions: false,
                          obscureText: _hidePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Color.fromRGBO(170, 174, 179, 1)),
                            suffixIcon:  IconButton(icon: _hidePassword == true ? const Icon(CupertinoIcons.eye_slash) : const Icon(CupertinoIcons.eye),onPressed: (){
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            }) ,
                            filled: true,
                            fillColor: const Color.fromRGBO(242, 243, 245, 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: const [
                          Spacer(),
                          Text("Lost your password?",style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline),),
                          SizedBox(width: 20,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(onPressed: (){},
                            child: const SizedBox(width:295,height:50, child: Center(child: Text("GO!"))),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                          )
                        ),
                      ),


                      // SizedBox(height: 32,)
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                  bottom: keyboardAppeared ? 302 : 54,
                  width: MediaQuery.of(context).size.width, duration: const Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(

                children: [
                    const Spacer(),
                    const Text("Still no account?"),
                    TextButton(onPressed: (){}, child: const Text("register now!",style: TextStyle(color: Color.fromRGBO(255, 140, 50, 1),decoration: TextDecoration.underline),)),
                    const Spacer()
                ],
              ),
                  )
              )

            ],
          ),
        )
        );
  }
}
