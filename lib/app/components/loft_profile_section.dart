import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSectionItem {
  const ProfileSectionItem({
    required this.title,
    this.onTap,
  });

  final String title;
  final Function()? onTap;
}

class LoftProfileSection extends StatelessWidget {
  const LoftProfileSection({
    required this.label,
    required this.items,
    super.key,
  });

  final String label;
  final List<ProfileSectionItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8.0),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.0,
                ),
          ),
          const SizedBox(height: 8.0),
          ...items.map(
            (profileItem) => Column(
              children: [
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      profileItem.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.grey.shade600,
                      size: 18.0,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Divider(color: Colors.grey)
              ],
            ),
          )
        ],
      ),
    );
  }
}
