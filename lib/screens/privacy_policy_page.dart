import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // 1. Introduction
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to our Smart Personal Finance Management System ("we," "our," or "us"). We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and related services.\n\n'
              'By accessing or using our application, you consent to the practices described in this Privacy Policy. We encourage you to read this document carefully to understand our policies and practices regarding your information and how we will treat it.',
            ),
            SizedBox(height: 16),

            // 2. Information We Collect
            Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '2.1 Personal Information\n'
              '• Registration Data: When you create an account, we collect your full name, email address, phone number, and create login credentials.\n'
              '• Profile Information: Additional details you choose to provide, including profile pictures, demographic information, and preferences.\n'
              '• Contact Information: Email addresses, phone numbers, and other communication details you provide for account verification and communication purposes.\n\n'
              '2.2 Financial Information\n'
              '• Transaction Data: Details of your income, expenses, investments, and financial transactions that you manually input or sync with connected accounts.\n'
              '• Financial Goals: Information about your savings targets, budget limits, and financial objectives.\n'
              '• Account Balances: Current financial status across different accounts and assets.\n'
              '• Spending Patterns: Categorized expenditure information and financial behavior analytics.\n\n'
              '2.3 Technical Information\n'
              '• Device Information: Hardware model, operating system version, unique device identifiers, mobile network information.\n'
              '• Log Data: IP addresses, browser type, pages visited, time and date of visits, time spent on pages, and other diagnostic data.\n'
              '• Usage Statistics: Feature usage patterns, clickstream data, and interaction metrics within the application.\n\n'
              '2.4 Location Information\n'
              '• General Location: Approximate location data based on IP address for regional customization and compliance.\n'
              '• Precise Location: Only when explicitly permitted by you for location-based financial services or fraud detection.',
            ),
            SizedBox(height: 16),

            // 3. How We Use Your Information
            Text(
              '3. How We Use Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '3.1 Service Provision and Operation\n'
              '• Process your financial transactions and maintain your account\n'
              '• Provide personalized financial insights and recommendations\n'
              '• Generate comprehensive financial reports and analytics\n'
              '• Enable budget planning and expense tracking features\n'
              '• Deliver push notifications and alerts for financial activities\n\n'
              '3.2 Service Improvement\n'
              '• Analyze usage patterns to enhance user experience\n'
              '• Develop new features and functionality based on user behavior\n'
              '• Conduct research and analysis to improve our algorithms\n'
              '• Test and optimize application performance and security\n\n'
              '3.3 Communication and Support\n'
              '• Respond to your inquiries and provide customer support\n'
              '• Send important notices about service changes, terms, and policies\n'
              '• Deliver marketing communications (with your consent)\n'
              '• Conduct user surveys and feedback collection\n\n'
              '3.4 Security and Compliance\n'
              '• Verify your identity and prevent unauthorized access\n'
              '• Detect and prevent fraud, security breaches, and illegal activities\n'
              '• Comply with legal obligations and regulatory requirements\n'
              '• Enforce our terms of service and protect our rights',
            ),
            SizedBox(height: 16),

            // 4. Data Protection and Security
            Text(
              '4. Data Protection and Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '4.1 Security Measures\n'
              '• Encryption: All sensitive data is encrypted using industry-standard AES-256 encryption both in transit and at rest.\n'
              '• Access Controls: Strict role-based access controls and authentication mechanisms.\n'
              '• Network Security: Firewalls, intrusion detection systems, and regular security monitoring.\n'
              '• Physical Security: Secure data centers with 24/7 monitoring and biometric access controls.\n\n'
              '4.2 Data Retention\n'
              'We retain your personal information only for as long as necessary to:\n'
              '• Provide the services you requested\n'
              '• Comply with legal obligations\n'
              '• Resolve disputes and enforce agreements\n'
              '• Maintain business records as required by law\n\n'
              '4.3 Data Minimization\n'
              'We practice data minimization principles, collecting only the information essential for providing our services and deleting unnecessary data regularly.',
            ),
            SizedBox(height: 16),

            // 5. Information Sharing and Disclosure
            Text(
              '5. Information Sharing and Disclosure',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '5.1 Service Providers\n'
              'We may share information with trusted third-party service providers who assist us in:\n'
              '• Cloud storage and hosting services\n'
              '• Payment processing and financial data aggregation\n'
              '• Customer support and communication platforms\n'
              '• Analytics and performance monitoring\n\n'
              '5.2 Legal Requirements\n'
              'We may disclose your information when required by:\n'
              '• Court orders, subpoenas, or legal processes\n'
              '• Government agencies and regulatory bodies\n'
              '• Law enforcement authorities for criminal investigations\n'
              '• To protect our rights, property, or safety, or that of our users\n\n'
              '5.3 Business Transfers\n'
              'In the event of a merger, acquisition, or sale of all or a portion of our assets, your information may be transferred as part of the transaction, subject to confidentiality provisions.\n\n'
              '5.4 Aggregated Data\n'
              'We may share aggregated, anonymized data that does not identify any individual for:\n'
              '• Research purposes and industry analysis\n'
              '• Marketing and business development\n'
              '• Statistical reporting and trend analysis',
            ),
            SizedBox(height: 16),

            // 6. Your Rights and Choices
            Text(
              '6. Your Rights and Choices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '6.1 Access and Correction\n'
              '• Access the personal information we hold about you\n'
              '• Request correction of inaccurate or incomplete information\n'
              '• Obtain a copy of your data in a portable format\n'
              '• Review how your data is being processed\n\n'
              '6.2 Data Deletion and Restriction\n'
              '• Deletion of your personal information (right to be forgotten)\n'
              '• Restriction of processing under certain circumstances\n'
              '• Withdrawal of consent for data processing\n'
              '• Objection to processing of your personal data\n\n'
              '6.3 Communication Preferences\n'
              '• Marketing and promotional communications\n'
              '• Push notifications and alerts\n'
              '• Frequency of reports and updates\n'
              '• Contact methods and timing\n\n'
              '6.4 Account Settings\n'
              '• Update your profile information\n'
              '• Manage connected accounts and services\n'
              '• Adjust privacy and visibility settings\n'
              '• Configure automatic data processing preferences',
            ),
            SizedBox(height: 16),

            // 7. Cookies and Tracking Technologies
            Text(
              '7. Cookies and Tracking Technologies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '7.1 Types of Cookies Used\n'
              '• Essential Cookies: Required for basic functionality and security\n'
              '• Performance Cookies: Collect anonymous data for analytics\n'
              '• Functionality Cookies: Remember your preferences and settings\n'
              '• Advertising Cookies: Deliver relevant marketing content (with consent)\n\n'
              '7.2 Managing Cookies\n'
              'You can control cookie preferences through:\n'
              '• Browser settings and privacy options\n'
              '• Our application preference center\n'
              '• Opt-out mechanisms for specific tracking technologies\n'
              '• Third-party tools for comprehensive cookie management',
            ),
            SizedBox(height: 16),

            // 8. International Data Transfers
            Text(
              '8. International Data Transfers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '8.1 Cross-Border Transfers\n'
              'Your information may be transferred to and processed in countries other than your own. We ensure appropriate safeguards are in place through:\n'
              '• Standard contractual clauses\n'
              '• Adequacy decisions\n'
              '• Binding corporate rules\n'
              '• Other legally approved mechanisms\n\n'
              '8.2 Data Localization\n'
              'Where required by law, we maintain data storage and processing within specific jurisdictions to comply with local data protection regulations.',
            ),
            SizedBox(height: 16),

            // 9. Children\'s Privacy
            Text(
              '9. Children\'s Privacy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Our services are not intended for individuals under the age of 18. We do not knowingly collect personal information from children. If we become aware that we have collected personal information from a child without parental consent, we will take steps to remove that information immediately.',
            ),
            SizedBox(height: 16),

            // 10. Changes to This Privacy Policy
            Text(
              '10. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update this Privacy Policy periodically to reflect:\n'
              '• Changes in our practices and services\n'
              '• Legal and regulatory requirements\n'
              '• Technological developments\n'
              '• User feedback and industry standards\n\n'
              'We will notify you of material changes through:\n'
              '• In-app notifications and announcements\n'
              '• Email communications to registered users\n'
              '• Updates to the policy version and effective date\n'
              '• Prominent notices within our application',
            ),
            SizedBox(height: 16),

            // 11. Contact Information
            Text(
              '11. Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'For privacy-related inquiries, requests, or complaints, please contact us:\n\n'
              'Data Protection Officer\n'
              'Email: privacy@yourfinanceapp.com\n'
              'Phone: +1 (555) 123-4567\n'
              'Address: 123 Financial District, Tech City, TC 12345\n\n'
              'Response Time: We commit to responding to all legitimate inquiries within 30 days and will provide information about any delays if they occur.',
            ),
            SizedBox(height: 16),

            // 12. Governing Law and Dispute Resolution
            Text(
              '12. Governing Law and Dispute Resolution',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This Privacy Policy is governed by the laws of [Your Jurisdiction]. Any disputes arising from this policy shall be resolved through:\n'
              '• Informal negotiation and mediation\n'
              '• Binding arbitration in accordance with [Arbitration Rules]\n'
              '• Legal proceedings in courts of competent jurisdiction',
            ),
            SizedBox(height: 16),

            // 13. Additional Provisions
            Text(
              '13. Additional Provisions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '13.1 California Privacy Rights\n'
              'California residents have additional rights under the CCPA, including:\n'
              '• Right to know about personal information collected\n'
              '• Right to delete personal information\n'
              '• Right to opt-out of sale of personal information\n'
              '• Right to non-discrimination for exercising privacy rights\n\n'
              '13.2 GDPR Compliance\n'
              'For users in the European Economic Area, we comply with GDPR requirements including:\n'
              '• Lawful basis for processing\n'
              '• Data protection impact assessments\n'
              '• Records of processing activities\n'
              '• Data breach notification procedures\n\n'
              '13.3 Do Not Track Signals\n'
              'We respect "Do Not Track" signals and do not track, plant cookies, or use advertising when a Do Not Track mechanism is in place.\n\n'
              'Effective Date: January 1, 2024\n'
              'Last Updated: October 27, 2024\n'
              'Version: 2.1',
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
