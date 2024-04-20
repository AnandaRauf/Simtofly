import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'check_internet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMTOFLY',
      home: BlocProvider(
        create: (context) => InternetBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state == InternetState.connected) {
          // Jika terhubung, tampilkan WebView
          return SafeArea(
            child: WebView(
              initialUrl: 'https://simtofly.co.id/',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          );
        } else {
          // Jika tidak terhubung, tampilkan pesan peringatan
          return Scaffold(
            appBar: AppBar(title: Text('SIMTOFLY')),
            body: Center(
              child: Text('Maaf, cek koneksi internet Anda terlebih dahulu.'),
            ),
          );
        }
      },
    );
  }
}
