import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data'; // Uint8List를 위한 import
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JellyfishClassifier(),
    );
  }
}

class JellyfishClassifier extends StatefulWidget {
  @override
  _JellyfishClassifierState createState() => _JellyfishClassifierState();
}

class _JellyfishClassifierState extends State<JellyfishClassifier> {
  Uint8List? _imageData;
  final picker = ImagePicker();
  String? _label;
  double? _probability;

  final String apiUrl =
      "https://7a74-1-237-108-192.ngrok-free.app/"; // ngrok URL 사용

  // 이미지 선택 함수 (웹 지원)
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageData = await pickedFile.readAsBytes(); // 웹에서 파일을 메모리로 읽음
      setState(() {
        _imageData = imageData;
      });
    }
  }

  // 서버에 이미지 전송 및 예측 요청 함수
  Future<void> _classifyImage() async {
    if (_imageData == null) return;
    try {
      FormData formData = FormData.fromMap({
        "file": MultipartFile.fromBytes(_imageData!, filename: "jellyfish.jpg"),
      });

      Dio dio = Dio();
      final response = await dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        final result = response.data;
        setState(() {
          _label = result['label'];
          _probability = result['probability'];
        });
        print(
            "예측 결과: $_label, 확률: ${(_probability! * 100).toStringAsFixed(2)}%");
      }
    } catch (e) {
      print("예측 요청 실패: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.bubble_chart),
            SizedBox(width: 10),
            Text('Jellyfish Classifier'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 이미지 표시 영역 (웹 지원을 위해 Image.memory 사용)
            _imageData == null
                ? Text('No image selected.')
                : Image.memory(_imageData!, width: 300, height: 300),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 이미지 선택 버튼
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Icon(Icons.image),
                ),
                SizedBox(width: 20),
                // 예측 요청 버튼
                ElevatedButton(
                  onPressed: _classifyImage,
                  child: Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(height: 20),
            // 예측 결과 표시
            if (_label != null && _probability != null)
              Text(
                '예측 결과: $_label\n확률: ${(_probability! * 100).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

// 회고
// 처음 실행하였을 때, 이미지를 선택하여 불러들이는 과정부터 에러가 발생하였는데
// 웹상에서 이미지를 읽으려면 추가적으로 작업이 필요하다는 것을 알게되었다.
// 예측한 결과를 요청하는 단계부터 성공하지 못하였다.
// 모델 학습과 관련된 부분은 추후 시도해 보아야 할 것 같다.ㅠㅠ
