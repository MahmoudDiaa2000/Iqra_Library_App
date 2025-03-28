import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(AssetsData.logo,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,),


          ],

        ),
        Text('IQRA'
          , style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 75

          ),),

        Text('The more you read'
            '\nThe more you grow'
          , style: TextStyle(fontWeight: FontWeight.w500,
              fontSize: 25

          ),)

      ],

    );
  }
}
