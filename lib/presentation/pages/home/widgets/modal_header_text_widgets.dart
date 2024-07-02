import 'package:flutter/material.dart';
import 'package:kanban_tasks_list_flutter/presentation/pages/home/config/kanban_config.dart';

class ModalHeaderTextWidgets extends StatelessWidget {
  final String header;

  const ModalHeaderTextWidgets({
    super.key,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                key: const Key('Key-ModalHeaderTextWidgets-Header'),
                header,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                key: const Key('Key-ModalHeaderTextWidgets-CloseIcon'),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Divider(
          height: 1,
          thickness: 1,
          color: dividerColor,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
