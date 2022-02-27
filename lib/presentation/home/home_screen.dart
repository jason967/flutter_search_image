import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:image_search/presentation/home/widgets/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    //약간의 딜레이를 줘야 함
    Future.microtask(() {
      //init 에서는 watch를 사용하면 안 됨
      final viewModel = context.read<HomeViewModel>();
      _subscription = viewModel.eventStream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = PhotoProvider.of(context).viewModel;
    //old version
    // final viewModel = Provider.of<HomeViewModel>(context);
    //new version
    final viewModel = context.watch<HomeViewModel>();
    //watch-> 변동 사항에 대해서 계속해서 모니터링

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    viewModel.fetch(_textController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: viewModel.photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final photo = viewModel.photos[index];
                  return PhotoWidget(
                    photo: photo,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
