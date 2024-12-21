import 'package:alura_flutter/components/app_header.dart';
import 'package:alura_flutter/components/task.dart';
import 'package:alura_flutter/data/waifu_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppHeader(context),
      body: const FormBody(),
      backgroundColor: Colors.black,
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody({super.key});

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final nameController = TextEditingController();

  final difficultyController = TextEditingController();

  final imageController = TextEditingController();

  var imagePreview = "https://t4.ftcdn.net/jpg/06/71/92/37/no-photo.jpg";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    imageController.addListener(() {
      setState(() {
        imagePreview = imageController.value.text.isNotEmpty
            ? imageController.value.text
            : "https://t4.ftcdn.net/jpg/06/71/92/37/no-photo.jpg";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            height: 700,
            decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red.shade700, width: 3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.network(
                        imagePreview,
                        errorBuilder: (BuildContext buildContext,
                            Object execption, StackTrace? stack) {
                          return Image.asset(
                            "lib/assets/images/no-photo.jpg",
                            width: 225,
                            height: 225,
                          );
                        },
                        fit: BoxFit.cover,
                        width: 225,
                        height: 225,
                      )),
                ),
                Input(
                  placeholder: "Nome",
                  controller: nameController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor, insira um nome.";
                    }
                    return null;
                  },
                ),
                Input(
                  placeholder: "Dificuldade",
                  controller: difficultyController,
                  type: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor, insira uma dificuldade.";
                    }
                    var intValue = int.parse(value!);
                    if (intValue > 5 || intValue < 1) {
                      return "Por favor, insira um número de 1 a 5.";
                    }
                    return null;
                  },
                ),
                Input(
                  placeholder: "Imagem",
                  controller: imageController,
                  type: TextInputType.url,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor, insira uma imagem.";
                    }
                    if (Uri
                        .tryParse(value!)
                        ?.hasAbsolutePath != true) {
                      return "Por favor, insira uma URL válida.";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Map<String, Object> newWaifu = {
                      "url": imageController.text,
                      "title": nameController.text,
                      "rating": int.parse(difficultyController.text),
                    };

                    if (_formKey.currentState!.validate()) {
                        WaifuInherited.of(context).updateList(newWaifu as Waifu);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Waifu cadastrada com sucesso"
                          )
                      ));
                      Navigator.pushNamed(context, "/");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  child: const Text("Salvar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?) validator;

  const Input({
    required this.validator,
    required this.type,
    required this.placeholder,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: placeholder,
            fillColor: Colors.white54,
            filled: true,
            errorStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
      ),
    );
  }
}
