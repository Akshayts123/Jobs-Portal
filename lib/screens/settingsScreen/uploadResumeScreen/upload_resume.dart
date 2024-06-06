import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/widgets/custom_appbar.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/header.dart';
import 'package:job_portal/utils/show_snackbar.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';

class UploadResumeScreen extends StatefulWidget {
  const UploadResumeScreen({super.key});

  @override
  State<UploadResumeScreen> createState() => _UploadResumeScreenState();
}

class _UploadResumeScreenState extends State<UploadResumeScreen> {
  var selectedPdf = '';
  var uploadedCv = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        children: [
          header("Upload Resume/pdf"),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: InkWell(
              onTap: () async {
                FilePickerResult? file = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: [
                    "pdf",
                  ],
                  allowMultiple: false,
                );
                print(':::::: pdf :::::: ' + file!.paths[0].toString());
                if (file != null) {
                  setState(() {
                    selectedPdf = file.paths[0].toString();
                  });
                }
              },
              child: Stack(
                children: [
                  Container(
                    color: shadowGrey,
                    width: width(context),
                    height: 100,
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(
                          20,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: selectedPdf == ''
                              ? Icon(
                                  Icons.cloud_upload_outlined,
                                  size: 40,
                                )
                              : SizedBox(
                                  width: width(context) * .6,
                                  child: Text(
                                    selectedPdf.split('/').last,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                        )),
                  ),
                  selectedPdf != ''
                      ? Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedPdf = '';
                              });
                            },
                            child: Icon(
                              Icons.delete,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          "0,0,15,15".padding(
            customButtonWidget(
              context,
              () {
                if (selectedPdf == '') {
                  showSnackBar(
                    context,
                    "Please pick a resume you want to upload!.",
                  );
                  return;
                }
                setState(() {
                  uploadedCv.add(selectedPdf);
                });
                showSnackBar(
                  context,
                  "Resume uploaded successfully!.",
                  color: redColor,
                );
                print(selectedPdf);
              },
              title: "Upload",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(),
          header("Your CVs"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: uploadedCv.isEmpty ? 1 : uploadedCv.length,
            itemBuilder: (context, index) {
              if (uploadedCv.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "assets/images/no-image.jpg",
                    // width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                );
              }
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                height: 80,
                width: width(context),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(
                            5,
                          ),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: Text("pdf"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: width(context) * .7,
                          child: Text(
                            uploadedCv[index],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            setState(() {
                              uploadedCv.remove(uploadedCv[index]);
                            });
                          });
                        },
                        child: Icon(
                          Icons.delete,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
