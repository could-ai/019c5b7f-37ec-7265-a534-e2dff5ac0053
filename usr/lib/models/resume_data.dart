class ResumeData {
  String fullName;
  String email;
  String phone;
  String location;
  String summary;
  List<EducationEntry> education;
  List<ExperienceEntry> experience;
  List<ProjectEntry> projects;
  String skills; // Comma separated
  String githubLink;
  String linkedinLink;

  ResumeData({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.summary = '',
    List<EducationEntry>? education,
    List<ExperienceEntry>? experience,
    List<ProjectEntry>? projects,
    this.skills = '',
    this.githubLink = '',
    this.linkedinLink = '',
  })  : education = education ?? [],
        experience = experience ?? [],
        projects = projects ?? [];

  factory ResumeData.sample() {
    return ResumeData(
      fullName: 'Alex Morgan',
      email: 'alex.morgan@example.com',
      phone: '+1 (555) 123-4567',
      location: 'San Francisco, CA',
      summary:
          'Experienced Software Engineer with a passion for building scalable web applications and intuitive user interfaces. Proven track record of delivering high-quality code in fast-paced environments.',
      education: [
        EducationEntry(
          school: 'University of Technology',
          degree: 'B.S. Computer Science',
          year: '2018 - 2022',
        ),
      ],
      experience: [
        ExperienceEntry(
          company: 'Tech Solutions Inc.',
          role: 'Senior Developer',
          duration: '2022 - Present',
          description:
              'Leading a team of 5 developers to build the next generation of cloud-based tools. Improved system performance by 40%.',
        ),
        ExperienceEntry(
          company: 'StartUp Hub',
          role: 'Junior Developer',
          duration: '2020 - 2022',
          description:
              'Collaborated with designers to implement responsive UI components. Assisted in backend API development.',
        ),
      ],
      projects: [
        ProjectEntry(
          name: 'E-Commerce Platform',
          description:
              'Built a full-stack e-commerce solution using Flutter and Node.js. Handled payment integration and user authentication.',
        ),
      ],
      skills: 'Flutter, Dart, JavaScript, React, Node.js, SQL, Git, Agile',
      githubLink: 'github.com/alexmorgan',
      linkedinLink: 'linkedin.com/in/alexmorgan',
    );
  }
}

class EducationEntry {
  String school;
  String degree;
  String year;

  EducationEntry({this.school = '', this.degree = '', this.year = ''});
}

class ExperienceEntry {
  String company;
  String role;
  String duration;
  String description;

  ExperienceEntry({
    this.company = '',
    this.role = '',
    this.duration = '',
    this.description = '',
  });
}

class ProjectEntry {
  String name;
  String description;

  ProjectEntry({this.name = '', this.description = ''});
}
