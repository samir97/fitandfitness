import 'package:fitandfitness/src/app/authentication/data/auth_repository.dart';
import 'package:fitandfitness/src/app/settings/presentation/delete_account/reauthenticate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DeleteAccountScreen extends ConsumerStatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  ConsumerState<DeleteAccountScreen> createState() =>
      _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends ConsumerState<DeleteAccountScreen> {
  late final TextEditingController textEditingController;
  bool canDelete = false;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      final isDelete = textEditingController.text.toLowerCase() == 'delete';
      if (canDelete != isDelete) {
        setState(() => canDelete = isDelete);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const ListTile(
            leading: Icon(Icons.warning),
            title: Text('Deleting your account cannot be undone.'),
          ),
          const ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text('All your data will be erased permanently.'),
          ),
          const ListTile(
            leading: Icon(Icons.no_accounts),
            title: Text('You will lose access to all services and features.'),
          ),
          const ListTile(
            leading: Icon(Icons.support_agent),
            title:
                Text('Need help or have questions? Contact us for assistance.'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const <TextSpan>[
                    TextSpan(text: 'Enter ‘'),
                    TextSpan(
                      text: 'delete',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: '’ below to confirm permanent account deletion.'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'delete',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();

                      final url = Uri.parse("mailto:contact@fitandfitness.app");

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Contact Us"),
                              content: const Text(
                                  "You can contact us at contact@fitandfitness.app"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Close"),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Contact Us'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: canDelete
                        ? () {
                            final user =
                                ref.read(authRepositoryProvider).currentUser;
                            if (user == null) {
                              if (context.mounted) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('User not found'),
                                      content: const SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text(
                                                'Please sign out and sign in again to continue.'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Sign Out'),
                                          onPressed: () {
                                            ref
                                                .read(firebaseAuthProvider)
                                                .signOut();
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ReauthenticateScreen(user),
                                ),
                              );
                            }
                          }
                        : null,
                    child: const Text('Delete Account'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
