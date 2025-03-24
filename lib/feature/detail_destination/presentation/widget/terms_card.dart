import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/feature/home/model/place.dart';
import 'package:wizh/feature/home/model/terms.dart';

class TermsCard extends StatefulWidget {
  final Place destination;

  const TermsCard({super.key, required this.destination});

  @override
  State<TermsCard> createState() => _TermsCardState();
}

class _TermsCardState extends State<TermsCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppSpacing.m),
        boxShadow: const [
          BoxShadow(
            color: AppColor.shadowBlack,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.gavel, size: 12, color: AppColor.red),
              const SizedBox(width: AppSpacing.xs),
              Flexible(
                child: Text(
                  "Terms and Condition",
                  style: AppTextStyle.instance.titleSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    terms,
                    style: AppTextStyle.instance.bodySmall,
                    maxLines: _isExpanded ? null : 2,
                    overflow: _isExpanded ? null : TextOverflow.ellipsis,
                  ),
                  if (!_isExpanded || _isTextOverflowing(constraints))
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _isExpanded ? "Show less" : "Read more",
                          style: AppTextStyle.instance.bodySmall.copyWith(
                            color: AppColor.red,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.s),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(icon: Icons.credit_card_off, text: "No Refund"),
              SizedBox(width: AppSpacing.m),
              InfoRow(icon: Icons.group, text: "Group Tour"),
              SizedBox(width: AppSpacing.m),
              InfoRow(icon: Icons.calendar_month, text: "7 days in advance reservation"),
            ],
          ),
        ],
      ),
    );
  }

  bool _isTextOverflowing(BoxConstraints constraints) {
    final span = TextSpan(
      text:terms,
      style: AppTextStyle.instance.bodyMedium,
    );
    final tp = TextPainter(
      text: span,
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: constraints.maxWidth);
    return tp.didExceedMaxLines;
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColor.red),
        const SizedBox(width: AppSpacing.xs),
        Flexible(
          child: Text(
            text,
            style: AppTextStyle.instance.bodySupperSmall,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}