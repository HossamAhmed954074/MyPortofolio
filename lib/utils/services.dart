import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hossam_pr/utils/certficat_utils.dart';

class Services {
  Services._internal();
  static final Services _instance = Services._internal();
  factory Services() => _instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Internal cache persists for the app lifetime (singleton)
  List<CertificateUtils> _certificates = [];
  Future<List<CertificateUtils>>? _inFlight;

  Future<List<CertificateUtils>> getCertificates() async {
    if (_certificates.isNotEmpty) return _certificates; // Already loaded
    if (_inFlight != null) return _inFlight!; // Return in-progress future

    _inFlight = _fetchCertificates();
    try {
      _certificates = await _inFlight!;
    } finally {
      _inFlight = null; // Allow refresh logic in future if needed
    }
    return _certificates;
  }

  Future<List<CertificateUtils>> _fetchCertificates() async {
    log('Fetching certificates from Firestore...');
    final List<CertificateUtils> loaded = [];
    try {
      final snapshot = await firestore.collection('certifications').get();
      for (final doc in snapshot.docs) {
        final data = doc.data();
        loaded.add(
          CertificateUtils(
            image: "https://drive.google.com/uc?export=view&id=${data['image']}" ?? '',
            title: data['title'] ?? '',
            subtitle: data['provider'] ?? '',
            certLink: data['certlink'] ?? '',
          ),
        );
        log('Fetched certificate: ${data['title']}');
      }
    } catch (e, st) {
      log('Error fetching certificates: $e', stackTrace: st);
    }
    return loaded;
  }
}
