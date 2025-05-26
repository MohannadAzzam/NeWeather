import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/extension.dart';
import '../themes/dark_light_theme_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: BlocBuilder<DarkLightThemeCubit, ThemeMode>(
        builder: (context, newMode) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SwitchListTile(
                  title: Text(
                    'Dark Theme',
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  value: context.isDarkMode,
                  onChanged: (val) {
                    setState(() {
                      if (context.isDarkMode) {
                        isDark = false;
                        context.read<DarkLightThemeCubit>().updateTheme(
                          ThemeMode.light,
                        );
                      } else {
                        isDark = true;
                        context.read<DarkLightThemeCubit>().updateTheme(
                          ThemeMode.dark,
                        );
                      }
                    });
                  },
                ),
                Positioned(
                  bottom: 20,
                  right: 5.w,
                  left: 5.w,
                  child: Center(child: Text("Developed By : Mohannad Azzam")),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
