import 'package:flutter/material.dart';

class ImageTest extends StatefulWidget {
  const ImageTest({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageTest> createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  final _beachUrl =
      'https://spguia.melhoresdestinos.com.br/system/fotos_local/fotos/44277/show/praia-do-frances.jpg';

  final _riverUrl =
      'https://upload.wikimedia.org/wikipedia/commons/6/6f/Canindé_de_São_Francisco-002.jpg';

  String? _url;

  @override
  void initState() {
    super.initState();
    // vamos primeiro visitar a praia :]
    _url = _beachUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Test',
        ),
      ),
      body: Column(
        children: [
          Image.network(
            _url!,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (_url == _beachUrl) {
                  _url = _riverUrl;
                } else {
                  _url = _beachUrl;
                }
              });
            },
            child: Text(
              _url == _beachUrl ? 'Vamos para o rio!' : 'Vamos para a praia!',
            ),
          ),
        ],
      ),
    );
  }
}
