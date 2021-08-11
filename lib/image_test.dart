import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            _url!,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
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
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                color: Colors.amber,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  _url == _beachUrl
                      ? 'Vamos para o rio!'
                      : 'Vamos para a praia!',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
