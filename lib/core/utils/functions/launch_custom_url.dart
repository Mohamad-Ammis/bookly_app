import 'dart:developer';

import 'package:bookly_app/core/utils/functions/custim_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(BuildContext context, String? url) async {
  if (url != null) {
    try {
      final Uri _url = Uri.parse(url);
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url, mode: LaunchMode.externalApplication);
      } else {
        showCustomSnackbar(context, "Cant Launch Url");
      }
    } on Exception catch (e) {
      log('Could not launch $e');
      showCustomSnackbar(context, "Cant Launch Url");
    }
  }
}
