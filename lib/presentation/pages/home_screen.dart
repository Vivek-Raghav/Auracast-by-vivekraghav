import 'package:advanceweatherapp/gen/assets.gen.dart';
import 'package:advanceweatherapp/presentation/home_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.homeBackground.provider(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(children: [
              Container(
                height: size.height * 0.3,
              ),
              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Assets.images.house.provider(),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ])
          ],
        ));
  }
}
