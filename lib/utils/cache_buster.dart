/// Provides a per-app-run session key used to bust image caches so that
/// network images (e.g., certificates) can be revalidated after a full
/// website reload (F5 / hard refresh).
class CacheBuster {
  // Unique per app launch.
  static final String sessionKey =
      DateTime.now().millisecondsSinceEpoch.toString();
}
