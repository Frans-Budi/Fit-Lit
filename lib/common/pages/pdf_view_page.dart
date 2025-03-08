import 'package:fit_lit/common/controllers/pdf_view_controller.dart';
import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/appbar/simple_app_bar.dart';
import 'package:fit_lit/common/widgets/skelton/skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class PdfViewPage extends StatelessWidget {
  final String title = Get.arguments['title'];
  final controller = Get.put(PdfViewController());

  PdfViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizes.s16.toVerticalSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
            child: Text(
              title,
              style: TextStyles.titlePage(),
            ),
          ),
          AppSizes.s8.toVerticalSpace(),
          Expanded(child: Obx(() => _buildContent())),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (controller.isLoading.value) {
      return const Skelton(
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (controller.errorMessage.value != null) {
      return Center(
        child: Text(
          "Error: ${controller.errorMessage.value}",
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    return controller.filePath.value != null
        ? PDFView(
            filePath: controller.filePath.value,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            backgroundColor: Colors.white,
            onError: (error) {
              controller.errorMessage.value = error.toString();
            },
            onPageError: (page, error) {
              controller.errorMessage.value = "Page $page error: $error";
            },
          )
        : const Center(child: Text("No PDF file found."));
  }
}
