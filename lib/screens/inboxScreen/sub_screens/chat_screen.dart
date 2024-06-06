import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/commons/constants.dart';
import 'package:job_portal/commons/screens/image_preview.dart';
import 'package:job_portal/commons/widgets/custom_button_widget.dart';
import 'package:job_portal/commons/widgets/custom_image_network.dart';
import 'package:job_portal/commons/widgets/text_field.dart';
import 'package:job_portal/dummy.dart';
import 'package:job_portal/utils/sizables.dart';
import 'package:job_portal/utils/theme.dart';
import 'package:open_file/open_file.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "chatScreen";
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  List<Messages> messages = [
    Messages(
      isme: true,
      text: "I am interested in this job.",
    ),
    Messages(
      isme: false,
      text: "hello mr.Aravind",
    ),
    Messages(
      isme: false,
      text: "we are happy to have you as a senior flutter dev.",
    ),
    Messages(
      isme: true,
      text: "I'm glad to hear that.",
    ),
    Messages(
        isme: false,
        filePath: "https://i.pinimg.com/564x/0d/cf/b5/0dcfb548989afdf22afff75e2a46a508.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Chat"),
        flexibleSpace: FlexibleSpaceBar(
          // expandedTitleScale: 1,
          // title: Text('IDEALS'),
          background: Container(
            decoration: BoxDecoration(
              gradient: appGradient,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            100,
          ),
          child: Column(
            children: [
              Text(
                "Senior Ui/Ux Designer",
                style: fontSize.headline6(
                  context,
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "San Francisco - USA",
                style: fontSize.titleSmall(
                  context,
                  color: lightblackColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              shrinkWrap: true,
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msgs = messages.reversed.toList();
                return MessageWidget(
                  context,
                  message: msgs[index].text ?? '',
                  isme: msgs[index].isme ?? false,
                  filePath: msgs[index].filePath,
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: whiteColor,
            ),
            width: 500,
            child: "0,0,10,18".padding(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  customTextField(
                    _messageController,
                    isRadius: false,
                    isShadow: false,
                    labelText: "",
                    hintText: "enter message",
                    maxLength: 200,
                    maxLines: 10,
                    minLines: 1,
                    islabel: true,
                    height: null,
                    width: width(context) * .65,
                  ),
                  "0,12,0,0".padding(
                    SizedBox(
                      width: width(context) * .25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              FilePickerResult? file = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  "png",
                                  "jpg",
                                  "jpeg",
                                  "pdf",
                                ],
                                allowMultiple: false,
                              );
                              if (file != null) {
                                final msgCls = Messages(
                                  isme: true,
                                  filePath: file.paths[0],
                                );
                                setState(() {
                                  messages.add(msgCls);
                                });
                              }
                              print(file?.paths[0].toString().split('.').last.toString() == 'pdf');
                              print('gallery');
                            },
                            child: const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 30,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _messageController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                              print(_messageController.text);
                              print('send message');
                            },
                            child: const Icon(
                              Icons.send,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget MessageWidget(
  BuildContext context, {
  required String message,
  required bool isme,
  String? filePath,
}) {
  print(filePath);
  return Container(
    constraints: BoxConstraints(
      maxWidth: width(context) * .6,
    ),
    margin: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    // padding: const EdgeInsets.symmetric(
    //   horizontal: 10,
    //   vertical: 10,
    // ),

    child: InkWell(
      onTap: () {
        print('clicked');
        final file = filePath?.contains("https") == true
            ? 'network'
            : filePath?.contains("pdf") == true
                ? 'pdf'
                : "file";
        print(file);

        file != 'pdf'
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImagePreviewScreen(image: filePath ?? ''),
                ),
              )
            : OpenFile.open(
                filePath,
              );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isme ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: isme ? shadowGrey : primaryLight,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                filePath == null
                    ? Text(
                        message,
                        style: fontSize.bodyMedium(
                          context,
                          color: isme ? blackColor : shadowGrey,
                        ),
                      )
                    : filePath.contains("https://")
                        ? customNetworkImage(
                            filePath,
                            150,
                          )
                        : !filePath.contains('.pdf')
                            ? Image.file(
                                File(filePath),
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            : Row(
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
                                      filePath.split('/').last,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                Text(
                  "10:14 thursday",
                  style: fontSize.bodySmall(
                    context,
                    color: isme ? blackColor : shadowGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
