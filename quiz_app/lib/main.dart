import 'package:flutter/material.dart';
import 'answer.dart';
import 'enum_list.dart';
import 'question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int quizNumber = 1;

  ChangeScreenEnum screen = ChangeScreenEnum.homeScreen;

  List listquestion = [
    Question('Nơi nào con trai có thể sinh con?', 2),
    Question('Con trai và đàn ong có điểm gì khác nhau?', 3),
    Question('Con đường dài nhất là đường nào?', 3),
    Question(
        '2 con vịt đi trước 2 con vịt, 2 con vịt đi sau 2 con vịt, 2 con vịt đi giữa 2 con vịt. Hỏi có mấy con vịt?',
        3),
    Question('Con gì đầu dê mình ốc?', 4),
    Question('Bỏ ngoài nướng trong, ăn ngoài bỏ trong là gì?', 2),
    Question('Cái gì của chồng mà vợ thích cầm nhất?', 1),
    Question('Sở thú bị cháy, con gì chạy ra đầu tiên?', 3),
    Question(
        'Làm thế nào để không đụng phải ngón tay khi bạn đập búa vào một cái móng tay?',
        1),
    Question('Trên nhấp dưới giật là đang làm gì?', 3),
  ];

  List listAnswer = [
    Answer('Trong Nhà', 'Dưới Nước', 'Rừng Rậm', 'Đáp Án Khác'),
    Answer('Số Tuổi', 'Chiều Cao', 'Nơi ở', 'Địa Vị'),
    Answer('Đường Đi', 'Đường Đèo', 'Đường Đời', 'Đường Đi Nước Ngoài'),
    Answer('12 con vịt', '6 con vịt', '4 con vịt', '7 con vịt'),
    Answer('Con Ốc', 'Con Đường', 'Con Mương', 'Con Dốc'),
    Answer('Khoai', 'Bắp Ngô', 'Carot', 'Trứng'),
    Answer('Tiền', 'Sách', 'Tay', 'Nhẫn'),
    Answer('Con Hổ', 'Con Voi', 'Con Người', 'Con Chim'),
    Answer('Cầm búa bằng cả 2 tay', 'Cầm búa bằng tay trái',
        'Cầm búa bằng tay phải', 'Cầm báu bằng chân'),
    Answer('Chơi Bóng Bàn', 'Trộm Cắp', 'Câu Cá', 'Đang Học'),
  ];

  String question = '';
  int answer = 0;
  int score = 0;

  // Change screen
  void _changScreen(int ans) {
    setState(() {
      if (screen == ChangeScreenEnum.homeScreen) {
        screen = ChangeScreenEnum.quizzScreen;
      } else if (screen == ChangeScreenEnum.quizzScreen) {
        if (quizNumber == 10) {
          screen = ChangeScreenEnum.endScreen;
        }
        if (ans == listquestion[answer].correcAnswer) {
          score++;
        }
        answer++;
        quizNumber++;
      } else if (screen == ChangeScreenEnum.endScreen) {
        screen = ChangeScreenEnum.homeScreen;
        answer = 0;
        quizNumber = 1;
        score = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (screen == ChangeScreenEnum.homeScreen) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('Bắt đầu'),
                      onPressed: () {
                        _changScreen(0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ) // This trailing comma makes auto-formatting nicer for build methods.
          );
    } else if (screen == ChangeScreenEnum.quizzScreen) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.purple,
                      ),
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Câu đố số $quizNumber : ${listquestion[answer].question}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Container(
                    width: 250,
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black),
                      ),
                      child: Text(
                        '${listAnswer[answer].A}',
                        style: TextStyle(color: Colors.yellow.withOpacity(1.0)),
                      ),
                      onPressed: () {
                        _changScreen(1);
                      },
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.green),
                      ),
                      child: Text(
                        '${listAnswer[answer].B}',
                        style: TextStyle(color: Colors.orange.withOpacity(1.0)),
                      ),
                      onPressed: () {
                        _changScreen(2);
                      },
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.yellow),
                      ),
                      child: Text(
                        '${listAnswer[answer].C}',
                        style:
                            TextStyle(color: Colors.blueGrey.withOpacity(1.0)),
                      ),
                      onPressed: () {
                        _changScreen(3);
                      },
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.lightBlue),
                      ),
                      child: Text(
                        '${listAnswer[answer].D}',
                        style: TextStyle(color: Colors.white.withOpacity(1.0)),
                      ),
                      onPressed: () {
                        _changScreen(4);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ) // This trailing comma makes auto-formatting nicer for build methods.
          );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Điểm của bạn là $score/10',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('Chơi lại'),
                      onPressed: () {
                        _changScreen(0);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ) // This trailing comma makes auto-formatting nicer for build methods.
          );
    }
  }
}
