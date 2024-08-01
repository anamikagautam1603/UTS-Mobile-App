import 'package:flutter/material.dart';
import 'package:railway_intership/screens/api_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late Future<List<dynamic>> reports;
  final ApiService apiService = ApiService('http://localhost:3000');

  @override
  void initState() {
    super.initState();
    reports = apiService.fetchReports('token');
  }

  Future<void> generatePdf(List<dynamic> reportData) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Reports', style: const pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              ...reportData.map((report) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(report['title'],
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 5),
                    pw.Text(report['content']),
                    pw.SizedBox(height: 20),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 36, 99, 147),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: reports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No reports found'));
          }

          final reportList = snapshot.data!;
          return Column(
            children: [
              // Buttons to generate PDFs for different reports
              Wrap(
                spacing: 8.0,
                children: reportList.map((report) {
                  return ElevatedButton(
                    onPressed: () => generatePdf([report]),
                    child: Text('View ${report['title']} PDF'),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              // List of reports displayed as cards
              Expanded(
                child: ListView.builder(
                  itemCount: reportList.length,
                  itemBuilder: (context, index) {
                    final report = reportList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              report['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              report['content'],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
