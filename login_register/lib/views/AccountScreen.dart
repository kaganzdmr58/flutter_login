import 'package:flutter/material.dart';
import 'package:login_register/Constants.dart';
import 'package:login_register/viewmodels/AccountViewModel.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        body : Account(),
    );
  }
}

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AccountViewModel _viewModel = AccountViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:   [
                  const Spacer(flex: 10,),
                  const Icon(Icons.task_alt,size: 100.0,color: Colors.green,),
                  const Text(Constants.LOGIN_IS_SUCCESFULL,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.green,
                      fontFamily: 'BrandonTitle',
                    ),
                  ),
                 /* const Spacer(),
                  QrImage(
                    data: email,
                    version: QrVersions.auto,
                    size: 150.0,
                  ),*/
                  const Spacer(flex: 80,),
                  SizedBox(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: Colors.red.shade900,
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      onPressed: (){
                        _viewModel.logOut(context);
                      },
                      child: const Text(Constants.LOG_OUT,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'BrandonButton',
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 5,),
                  SizedBox(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: Colors.red.shade900,
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      onPressed: (){
                        _viewModel.removeUser(context);
                      },
                      child: const Text(Constants.REMOVE_USER,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'BrandonButton',
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 5,),
                ],
            ),
        ),
      ),
    );
  }
}

