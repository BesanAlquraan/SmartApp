import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of Service"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Terms of Service Agreement",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "1. Acceptance of Terms",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Welcome to Smart Personal Finance Management System (\"the Application\"). "
                "By accessing, downloading, installing, or using our mobile application, website, "
                "and related services (collectively, \"the Services\"), you acknowledge that you "
                "have read, understood, and agree to be bound by these Terms of Service.",
              ),
              SizedBox(height: 8),
              Text(
                "1.1 Binding Agreement",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "These Terms constitute a legally binding agreement between you (\"User\") and "
                "[Your Company Name] (\"Company,\" \"we,\" \"us,\" or \"our\"). If you are using the "
                "Services on behalf of an organization, you represent that you have authority to bind "
                "that organization to these Terms.",
              ),
              SizedBox(height: 8),
              Text(
                "1.2 Modifications to Terms",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "We reserve the right to modify these Terms at any time. We will provide notice of "
                "material changes through:\n- In-app notifications\n- Email communications\n- "
                "Updated version indicators\nContinued use after changes constitutes acceptance of "
                "modified Terms.",
              ),
              SizedBox(height: 16),
              Text(
                "2. Eligibility and Registration",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "2.1 User Eligibility\nTo use our Services, you must:\n"
                "- Be at least 18 years old\n"
                "- Have legal capacity to enter binding contracts\n"
                "- Provide accurate and complete registration information\n"
                "- Maintain the security of your account credentials",
              ),
              SizedBox(height: 8),
              Text(
                "2.2 Account Responsibility",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "You are responsible for:\n"
                "- All activities under your account\n"
                "- Maintaining confidentiality of login credentials\n"
                "- Immediately notifying us of unauthorized access\n"
                "- Ensuring accurate and updated profile information",
              ),
              SizedBox(height: 16),
              Text(
                "3. Service Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "3.1 Financial Management Services\nOur Application provides:\n"
                "- Personal budget planning and tracking\n"
                "- Expense categorization and analysis\n"
                "- Financial goal setting and monitoring\n"
                "- Investment tracking and portfolio management\n"
                "- Bill payment reminders and scheduling\n"
                "- Financial report generation",
              ),
              SizedBox(height: 8),
              Text(
                "3.2 Limitations",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "The Services include:\n"
                "- Educational financial information only\n"
                "- Tools for personal financial organization\n"
                "- Automated financial calculations and projections\n"
                "- Not financial, legal, or tax advice",
              ),
              SizedBox(height: 16),
              Text(
                "4. User Obligations and Conduct",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "4.1 Permitted Use\nYou may use the Services for:\n"
                "- Personal, non-commercial financial management\n"
                "- Legal purposes in compliance with all applicable laws\n"
                "- Inputting and managing your own financial data",
              ),
              Text(
                "4.2 Prohibited Activities\nYou agree not to:\n"
                "- Use the Services for illegal or fraudulent purposes\n"
                "- Attempt to gain unauthorized access to systems\n"
                "- Reverse engineer, decompile, or disassemble the Application\n"
                "- Transmit viruses, malware, or harmful code\n"
                "- Harass, abuse, or harm other users\n"
                "- Use automated systems to access Services\n"
                "- Share account credentials with third parties",
              ),
              SizedBox(height: 16),
              Text(
                "5. Financial Information and Data",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "5.1 Data Accuracy\nYou acknowledge that:\n"
                "- You are solely responsible for data accuracy\n"
                "- We are not responsible for errors in user-input data\n"
                "- Financial decisions should not rely solely on Application data\n"
                "- Regular verification of financial information is necessary",
              ),
              // ... يمكنك متابعة باقي الأقسام بنفس الطريقة ...
            ],
          ),
        ),
      ),
    );
  }
}
