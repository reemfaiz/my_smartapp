// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_smartapp/Login.dart';
import 'package:my_smartapp/Video.dart';
import 'package:my_smartapp/analys.dart';
import 'package:my_smartapp/biganaly.dart';
import 'package:my_smartapp/done.dart';
import 'package:my_smartapp/healthanaly.dart';
import 'package:my_smartapp/injuries.dart';
import 'package:my_smartapp/langu.dart';
import 'package:my_smartapp/matchstats.dart';
import 'package:my_smartapp/newlogic.dart';
import 'package:my_smartapp/nopass.dart';
import 'package:my_smartapp/perform.dart';
import 'package:my_smartapp/profile.dart';
import 'package:my_smartapp/settings.dart';
import 'package:my_smartapp/surenew.dart';
import 'package:my_smartapp/surepass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: " /Login",
      routes: {
        '/': (context) => const Login(),
        '/Nopass': (context) => const Nopass(),
          '/Surepass': (context) => const Surepass(),
            '/DONE': (context) => const DONE(),
              '/Newlogic': (context) => const Newlogic(),
                '/Surenew': (context) => const Surenew(),
                
                  '/AnalysisScreen': (context) => const AnalysisScreen(),
                  
                    '/Settings': (context) => const Settings(),
                      '/Profile': (context) => const Profile(),
                        '/Langu': (context) => const Langu(),
                          '/Biganaly': (context) => const Biganaly(),

                            '/Injuries': (context) => const Injuries(),
                              '/Healthanaly': (context) => const Healthanaly(), 
                               '/Matchstats': (context) => const Matchstats(),
                                 '/Biganaly': (context) => const Biganaly(),


            
            
      },
    );
  }
}
