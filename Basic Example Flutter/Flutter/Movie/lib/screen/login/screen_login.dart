import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME')),
      body: Center(
        child: RaisedButton(
          onPressed: () => Get.toNamed('/login'),
          child: Text('Login'),
        ),
      ),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> animationLogo;
  late Animation<double> animationTextFieldUser;
  final duration = const Duration(milliseconds: 800);

  @override
  void onInit() {
    _animationController = AnimationController(duration: duration, vsync: this);

    animationLogo = Tween<double>(begin: 0, end: 150)
        .animate(_animationController)
      ..addListener(() => update());
    animationTextFieldUser = Tween<double>(begin: Get.width, end: 0)
        .animate(_animationController)
      ..addListener(() => update());
    _animationController.forward();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<LoginController>(
          builder: (_) {
            return Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Container(
                    height: _.animationLogo.value,
                    width: _.animationLogo.value,
                    child: FlutterLogo(),
                  ),
                ),
                AnimatedBuilder(
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User',
                    ),
                  ),
                  animation: _.animationTextFieldUser,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_.animationTextFieldUser.value, 0),
                      child: child,
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
