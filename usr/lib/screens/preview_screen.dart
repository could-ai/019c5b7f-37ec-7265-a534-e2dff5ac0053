import 'package:flutter/material.dart';
import '../models/resume_data.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/resume_preview_widget.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, we would pass data via arguments or state management.
    // For this skeleton, we'll just show the sample data or empty data.
    // Let's show sample data so the preview looks good immediately.
    final ResumeData data = ResumeData.sample();

    return Scaffold(
      appBar: const AppNavBar(currentRoute: '/preview'),
      backgroundColor: const Color(0xFFE0E0E0), // Grey background to make the paper pop
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            width: 800, // Fixed width for A4-like appearance on desktop
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            // We reuse the same widget but it will be full width here
            child: ResumePreviewWidget(data: data),
          ),
        ),
      ),
    );
  }
}
