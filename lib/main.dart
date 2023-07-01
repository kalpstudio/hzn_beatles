import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_beatles/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TheBeatlesHome(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//    const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   late AnimationController animationController;
//   var random = Random();

//   @override
//   void initState() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..addStatusListener((AnimationStatus status) {
//         if (status == AnimationStatus.completed) {
//           if (!mounted) return;
//           animationController.reverse();
//         }
//       });
//     super.initState();
//   }

//   void setAnimation() {
//     animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Timer.periodic(const Duration(seconds: 1), (Timer t) => setAnimation());

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 4,
//               color: const Color.fromARGB(255, 0, 0, 0),
//             ),
//             ...makeStar(MediaQuery.of(context).size.width,
//                 MediaQuery.of(context).size.height * 4),
//             CustomPaint(
//               size: Size(
//                   MediaQuery.of(context).size.width,
//                   (MediaQuery.of(context).size.width * 2.02)
//                       .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//               painter: RPSCustomPainter(),
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 280.0),
//                 child: MoonlightImage(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   List<Widget> makeStar(double width, double height) {
//     double starsInRow = width / 50;
//     double starsInColumn = height / 50;
//     double starsNum = starsInRow != 0
//         ? starsInRow * (starsInColumn != 0 ? starsInColumn : starsInRow)
//         : starsInColumn;

//     List<Widget> stars = [];

//     for (int i = 0; i < starsNum; i++) {
//       stars.add(Star(
//         top: random.nextInt(height.floor()).toDouble(),
//         right: random.nextInt(width.floor()).toDouble(),
//         animationController: animationController,
//       ));
//     }

//     return stars;
//   }
// }

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(252, 252, 201, 113)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8.81;

//     Path path0 = Path();
//     path0.moveTo(size.width * 0.1160800, size.height * 0.8822772);
//     path0.cubicTo(
//         size.width * 0.0796200,
//         size.height * 0.8750000,
//         size.width * 0.0987400,
//         size.height * 0.3087426,
//         size.width * 0.0991800,
//         size.height * 0.1489010);
//     path0.cubicTo(
//         size.width * 0.1010800,
//         size.height * 0.1013267,
//         size.width * 0.4123200,
//         size.height * 0.0779505,
//         size.width * 0.4980000,
//         size.height * 0.0475248);
//     path0.cubicTo(
//         size.width * 0.5845800,
//         size.height * 0.0779604,
//         size.width * 0.8973200,
//         size.height * 0.0976238,
//         size.width * 0.8995200,
//         size.height * 0.1465347);
//     path0.cubicTo(
//         size.width * 0.9000800,
//         size.height * 0.3448713,
//         size.width * 0.8816800,
//         size.height * 0.9136337,
//         size.width * 0.8804400,
//         size.height * 0.9317624);
//     path0.cubicTo(
//         size.width * 0.8789600,
//         size.height * 1.0656931,
//         size.width * 0.1233600,
//         size.height * 0.9393168,
//         size.width * 0.1160800,
//         size.height * 0.8822772);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// //'https://www.pngmart.com/files/22/Borat-PNG.png'

// class MoonlightImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200, // Adjust the size as per your requirements
//       height: 200,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Image.network(
//             'https://www.pngmart.com/files/22/Borat-PNG.png', // Replace with your circular image path
//             fit: BoxFit.cover,
//           ),
//           ShaderMask(
//             shaderCallback: (bounds) {
//               return RadialGradient(
//                 center: Alignment.center,
//                 radius: 0.85,
//                 colors: [
//                   Colors.transparent,
//                   Colors.white.withOpacity(0.4),
//                 ],
//                 stops: [0.9, 1.0],
//               ).createShader(bounds);
//             },
//             blendMode:
//                 BlendMode.screen, // Use screen blend mode for black background
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: Colors.transparent, // Set border color to transparent
//                   width: 6,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
