import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/screens/getOneJob/get_one_job.dart';
import 'package:job_portal/utils/show_snackbar.dart';
import 'package:job_portal/utils/theme.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrcodeScannerScreen extends StatefulWidget {
  static const String routeName = 'QrcodeScannerScreen';
  const QrcodeScannerScreen({super.key});

  @override
  State<QrcodeScannerScreen> createState() => _QrcodeScannerScreenState();
}

class _QrcodeScannerScreenState extends State<QrcodeScannerScreen> {
  final qrKey = GlobalKey(debugLabel: "Qr");

  late QRViewController controller;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      await controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  bool isFlash = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () async {
              await controller.toggleFlash();
              setState(() {
                isFlash = !isFlash;
              });
            },
            child: Icon(
              isFlash ? Icons.flash_on_rounded : Icons.flash_off_rounded,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: Container(
        child: QRView(
          key: qrKey,
          onQRViewCreated: (controller) {
            setState(() => this.controller = controller);
            controller.resumeCamera();
            controller.scannedDataStream.listen(
              (event) {
                bool isEmployee = false;
                if (event.code!.contains('jobPost')) {
                  isEmployee = false;
                } else if (event.code!.contains('companyPost')) {
                  isEmployee = true;
                } else {
                  showSnackBar(
                    context,
                    "Oops!. Invalid qr code.",
                  );
                  return;
                }
                controller.dispose();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GetOneJob(
                      isEmployee: isEmployee,
                    ),
                  ),
                );
                print(event.code.toString());
              },
            );
          },
          overlay: QrScannerOverlayShape(
            cutOutSize: width(context) * .8,
            // borderColor: primaryLight,
            borderRadius: 20,
            borderWidth: 10,
          ),
        ),
      ),
    );
  }
}
