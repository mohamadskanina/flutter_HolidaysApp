import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/business_logic/country_cubit/country_cubit.dart';
import 'package:myapp/core/constant/colorapp.dart';
import '../widget/splashscreen/custombackground.dart';
import '../widget/splashscreen/custombody.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _initData() async {
    await BlocProvider.of<CountryCubit>(context)
        .getCountryCodeFromModelFromCubit();
  }

  @override
  void initState() {
    super.initState();
    _initData();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: _builBodySplashScreen(),
    );
  }

  _builBodySplashScreen() {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: const [
            CustomBackground(),
            CustomBodySplashScreen(),
          ],
        ),
      ),
    );
  }
}
