import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollScreen extends ConsumerStatefulWidget {
  const ScrollScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends ConsumerState<ScrollScreen> {
  List<int> items = [
    0,
    2,
    4,
    5,
    6,
    7,
    8,
    9,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    1,
    2,
    3,
    4,
    5,
    6,
  ];
  int iterator = 0;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  Future<void> _load() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    final newItems = List.generate(2, (index) => iterator * 2 + index);
    setState(() {
      iterator++;
      items.addAll(newItems);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onInfinitive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + (isLoading ? 1 : 0),
        itemBuilder: (con, index) {
          if (index >= items.length) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return ListTile(title: Text("Item: ${items[index]}"));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onInfinitive() async {
    if (_scrollController.position.maxScrollExtent - 20 <
        _scrollController.offset) {
      await _load();
    }
    print(_scrollController.offset);
    // print(_scrollController.position);
    print(_scrollController.position.maxScrollExtent);
  }
}
