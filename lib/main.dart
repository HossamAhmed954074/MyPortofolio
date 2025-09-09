import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hossam_pr/cubits/navigation_cubit.dart';
import 'package:hossam_pr/firebase_options.dart';
import 'package:hossam_pr/screens/home_page.dart';
import 'package:hossam_pr/styles/app_theme.dart';
import 'package:hossam_pr/utils/services.dart';
import 'package:hossam_pr/utils/certficat_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Fetch certificates data before running the app (cached in Services singleton)
  final List<CertificateUtils> certs = await Services().getCertificates();
  runApp(MyApp(initialCertificates: certs));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.initialCertificates});
  final List<CertificateUtils> initialCertificates;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _imagesCached = false;
  double _progress = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_imagesCached) {
      _precacheCertificates();
    }
  }

  Future<void> _precacheCertificates() async {
    final certs = widget.initialCertificates;
    if (certs.isEmpty) {
      setState(() => _imagesCached = true);
      return;
    }

    final total = certs.length;
    int done = 0;

    // Limit concurrency to avoid overwhelming network
    for (final cert in certs) {
      final url = cert.image;
      try {
        final imageProvider = NetworkImage(url);
        // Timeout each image after 6 seconds so we don't block forever
        await Future.any([
          precacheImage(imageProvider, context),
          Future.delayed(const Duration(seconds: 6)),
        ]);
      } catch (_) {
        // Ignore individual failures; cached_network_image will handle retry/display error later
      }
      done += 1;
      if (mounted) {
        setState(() => _progress = done / total);
      }
    }
    if (mounted) setState(() => _imagesCached = true);
  }

  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Hossam Ahmed Mahmoud - Portfolio',
      home:
          _imagesCached ? const HomePage() : _SplashScreen(progress: _progress),
    );

    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: materialApp,
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F0F17), Color(0xFF1E1E2A)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Loading Portfolio...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 280,
                child: LinearProgressIndicator(
                  value: progress > 0 && progress < 0.98 ? progress : null,
                  backgroundColor: Colors.white12,
                  color: Colors.blueAccent,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                progress == 0
                    ? 'Starting...'
                    : 'Caching images ${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
