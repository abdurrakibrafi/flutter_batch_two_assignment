import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../utils/custom_loader.dart';
import '../../utils/html_view.dart';
import 'controller/legal_controller.dart';

class LegalView extends StatefulWidget {
  final String title;
  final String apiUrl;

  const LegalView({super.key, required this.title, required this.apiUrl});

  @override
  State<LegalView> createState() => _LegalViewState();
}

class _LegalViewState extends State<LegalView> {
  final LegalController controller = Get.put(LegalController());

  @override
  void initState() {
    super.initState();
    controller.fetchLegalContent(widget.apiUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
            size: 18,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CustomLoader());
        }

        final legalData = controller.legalData.value.data;

        if (legalData == null) {
          return const Center(child: Text("No data available."));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: HTMLView(htmlData: legalData.html ?? legalData.content ?? ""),
        );
      }),
    );
  }
}
