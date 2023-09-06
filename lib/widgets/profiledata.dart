import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String value;
  VoidCallback? callback;
  ProfileTile({required this.title, required this.value, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ]),
      ),
    );
  }
}
