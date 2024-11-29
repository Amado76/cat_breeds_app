import 'package:cat_breeds_app/core/injection_container.dart';
import 'package:cat_breeds_app/presentation/bloc/cat_breed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late CatBreedBloc _bloc;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _bloc = serviceLocator<CatBreedBloc>();
    _bloc.add(const FetchCatBreedData());
  }

  @override
  Widget build(BuildContext context) {
    final double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocListener<CatBreedBloc, CatBreedState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CatBreedAllData) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).secondaryHeaderColor,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: heightSize * 0.3),
              const Text(
                'Catbreeds',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const Expanded(child: SizedBox()),
              Image.asset('assets/images/splash_image.png'),
            ],
          ),
        ),
      ),
    );
  }
}
