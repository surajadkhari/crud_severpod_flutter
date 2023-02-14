import 'package:flutter/material.dart';

customDialog(
    {required String title,
    required BuildContext context,
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required Function()? onPressed}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                content: SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              fillColor: Color(0xffF0F1F1),
                              filled: true,
                              border: InputBorder.none,
                              hintText: "title"),
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              fillColor: Color(0xffF0F1F1),
                              filled: true,
                              border: InputBorder.none,
                              hintText: "Description"),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Close",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              ElevatedButton(
                                  onPressed: onPressed,
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ));
      },
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
