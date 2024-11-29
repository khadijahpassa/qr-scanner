import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_scanner/consts.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrRawValue;
  Uint8List? qrImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        actions: [
          IconButton(
            onPressed: (){
              // hapus dan menggantikan screen
              Navigator.popAndPushNamed(context, "/scanner");
            },
            icon: const Icon(Icons.qr_code_scanner_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            // mainAxisSize mirip sama Expanded, memenuhi lebar layar sesuai mainAxis
            mainAxisSize: MainAxisSize.max,
            // jarak sebelum dan sesudah widget
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_qr.png', height: 80,),
              const Text(
                'Generator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                // nyimpen raw yang diinput
                onSubmitted: (value) {
                  setState(() {
                    qrRawValue = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Insert text, URL, or data',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Mengatur qrRawValue jika diinput melalui tombol
                  setState(() {
                    qrRawValue = qrRawValue ?? '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )
                ),
                child: const Text('Generate to QR Code'),
              ),
              const SizedBox(height: 20),
              // 1 line tanpa ? & : karena ngga ada kondisi false
              // if (qrRawValue != null) PrettyQrView.data(data: qrRawValue!)
              if (qrRawValue != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 260,
                  height: 260,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: textColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PrettyQrView.data(data: qrRawValue!),
                ),
              ),
        
              ElevatedButton.icon(
                    onPressed: (){
                      Share.share(qrRawValue!);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEEF6FF),
                      foregroundColor: textColor
                    ),
                    label: const Text('Share'),
                    icon: const Icon(Icons.share),
                  ),
        
              
        
          ]),
          
        ),
      ),
    );
  }
}