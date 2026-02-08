// import 'package:flutter/material.dart';
// import 'package:valentine/commons.dart';
// import 'dart:math';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   int index = 0;
//   bool show_intro = true;
//   bool show_options = true;
//   List questions = [
//     'So tell me… Animesh Pandey, will you be my Valentine?',
//     'Now that you\'ve said yes\nYou have to deal with my problems as well.\nAre you up for it?',
//     'Are you signing to bear my tantrums for the rest of your life?',
//     'Last question, are you signing up to see me age into a grumpy old lady?',
//     'I love you.',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink.shade300,
//       body: Stack(
//         children: [
//           SizedBox.expand(
//             child: Image.asset(
//               'assets/bg.jpeg', // your image path
//               fit: BoxFit.cover, // makes it cover the entire screen
//             ),
//           ),

//           // Dark overlay
//           Container(
//             color: const Color(0x7B000000), // adjust opacity (0.0 to 1.0)
//           ),
//           Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Txt('Hey Animesh ❤️', color: Colors.white, size: 50),
//                 if (show_intro)
//                   Txt(
//                     'Miles between us, screens between us, time zones sometimes against us.',
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 if (show_intro)
//                   Txt(
//                     'But still — every day somehow begins and ends with you.',
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 if (show_intro)
//                   Txt(
//                     'For a lifetime with you, where every day feels like Valentine\'s.',
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 if (show_intro) SizedBox(height: 15),
//                 Txt(questions[index], color: Colors.white, size: 20),
//                 SizedBox(height: 20),
//                 if (show_options)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             if (index == 0) {
//                               show_intro = false;
//                             }
//                             if (index == questions.length - 2) {
//                               show_options = false;
//                             }
//                             if (index < questions.length - 1) {
//                               index++;
//                             }
//                           });
//                         },
//                         child: Txt('Yes'),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             if (index == 0) {
//                               show_intro = false;
//                             }
//                             if (index == questions.length - 2) {
//                               show_options = false;
//                             }
//                             if (index < questions.length - 1) {
//                               index++;
//                             }

//                           });
//                         },
//                         child: Txt('You don\'t have an option'),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FloatingHeart extends StatefulWidget {
//   final Offset startPosition;

//   const FloatingHeart({Key? key, required this.startPosition})
//     : super(key: key);

//   @override
//   _FloatingHeartState createState() => _FloatingHeartState();
// }

// class _FloatingHeartState extends State<FloatingHeart>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animationY;
//   late Animation<double> _animationX;
//   late double randomX;

//   @override
//   void initState() {
//     super.initState();
//     randomX = Random().nextDouble() * 100 - 50; // random horizontal drift

//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _animationY = Tween<double>(
//       begin: 0,
//       end: -150,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _animationX = Tween<double>(
//       begin: 0,
//       end: randomX,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _controller.forward();

//     // Remove the widget after animation ends
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         if (mounted) {
//           setState(() {});
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Positioned(
//           left: widget.startPosition.dx + _animationX.value,
//           top: widget.startPosition.dy + _animationY.value,
//           child: Opacity(
//             opacity: 1 - _controller.value, // fade out
//             child: Icon(
//               Icons.favorite,
//               color: Colors.pinkAccent,
//               size: 24 + Random().nextInt(12).toDouble(), // random size
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:valentine/commons.dart';
import 'dart:math';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  bool show_intro = true;
  bool show_options = true;

  List questions = [
    'So tell me… Animesh Pandey, will you be my Valentine?',
    'Now that you\'ve said yes\nYou have to deal with my problems as well.\nAre you up for it?',
    'Are you signing to bear my tantrums for the rest of your life?',
    'Last question, are you signing up to see me age into a grumpy old lady?',
    'I love you.',
  ];

  // **List of hearts to display**
  List<Widget> hearts = [];

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade300,
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset('assets/bg.jpeg', fit: BoxFit.cover),
          ),

          // Dark overlay
          Container(color: const Color(0x7B000000)),

          // Hearts overlay
          ...hearts,

          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Txt(
                    'Hey Animesh ❤️',
                    color: Colors.white,
                    size: 22,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 20),
                  if (show_intro)
                    Txt(
                      'Miles between us, screens between us, time zones sometimes against us.',
                      color: Colors.white,
                      size: 16,
                    ),
                  if (show_intro)
                    Txt(
                      'But still — every day somehow begins and ends with you.',
                      color: Colors.white,
                      size: 16,
                    ),
                  if (show_intro)
                    Txt(
                      'For a lifetime with you, where every day feels like Valentine\'s.',
                      color: Colors.white,
                      size: 16,
                    ),
                  if (show_intro) const SizedBox(height: 15),
                  Txt(questions[index], color: Colors.white, size: 16),
                  const SizedBox(height: 20),
                  if (show_options)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (index == 0) show_intro = false;
                              if (index == questions.length - 2)
                                show_options = false;
                              if (index < questions.length - 1) index++;
                              addHearts(); // spawn hearts
                            });
                          },
                          child: Txt('Yes', size: 14),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (index == 0) show_intro = false;
                              if (index == questions.length - 2)
                                show_options = false;
                              if (index < questions.length - 1) index++;
                              addHearts(); // spawn hearts
                            });
                          },
                          child: Txt('You don\'t have an option', size: 14),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // **Function to add multiple hearts from button area**
  void addHearts() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      // spawn, e.g., 20 hearts
      for (int i = 0; i < 20; i++) {
        final startPos = Offset(
          random.nextDouble() * screenWidth, // random X
          random.nextDouble() * screenHeight, // random Y
        );

        hearts.add(
          FloatingHeart(
            startPosition: startPos,
            key: UniqueKey(),
            onComplete: () {
              setState(() {
                hearts.removeWhere((h) => h.key == h.key);
              });
            },
          ),
        );
      }
    });
  }
}

// **FloatingHeart widget**
class FloatingHeart extends StatefulWidget {
  final Offset startPosition;
  final VoidCallback onComplete;

  const FloatingHeart({
    Key? key,
    required this.startPosition,
    required this.onComplete,
  }) : super(key: key);

  @override
  _FloatingHeartState createState() => _FloatingHeartState();
}

class _FloatingHeartState extends State<FloatingHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationY;
  late Animation<double> _animationX;
  late double randomX;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    randomX = random.nextDouble() * 100 - 50;

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationY = Tween<double>(
      begin: 0,
      end: -150,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _animationX = Tween<double>(
      begin: 0,
      end: randomX,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete(); // notify parent to remove heart
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: widget.startPosition.dx + _animationX.value,
          top: widget.startPosition.dy + _animationY.value,
          child: Opacity(
            opacity: 1 - _controller.value,
            child: Icon(
              Icons.favorite,
              color: Colors.pinkAccent,
              size: 24 + random.nextInt(12).toDouble(),
            ),
          ),
        );
      },
    );
  }
}
