import 'dart:io';

Future<void> main() async {
  final root = Directory('rememberby_demo_flutter/build/web').absolute;
  final http = HttpClient();
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 9995);
  print('Preview listening on port 9995');
  await for (final req in server) {
    try {
      if (req.uri.path.startsWith('/api/')) {
        final path = req.uri.path.substring(4);
        final uri = Uri.parse(
          'http://127.0.0.1:8280$path',
        ).replace(query: req.uri.hasQuery ? req.uri.query : null);
        final upstream = await http.openUrl(req.method, uri);
        req.headers.forEach((name, values) {
          if (![
            'host',
            'connection',
            'content-length',
            'transfer-encoding',
          ].contains(name.toLowerCase())) {
            for (final value in values) {
              upstream.headers.add(name, value);
            }
          }
        });
        await upstream.addStream(req);
        final reply = await upstream.close();
        req.response.statusCode = reply.statusCode;
        reply.headers.forEach((name, values) {
          if (![
            'connection',
            'transfer-encoding',
            'content-length',
          ].contains(name.toLowerCase())) {
            for (final value in values) {
              req.response.headers.add(name, value);
            }
          }
        });
        await req.response.addStream(reply);
      } else {
        final parts = req.uri.pathSegments;
        if (parts.any(
          (p) => p == '..' || p.contains('/') || p.contains('\\'),
        )) {
          req.response.statusCode = 400;
        } else {
          final relative = parts.isEmpty || parts.last.isEmpty
              ? 'index.html'
              : parts.join('/');
          final file = File('${root.path}/$relative');
          if (!await file.exists()) {
            req.response.statusCode = 404;
          } else {
            const types = {
              'html': 'text/html',
              'js': 'application/javascript',
              'json': 'application/json',
              'css': 'text/css',
              'wasm': 'application/wasm',
              'png': 'image/png',
              'svg': 'image/svg+xml',
              'woff2': 'font/woff2',
            };
            final ext = file.path.split('.').last;
            req.response.headers.set(
              'content-type',
              types[ext] ?? 'application/octet-stream',
            );
            req.response.headers.set('cache-control', 'no-store');
            await req.response.addStream(file.openRead());
          }
        }
      }
    } catch (_) {
      req.response.statusCode = 502;
      req.response.write(
        'Development backend unavailable. Ask the agent to inspect tool/control.sh logs.',
      );
    } finally {
      await req.response.close();
    }
  }
}
