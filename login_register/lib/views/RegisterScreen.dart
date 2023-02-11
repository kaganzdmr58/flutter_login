import 'package:flutter/material.dart';
import 'package:login_register/Constants.dart';
import 'package:login_register/viewmodels/RegisterViewModel.dart';
import 'package:login_register/views/LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterViewModel _viewModel = RegisterViewModel();
  var _name;
  var _email;
  var _password;
  var _repeatPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                  Text( Constants.REGISTER ,style: TextStyle(color: Colors.white,fontSize: 60),),
                ],
              ),
            ),

            const Spacer(flex: 65),

            Container(
              height: MediaQuery.of(context).size.height* 5/8,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
              ),
              child: Column(
                children: [
                  const Spacer(),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 30,left: 30),
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
                                //print(value);
                                _name = value;
                              },
                              decoration: const InputDecoration(
                                hintText: Constants.NAME,
                                hintStyle: TextStyle( color: Colors.grey),
                                border:InputBorder.none,
                              ),
                            ),
                          ),
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
                                hintStyle: TextStyle( color: Colors.grey),
                                border:InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                )
                            ),
                            child: TextField(
                              onChanged: (value){
                                _password = value;
                              },
                              decoration: const InputDecoration(
                                hintText: Constants.PASSWORD_,
                                hintStyle: TextStyle( color: Colors.grey),
                                border:InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                )
                            ),
                            child: TextField(
                              onChanged: (value){
                                _repeatPassword = value;
                              },
                              decoration: const InputDecoration(
                                hintText: Constants.REPEAD_PASSWORD_,
                                hintStyle: TextStyle( color: Colors.grey),
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
                      _viewModel.saveUser(context, _name, _email, _password, _repeatPassword);
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.shade700,
                      ),
                      child: const Center(
                        child: Text(Constants.CREATE ,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                      ),
                    ),
                  ),
                  const Spacer(),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()) );
                     },
                       child: Text(Constants.I_HAVE_ALREADY,style: TextStyle(color: Colors.red,fontSize: 16),)
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

