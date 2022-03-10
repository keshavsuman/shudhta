part of shudhta;

class Advertisements extends StatelessWidget {
  final List<Advertisement> advertisements;
  Advertisements({required this.advertisements});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: false,
              height: 200.0,
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1),
          items: advertisements.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    clipBehavior: Clip.hardEdge,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.network(i.imageUrl, fit: BoxFit.cover));
              },
            );
          }).toList(),
        ));
  }
}
