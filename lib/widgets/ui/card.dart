import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;

  const CustomCard({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.all(8),
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Theme.of(context).dividerColor,
        ),
      ),
      child: child,
    );
  }
}

class CardHeader extends StatelessWidget {
  final Widget child;
  const CardHeader({super.key, required this.child});
  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.all(12), child: child);
}

class CardTitle extends StatelessWidget {
  final String text;
  const CardTitle({super.key, required this.text});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
  );
}

class CardDescription extends StatelessWidget {
  final String text;
  const CardDescription({super.key, required this.text});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: Theme.of(context).hintColor),
  );
}

class CardContent extends StatelessWidget {
  final Widget child;
  const CardContent({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
    child: child,
  );
}

class CardFooter extends StatelessWidget {
  final Widget child;
  const CardFooter({super.key, required this.child});
  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.all(12), child: child);
}
