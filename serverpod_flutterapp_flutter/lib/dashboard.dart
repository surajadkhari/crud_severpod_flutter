import 'package:flutter/material.dart';
import 'package:serverpod_flutterapp_flutter/main.dart';
import 'package:serverpod_flutterapp_client/serverpod_flutterapp_client.dart';
import 'package:serverpod_flutterapp_flutter/utils/custom_snackbar.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoModel>? todoList;
  //  late TextEditingController firstNameController;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  final _formKey = GlobalKey<FormState>();
  getData() async {
    final List<TodoModel> response = await apiTodo.getAllUser();

    setState(() {
      todoList = response;
    });
  }

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    titleController.dispose();

    super.dispose();
  }

  createTodo() async {
    TodoModel todo = TodoModel(
        description: descriptionController.text,
        title: titleController.text,
        isCompleted: false);
    await apiTodo.createTodo(todo);
    await getData();
    if (context.mounted) {
      showSnackbarW(
          context: context, message: "Created Sucessfuly", isError: false);
    }
    descriptionController.clear();
    titleController.clear();

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  deleteTodo(int? id) async {
    await apiTodo.delete(id ?? 0);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Deleted Sucessfully",
        ),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      ));
    }
    await getData();
  }

  updateTodo(int? id) async {
    TodoModel todo = TodoModel(
        id: id,
        description: descriptionController.text,
        title: titleController.text,
        isCompleted: false);
    await apiTodo.update(todo);
    await getData();
    if (context.mounted) {
      showSnackbarW(
          context: context, message: "Updated Sucessfuly", isError: false);
    }

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Text("Add"),
          onPressed: () {
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                transitionBuilder: (context, a1, a2, widget) {
                  return ScaleTransition(
                      scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                      child: FadeTransition(
                        opacity:
                            Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                        child: Form(
                          key: _formKey,
                          child: AlertDialog(
                            content: SizedBox(
                                height: 300,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Add new Task',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter title";
                                        }
                                        return null;
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: titleController,
                                      decoration: const InputDecoration(
                                          fillColor: Color(0xffF0F1F1),
                                          filled: true,
                                          border: InputBorder.none,
                                          hintText: "title"),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter description";
                                        }
                                        return null;
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Close",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          ElevatedButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  createTodo();
                                                }
                                              },
                                              child: const Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
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
            // }
          }),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: todoList == null
          ? const CircularProgressIndicator.adaptive()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                const Text("Todo"),
                ...todoList!.map(
                  (e) => Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    // height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                e.description,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showGeneralDialog(
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      transitionBuilder:
                                          (context, a1, a2, widget) {
                                        return ScaleTransition(
                                            scale: Tween<double>(
                                                    begin: 0.5, end: 1.0)
                                                .animate(a1),
                                            child: FadeTransition(
                                              opacity: Tween<double>(
                                                      begin: 0.5, end: 1.0)
                                                  .animate(a1),
                                              child: AlertDialog(
                                                content: SizedBox(
                                                    height: 300,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          'Update Task  Task',
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              titleController,
                                                          decoration: InputDecoration(
                                                              fillColor:
                                                                  const Color(
                                                                      0xffF0F1F1),
                                                              filled: true,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  e.title),
                                                        ),
                                                        TextFormField(
                                                          maxLines: 3,
                                                          controller:
                                                              descriptionController,
                                                          decoration: InputDecoration(
                                                              fillColor:
                                                                  const Color(
                                                                      0xffF0F1F1),
                                                              filled: true,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText: e
                                                                  .description),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    "Close",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                              ElevatedButton(
                                                                  onPressed: () =>
                                                                      updateTodo(
                                                                          e.id),
                                                                  child:
                                                                      const Text(
                                                                    "Add",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ));
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      context: context,
                                      pageBuilder:
                                          (context, animation1, animation2) {
                                        return Container();
                                      });
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () => deleteTodo(e.id),
                                icon:
                                    const Icon(Icons.delete_outline_outlined)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}
