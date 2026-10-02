import 'package:flutter/material.dart';
import 'package:rememberby_demo_client/rememberby_demo_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'client.dart';
import 'screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'RememberBy',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff31594b)),
      scaffoldBackgroundColor: const Color(0xfff6f4ee),
    ),
    home: const DemoPage(),
  );
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('RememberBy'),
      actions: [
        IconButton(
          tooltip: 'Sign out',
          onPressed: () => client.auth.signOutDevice(),
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 680),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A little space for things worth remembering.',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Developer demo · Preview first. Launch when you are ready.',
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.cloud_outlined),
                    label: const Text('Launch to Serverpod Cloud'),
                    onPressed: () async {
                      final opened = await launchUrl(
                        Uri.parse('https://console.serverpod.dev/auth/signup'),
                        mode: LaunchMode.externalApplication,
                        webOnlyWindowName: '_blank',
                      );
                      if (!opened && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Could not open Serverpod Cloud. Try again.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const Text(
                    'Opens Cloud signup. Existing users can sign in. Deployment is a separate step.',
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            const Expanded(child: SignInScreen(child: ItemsPage())),
          ],
        ),
      ),
    ),
  );
}

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final _text = TextEditingController();
  List<RememberedItem> _items = [];
  bool _loading = true;
  bool _saving = false;
  String? _error;
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (mounted) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }
    try {
      final items = await client.items.list();
      if (mounted) setState(() => _items = items);
    } catch (_) {
      if (mounted) {
        setState(
          () => _error =
              'Could not load your items. Check the backend and try again.',
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _save() async {
    if (_saving || _text.text.trim().isEmpty) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await client.items.add(_text.text);
      _text.clear();
      await _load();
    } catch (_) {
      if (mounted) {
        setState(
          () => _error = 'Could not save. Your text is still here; try again.',
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        TextField(
          controller: _text,
          maxLength: 500,
          minLines: 1,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Something to remember',
            hintText: 'A good idea, a name, a small promise…',
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          children: [
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: const Icon(Icons.add),
              label: Text(_saving ? 'Saving…' : 'Remember this'),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Reload items',
              onPressed: _loading ? null : _load,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              _error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        const SizedBox(height: 12),
        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _items.isEmpty
              ? const Center(
                  child: Text('Nothing saved yet. Start with one small thing.'),
                )
              : ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.text,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.createdAt
                                  .toLocal()
                                  .toString()
                                  .split('.')
                                  .first,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    ),
  );
}
