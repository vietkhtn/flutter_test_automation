import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Automation Test',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _accountController, _passwordController;

  @override
  void initState() {
    _accountController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Test Automation'),
      ),
      // body is the majority of the screen.
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Login Form'),
              const SizedBox(
                height: 16,
              ),
              TextField(
                key: const Key('accountTextField'),
                controller: _accountController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                key: const Key('passwordTextField'),
                controller: _passwordController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  key: const Key('loginBtn'),
                  onPressed: () {
                    if (_accountController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              key: Key('messageLogin'), 'Not Empty Fields')));
                    } else if (_passwordController.text != 'Password123') {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              key: Key('messageLogin'), 'Wrong Password')));
                    } else {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(key: Key('messageLogin'), 'Success')));
                    }
                  },
                  child: const Text('Login'))
            ]),
      ),
    );
  }
}
