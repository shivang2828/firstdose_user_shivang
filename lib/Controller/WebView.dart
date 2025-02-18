import 'package:firstdose_user/Utils/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key ,  required this.url,required this.name});
  final String url;

  final dynamic name;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: widget.name,
      isLeading: true,
      isCartIcon: false,),
      // appBar: CustomAppBar(appbarTitle: appbarTitle),
      body: SafeArea(
          child: WebViewWidget(controller: _controller)),
    );
  }
}
