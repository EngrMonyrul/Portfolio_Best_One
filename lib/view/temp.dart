class _HomeScreenState extends State<HomeScreen> {
  Future<List<String>> _getImageUrls() async {
    final ListResult result = await FirebaseStorage.instance.ref().child('bgimg').listAll();
    final List<String> imageUrls = result.items.map((ref) => ref.fullPath).toList();
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: _getImageUrls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Center(child: Text('No images available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final imageUrl = snapshot.data[index];
                return FutureBuilder<Widget>(
                  future: _getImageWidget(imageUrl),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return snapshot.data ?? Container();
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<Widget> _getImageWidget(String imageUrl) async {
    final Reference ref = FirebaseStorage.instance.ref().child(imageUrl);
    final String url = await ref.getDownloadURL();

    return Image(
      image: CachedNetworkImageProvider(url),
      fit: BoxFit.contain,
    );
  }
}
