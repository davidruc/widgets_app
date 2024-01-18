import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});
  static const name = "infinite_screen";

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));

    addNewNumbers();
    isLoading = false;

    if (!isMounted) return;
   
    setState(() {});
     moveScrollToBottom();
  }
  
  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    if( !isMounted ) return;
    isLoading = false;
    final lastId = imagesIds.last;
    
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addNewNumbers();
    setState(() {});
   
  }

  void moveScrollToBottom(){
    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn);
  }

  void addNewNumbers() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("InfiniteScroll"),
      // ),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          // opciones de personalizacion del boton de carga
          edgeOffset: 10,
          strokeWidth: 2,

          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(0),
            itemCount: imagesIds.length,
            itemBuilder: (context,int index) {
              return FadeInImage(
                fit: BoxFit.contain,
                width: double.infinity,
                placeholder: const AssetImage("assets/images/jar-loading.gif"),
                image: NetworkImage(
                    "https://picsum.photos/id/${imagesIds[index]}/500/300"),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: (isLoading)
            ? const CircularProgressIndicator()
            : FadeIn(child: const Icon(Icons.arrow_back_ios_outlined)),
      ),
    );
  }
}
