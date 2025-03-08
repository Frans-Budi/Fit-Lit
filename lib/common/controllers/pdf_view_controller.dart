import 'package:fit_lit/common/services/my_storage.dart';
import 'package:get/get.dart';

class PdfViewController extends GetxController {
  final String pdfName = Get.arguments['pdf_name'];

  RxBool isLoading = true.obs;
  RxnString errorMessage = RxnString();
  RxnString filePath = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      final url = await MyStorage.getPdfUrl(pdfName);
      if (url == null) return;
      final file = await MyStorage.downloadFile(url, pdfName);

      if (file != null) {
        filePath.value = file.path;
      } else {
        throw Exception("Failed to download PDF file.");
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
