import 'package:flutter/material.dart';
import 'package:flutter_app_3/theme/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      width: 363,
      decoration: BoxDecoration(
          color: Color(0xff0E2392), 
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                // color: kWhiteColor,
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  kWhiteColor
                ),
              ),
            ),
            Text(
              'Loading',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
