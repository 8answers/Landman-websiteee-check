import 'dart:html' as html;

import 'package:flutter/material.dart';

class StartupWebsiteView extends StatefulWidget {
  const StartupWebsiteView({super.key});

  @override
  State<StartupWebsiteView> createState() => _StartupWebsiteViewState();
}

class _StartupWebsiteViewState extends State<StartupWebsiteView> {
  // Serve landing page from Flutter web assets so production rewrites don't
  // trap users on the Flutter loading spinner.
  static const String _startupUrl =
      '/assets/website_8answers%20copy%202/index.html';
  bool _hasRedirected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirectIfNeeded();
  }

  void _redirectIfNeeded() {
    if (_hasRedirected) return;
    _hasRedirected = true;

    final currentPath = html.window.location.pathname ?? '';
    if (currentPath.contains('/assets/website_8answers%20copy%202/') ||
        currentPath.contains('/assets/website_8answers copy 2/')) {
      return;
    }

    html.window.location.replace(_startupUrl);
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0C8CE9)),
        ),
      ),
    );
  }
}
