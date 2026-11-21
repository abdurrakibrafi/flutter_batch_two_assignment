import 'package:flutter/material.dart';
import '../../../constant/app_colors.dart';
import '../../task_view/model/task_model.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final TaskStatus? status;
  final VoidCallback? onDelete;
  final bool isDeleting;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    this.status,
    this.onDelete,
    this.isDeleting = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isDeleting ? 0.5 : 1,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage("assets/images/backgroundImage.png"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/task_frame.png',
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(width: 12),
                  if (status != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _StatusBadge(status: status!),
                    ),
                  const Spacer(),
                  if (onDelete != null)
                    isDeleting
                        ? const Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        : Material(
                            color: Colors.white,
                            shape: const CircleBorder(),
                            child: IconButton(
                              tooltip: 'Delete task',
                              onPressed: onDelete,
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                                size: 22,
                              ),
                            ),
                          ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (description.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final TaskStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: status.color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: status.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: status.color,
            ),
          ),
        ],
      ),
    );
  }
}
