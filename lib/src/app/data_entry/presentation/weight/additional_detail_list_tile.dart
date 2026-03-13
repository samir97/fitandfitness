import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalDetailListTile extends StatelessWidget {
  const AdditionalDetailListTile({
    super.key,
    this.isNew = true,
  });

  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        );

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Bone Mass',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '89 kg',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      trailing: SizedBox(
        height: textStyle.fontSize! * 1.414,
        width: textStyle.fontSize! * 1.414,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          color: isNew
              ? CupertinoColors.systemGreen
              : CupertinoColors.activeOrange,
          child: Icon(
            isNew ? Icons.add : Icons.edit,
            size: textStyle.fontSize,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: const Text("Delete"),
                            onPressed: () {},
                          ),
                          const Text("Bone Mass",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextButton(
                            child: const Text("Save"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          onSubmitted: (input) => Navigator.of(context).pop(),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
