import 'package:d_session/d_session.dart';
import 'package:finalproject_mototbike/models/bike.dart';
import 'package:finalproject_mototbike/pages/booking_page.dart';
import 'package:finalproject_mototbike/pages/chaating_page.dart';
import 'package:finalproject_mototbike/pages/checkout_page.dart';
import 'package:finalproject_mototbike/pages/detail_page.dart';
import 'package:finalproject_mototbike/pages/discover_page.dart';
import 'package:finalproject_mototbike/pages/pin_page.dart';
import 'package:finalproject_mototbike/pages/singIn_page.dart';
import 'package:finalproject_mototbike/pages/singup_page.dart';
import 'package:finalproject_mototbike/pages/spalsh_screen.dart';
import 'package:finalproject_mototbike/pages/success_booking_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffEFEFF0),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FutureBuilder(
        future: DSession.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data == null) return const SpalshScreen();
          return const DiscoverPage();
        },
      ),
      routes: {
        '/discover': (context) => const DiscoverPage(),
        '/singup': (context) => const SingUpPage(),
        '/singin': (context) => const SinginPage(),
        '/detail': (context) {
          String bikeId = ModalRoute.of(context)!.settings.arguments as String;
          return DetailPage(bikeId: bikeId);
        },
        '/Booking': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return BookingPage(bike: bike);
        },
        '/checkout': (context) {
          Map data = ModalRoute.of(context)!.settings.arguments as Map;
          Bike bike = data['bike'];
          String startDate = data['startDate'];
          String endDate = data['endDate'];
          return CheckoutPage(
            bike: bike,
            startDate: startDate,
            endDate: endDate,
          );
        },
        '/pin': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return PinPage(bike: bike);
        },
        '/success-booking': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return SuccessBookingPage(bike: bike);
        },
        '/chatting': (context) {
          Map data = ModalRoute.of(context)!.settings.arguments as Map;

          String uid = data['uid'];
          String userName = data['userName'];
          return ChattingPage(uid: uid, userName: userName);
        },
      },
    );
  }
}
