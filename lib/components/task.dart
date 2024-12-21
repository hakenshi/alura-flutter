import 'package:flutter/material.dart';
import 'package:alura_flutter/components/difficulty.dart';

class Waifu extends StatefulWidget {
  final String title;
  final String url;

  final int rating;
  // final int index;

  const Waifu(
      {super.key,
      required this.title,
      required this.rating,
      // required this.index,
      required this.url});

  @override
  State<Waifu> createState() => _WaifuState();
}

class _WaifuState extends State<Waifu> {
  int _nivel = 0;
  bool _isCompleted = false;

  void aumentarNivel() {
    setState(() {
      _nivel++;
      var max = (widget.rating > 1) ? (widget.rating * 10) : 10;
      if (_nivel > max) {
        _isCompleted = true;
        _nivel = max.ceil().toInt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: _isCompleted ? Colors.green : Colors.red.shade800,
                borderRadius: BorderRadius.circular(5)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.black45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(5))),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5)),
                        child: Image.network(
                          widget.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(widget.title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis))),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Difficulty(
                            rating: widget.rating,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _isCompleted ? null : aumentarNivel();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              !_isCompleted ? Colors.red.shade700 : Colors.green,
                        ),
                        child: const Icon(Icons.plus_one),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.red,
                          value: (widget.rating > 0)
                              ? (_nivel / widget.rating) / 10
                              : 1,
                        )
                    ),
                    Text("Nível $_nivel",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis)
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
