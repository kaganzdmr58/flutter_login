import 'package:flutter/material.dart';
import 'package:login_register/Constants.dart';
import 'package:login_register/viewmodels/WelcomeViewModel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false, //
      body: Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  WelcomeViewModel _viewModel = WelcomeViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
        //padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
            //scale: 0.5,
          ),
          color: Color.fromRGBO(255, 255, 255, 0.2),
        ),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 25),
            //const SizedBox(height: 60,),
            Padding(padding: const EdgeInsets.only(top: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 280.0,
                    child:  Image.asset("images/logo.png"),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(Constants.WELCOME
                      ,style: TextStyle(color: Colors.black,fontSize: 50,
                        fontFamily: 'BrandonText',),
                    ),
                  ),

                ],
              ),
            ),
            //const SizedBox(height: 100,),
            const Spacer(flex: 75),

            Container(
              height: MediaQuery.of(context).size.height * 2/7,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                  ),
              ),
              child: Column(
                children: [

                  const Spacer(flex: 40),

                  GestureDetector(
                      onTap: (){
                        _viewModel.showToast(context, Constants.NOT_INTEGRTED);
                      },
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        direction: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 35.0,
                            height: 35.0,
                            child: Image.asset("images/facebook.png"),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          SizedBox(
                            width: 32.0,
                            height: 32.0,
                            child: Image.asset("images/google.png"),
                          ),
                          const SizedBox(
                            width: 40.0,
                          ),
                          SizedBox(
                            width: 35.0,
                            height: 35.0,
                            child: Image.asset("images/twitter.png"),
                          ),
                        ],

                      )

                  ),
                  const Spacer(flex: 20,),
                  const Text(Constants.CHOSE_INPUT_METHOD,
                    style: TextStyle(color: Colors.grey
                        , fontWeight: FontWeight.bold,fontSize: 16
                        , fontFamily: 'BrandonText',),
                  ),
                  const Spacer(flex: 20,),
                  Flex(direction: Axis.horizontal,
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          _viewModel.gotoRegister(context);
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width* 2/5,
                          //margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red.shade700,
                          ),
                          child: const Center(
                            child: Text(Constants.SING_UP,style:
                                TextStyle(color: Colors.white,fontWeight:FontWeight.bold,
                                  fontFamily: 'BrandonButton',),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          _viewModel.gotoLogin(context);
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width* 2/5,
                          //margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red.shade700,
                          ),
                          child: const Center(
                            child: Text(Constants.LOGIN,style:
                            TextStyle(color: Colors.white,fontWeight:FontWeight.bold,
                              fontFamily: 'BrandonButton',),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(flex: 20,),
              ],
            ),

          ),

        ],
      ),
    ));
  }
}



