import 'package:flutter/material.dart';
import '../models/resume_data.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/resume_preview_widget.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  ResumeData _resumeData = ResumeData();

  void _loadSampleData() {
    setState(() {
      _resumeData = ResumeData.sample();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine layout based on screen width
    final isWideScreen = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: const AppNavBar(currentRoute: '/builder'),
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      body: isWideScreen
          ? Row(
              children: [
                // Left Column: Form
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.black12)),
                      color: Colors.white,
                    ),
                    child: _buildFormSection(),
                  ),
                ),
                // Right Column: Preview
                Expanded(
                  flex: 3,
                  child: Container(
                    color: const Color(0xFFE0E0E0),
                    padding: const EdgeInsets.all(40),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1 / 1.414, // A4 aspect ratio
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ResumePreviewWidget(data: _resumeData),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : _buildMobileLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Edit'),
              Tab(text: 'Preview'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildFormSection(),
                Container(
                  color: const Color(0xFFE0E0E0),
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: ResumePreviewWidget(data: _resumeData),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Resume Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
              ),
            ),
            TextButton.icon(
              onPressed: _loadSampleData,
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Load Sample Data'),
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('Personal Info'),
        _buildTextField('Full Name', _resumeData.fullName,
            (v) => setState(() => _resumeData.fullName = v)),
        _buildTextField('Email', _resumeData.email,
            (v) => setState(() => _resumeData.email = v)),
        _buildTextField('Phone', _resumeData.phone,
            (v) => setState(() => _resumeData.phone = v)),
        _buildTextField('Location', _resumeData.location,
            (v) => setState(() => _resumeData.location = v)),

        const SizedBox(height: 24),
        _buildSectionTitle('Summary'),
        _buildTextField('Professional Summary', _resumeData.summary,
            (v) => setState(() => _resumeData.summary = v),
            maxLines: 4),

        const SizedBox(height: 24),
        _buildSectionTitle('Education'),
        ..._resumeData.education.asMap().entries.map((entry) {
          int idx = entry.key;
          EducationEntry edu = entry.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTextField('School', edu.school,
                      (v) => setState(() => edu.school = v)),
                  _buildTextField('Degree', edu.degree,
                      (v) => setState(() => edu.degree = v)),
                  _buildTextField(
                      'Year', edu.year, (v) => setState(() => edu.year = v)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => setState(() {
                        _resumeData.education.removeAt(idx);
                      }),
                      child: const Text('Remove',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        OutlinedButton.icon(
          onPressed: () => setState(() {
            _resumeData.education.add(EducationEntry());
          }),
          icon: const Icon(Icons.add),
          label: const Text('Add Education'),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
        ),

        const SizedBox(height: 24),
        _buildSectionTitle('Experience'),
        ..._resumeData.experience.asMap().entries.map((entry) {
          int idx = entry.key;
          ExperienceEntry exp = entry.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTextField('Company', exp.company,
                      (v) => setState(() => exp.company = v)),
                  _buildTextField('Role', exp.role,
                      (v) => setState(() => exp.role = v)),
                  _buildTextField('Duration', exp.duration,
                      (v) => setState(() => exp.duration = v)),
                  _buildTextField('Description', exp.description,
                      (v) => setState(() => exp.description = v),
                      maxLines: 3),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => setState(() {
                        _resumeData.experience.removeAt(idx);
                      }),
                      child: const Text('Remove',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        OutlinedButton.icon(
          onPressed: () => setState(() {
            _resumeData.experience.add(ExperienceEntry());
          }),
          icon: const Icon(Icons.add),
          label: const Text('Add Experience'),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
        ),

        const SizedBox(height: 24),
        _buildSectionTitle('Projects'),
        ..._resumeData.projects.asMap().entries.map((entry) {
          int idx = entry.key;
          ProjectEntry proj = entry.value;
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            color: Colors.grey[50],
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildTextField('Project Name', proj.name,
                      (v) => setState(() => proj.name = v)),
                  _buildTextField('Description', proj.description,
                      (v) => setState(() => proj.description = v),
                      maxLines: 3),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => setState(() {
                        _resumeData.projects.removeAt(idx);
                      }),
                      child: const Text('Remove',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        OutlinedButton.icon(
          onPressed: () => setState(() {
            _resumeData.projects.add(ProjectEntry());
          }),
          icon: const Icon(Icons.add),
          label: const Text('Add Project'),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
        ),

        const SizedBox(height: 24),
        _buildSectionTitle('Skills'),
        _buildTextField('Skills (comma separated)', _resumeData.skills,
            (v) => setState(() => _resumeData.skills = v),
            maxLines: 2),

        const SizedBox(height: 24),
        _buildSectionTitle('Links'),
        _buildTextField('GitHub URL', _resumeData.githubLink,
            (v) => setState(() => _resumeData.githubLink = v)),
        _buildTextField('LinkedIn URL', _resumeData.linkedinLink,
            (v) => setState(() => _resumeData.linkedinLink = v)),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String initialValue, Function(String) onChanged,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
