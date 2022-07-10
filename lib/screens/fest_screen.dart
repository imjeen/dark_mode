import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:dark_mode/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FestScreen extends StatefulWidget {
  const FestScreen({Key? key}) : super(key: key);

  @override
  State<FestScreen> createState() => _FestScreenState();
}

class _FestScreenState extends State<FestScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  late bool cirAn = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModeProvider>(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: cirAn
          ? CircularRevealAnimation(
              centerOffset: Offset(size.height / 15, size.width / 3.5),
              animation: animation,
              child: _buildBody(context, themeProvider),
            )
          : _buildBody(context, themeProvider),
    );
  }

  Widget _buildBody(BuildContext context, ThemeModeProvider themeProvider) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ..._buildPositionedCircle(),
          Positioned(
            right: MediaQuery.of(context).size.width / 1.18, //230.0,
            // bottom: MediaQuery.of(context).size.width / 0.68, //40.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  cirAn = true;
                });
                final theme = themeProvider.currentMode == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark;
                themeProvider.onChange(theme);

                if (animationController.status == AnimationStatus.forward ||
                    animationController.status == AnimationStatus.completed) {
                  animationController.reset();
                  animationController.forward();
                } else {
                  animationController.forward();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).hoverColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, bottom: 28),
                  child: themeProvider.currentMode == ThemeMode.dark
                      ? Image.asset(
                          "assets/bulb_off.png",
                          fit: BoxFit.fitHeight,
                        )
                      : Image.asset(
                          "assets/bulb_on.png",
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 1.2, //230.0,
            top: MediaQuery.of(context).size.width / 0.69, //40
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25.0),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 40, bottom: 0.0, left: 25.0, right: 25.0),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 2,
                        child: GestureDetector(
                            onTap: () {},
                            child: themeProvider.currentMode == ThemeMode.dark
                                ? Image.asset("assets/logo_dark.png")
                                : Image.asset("assets/logo-light.png")),
                      ),
                    ],
                  ),
                ),
              ),
              const Flexible(flex: 6, child: Text('desc #1')),
              const Flexible(flex: 2, child: Text('desc #2')),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Text('Go Home'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Positioned> _buildPositionedCircle() {
    return [
      Positioned(
        left: MediaQuery.of(context).size.width / 1.15, //230.0,
        bottom: MediaQuery.of(context).size.width / 1,
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).indicatorColor,
          ),
        ),
      ),
      Positioned(
        right: MediaQuery.of(context).size.width / 1.2, //230.0,
        bottom: MediaQuery.of(context).size.width / 0.69, //40
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
      Positioned(
        left: MediaQuery.of(context).size.width / 1.1, //230.0,
        top: MediaQuery.of(context).size.width / 0.8, //40.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).highlightColor,
          ),
        ),
      ),
      Positioned(
        right: MediaQuery.of(context).size.width / 1.05, //230.0,
        bottom: MediaQuery.of(context).size.width / 1.3, //40.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).focusColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: MediaQuery.of(context).size.width / 1.1, //230.0,
        bottom: MediaQuery.of(context).size.width / 0.7, //40.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).hintColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: MediaQuery.of(context).size.width / 1.2, //230.0,
        top: MediaQuery.of(context).size.width / 2.5, //40.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.height / 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).indicatorColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
