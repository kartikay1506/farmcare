import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  WebViewPage(this.url);
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.disabled,
        onWebViewCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
