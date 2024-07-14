import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSites extends StatefulWidget {
  const WebViewSites({super.key});

  @override
  State<WebViewSites> createState() => _WebViewSitesState();
}

class _WebViewSitesState extends State<WebViewSites> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://iporesult.cdsc.com.np'));
  }

  void _reloadPage() {
    _controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reloadPage,
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
