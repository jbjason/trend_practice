import 'package:flutter/material.dart';

class YoutubeChipScreen extends StatefulWidget {
  const YoutubeChipScreen({Key? key}) : super(key: key);
  @override
  State<YoutubeChipScreen> createState() => _YoutubeChipScreenState();
}

class _YoutubeChipScreenState extends State<YoutubeChipScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final List<String> _items = ['jb jason'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: size.width, color: Colors.purple, height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => focusNode.requestFocus(),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  isFocused: focusNode.hasFocus,
                  child: Wrap(
                    spacing: 10, // mainAxis spacing
                    runSpacing: 15, // crossAxis spacing
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ..._items.map(
                        (e) => Chip(
                          label: Text(e),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () => setState(() => _items.remove(e)),
                        ),
                      ),
                      const SizedBox(width: 40),
                      EditableText(
                        controller: controller,
                        focusNode: focusNode,
                        backgroundCursorColor: Colors.white,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.done,
                        maxLines: null,
                        forceLine: false,
                        cursorHeight: 25,
                        onSubmitted: (value) {
                          final val = value.trim();
                          if (val.isEmpty) return;
                          _items.add(val);
                          controller.clear();
                          setState(() {});
                        },
                        onChanged: (value) {
                          final val = value.trim();
                          if (val.isEmpty || val[0] == ',') return;
                          if (val[val.length - 1] != ',') return;
                          final item = val.substring(0, val.length - 1);
                          _items.add(item);
                          controller.clear();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
