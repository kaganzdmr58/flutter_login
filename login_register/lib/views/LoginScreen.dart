import 'package:flutter/material.dart';
import 'package:login_register/viewmodels/LoginViewModel.dart';
import '../Constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false, //
      body: LoginScr()
    );
  }
}

class LoginScr extends StatefulWidget {
  const LoginScr({Key? key}) : super(key: key);


  @override
  State<LoginScr> createState() => _LoginScrState();
}

class _LoginScrState extends State<LoginScr> {

  final LoginViewModel _viewModel = LoginViewModel();
  late String _password;
  late String _email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 238, 0, 0),
                Color.fromARGB(255, 16, 60, 178),
                Color.fromARGB(255, 13, 45, 173),
              ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 35),
            Padding(padding: const EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(Constants.LOGIN
                    ,style: TextStyle(color: Colors.white,fontSize: 80,
                    fontFamily: 'BrandonTitle'),
                  ),
                  SizedBox(height: 10,),
                  Text(Constants.WELCOME_BACK
                    ,style: TextStyle(color: Colors.white,fontSize: 18,
                    fontFamily: 'BrandonTitle',),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 65),

            Container(
              height: MediaQuery.of(context).size.height* 5/11,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)
                      ,topRight: Radius.circular(60),),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30,left: 30),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [ BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset:Offset(0,10)
                          ),
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                )
                            ),
                            child: TextField(
                              onChanged: (value){
                                _email = value;
                              },
                              decoration: const InputDecoration(
                                hintText: Constants.E_MAIL,
                                hintStyle: TextStyle( color: Colors.grey,
                                  fontFamily: 'BrandonText',),
                                border:InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200),
                                )
                            ),
                            child: TextField(
                              onChanged: (value){
                                _password = value;
                              },
                              decoration: const InputDecoration(
                                hintText: Constants.PASSWORD_,
                                hintStyle: TextStyle( color: Colors.grey,
                                  fontFamily: 'BrandonText',),
                                border:InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),

                  GestureDetector(
                    onTap: (){
                      _viewModel.login(context, _email, _password);
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.shade700,
                      ),
                      child: const Center(
                        child: Text(Constants.LOGIN,style:
                          TextStyle(color: Colors.white,fontWeight:FontWeight.bold,
                            fontFamily: 'BrandonButton',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      _viewModel.showToast(context, Constants.NOT_INTEGRTED);
                    },
                    child: const Text(Constants.FORGOT_PASSWORD,style:
                      TextStyle(color: Colors.grey,
                        fontFamily: 'BrandonText',
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

