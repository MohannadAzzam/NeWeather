
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/colors.dart';

class Weather extends StatelessWidget {
  const Weather({
    super.key,
    required this.name,
    required this.code,
    required this.temp,
    required this.icon,
    required this.main,
    required this.minTemp,
    required this.maxTemp,
  });
  final String name;
  final String code;
  final double temp;
  final String icon;
  final String main;
  final double minTemp;
  final double maxTemp;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
              name,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              code,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              "Now",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "${temp.toInt()}°C",
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.darkSchemePrimaryColor,
                ),
              ),
            ),
            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
            Text(
              main,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${minTemp.floor()}°C / ${maxTemp.ceil()}°C',
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      color: ColorsManager.lightSchemeSecondaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
