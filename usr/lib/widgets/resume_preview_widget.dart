import 'package:flutter/material.dart';
import '../models/resume_data.dart';

class ResumePreviewWidget extends StatelessWidget {
  final ResumeData data;

  const ResumePreviewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Text(
                    data.fullName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    [data.location, data.phone, data.email]
                        .where((e) => e.isNotEmpty)
                        .join(' | '),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    [data.linkedinLink, data.githubLink]
                        .where((e) => e.isNotEmpty)
                        .join(' | '),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Divider(color: Colors.black, thickness: 1),
            const SizedBox(height: 20),

            // Summary
            if (data.summary.isNotEmpty) ...[
              _SectionHeader(title: 'PROFESSIONAL SUMMARY'),
              Text(
                data.summary,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 20),
            ],

            // Experience
            if (data.experience.isNotEmpty) ...[
              _SectionHeader(title: 'EXPERIENCE'),
              ...data.experience.map((exp) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              exp.company,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              exp.duration,
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          exp.role,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          exp.description,
                          style: const TextStyle(fontSize: 14, height: 1.4),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
            ],

            // Projects
            if (data.projects.isNotEmpty) ...[
              _SectionHeader(title: 'PROJECTS'),
              ...data.projects.map((proj) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          proj.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          proj.description,
                          style: const TextStyle(fontSize: 14, height: 1.4),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
            ],

            // Education
            if (data.education.isNotEmpty) ...[
              _SectionHeader(title: 'EDUCATION'),
              ...data.education.map((edu) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              edu.school,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              edu.degree,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Text(
                          edu.year,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
            ],

            // Skills
            if (data.skills.isNotEmpty) ...[
              _SectionHeader(title: 'SKILLS'),
              Text(
                data.skills,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(color: Colors.black54, thickness: 0.5),
        ],
      ),
    );
  }
}
