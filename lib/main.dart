import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// エントリーポイント
void main() {
  // レイアウト構成を確認するかどうか
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
