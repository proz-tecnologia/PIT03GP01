import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/homepage/homepage.dart';

class Onboarding extends StatefulWidget {
  static String route = "Onboarding";

  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;

  int _pageIndex = 0;
  bool isLastPage = false;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                      isLastPage = index == 2;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: demoData[index].image,
                    title: demoData[index].title,
                    description: demoData[index].description,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ...List.generate(
                        demoData.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: DotIndicator(
                                isActive: index == _pageIndex,
                              ),
                            )),
                    const Spacer(),
                    TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, HomePage.route),
                        child: Text(
                          "Pular",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        )),
                    const Spacer(),
                    isLastPage
                        ? SizedBox(
                            height: 60,
                            width: 100,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: (() {
                                  Navigator.pushReplacementNamed(
                                      context, HomePage.route);
                                }),
                                child: const Text(
                                  "Início",
                                  style: TextStyle(fontSize: 16),
                                )),
                          )
                        : SizedBox(
                            height: 60,
                            width: 60,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: (() {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.fastOutSlowIn);
                                }),
                                child: const Icon(Icons.arrow_forward_ios)),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.black.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

List<Onboard> demoData = [
  Onboard(
    image: "assets/images/dreamsarchieve.png",
    title: "Transforme o seu sonho\n em realidade",
    description:
        "No Sr Minhaeiro você encontra ferramentas que ajudam a organizar sua vida financeira, permitindo assim, dedicar-se ao seu sonho",
  ),
  Onboard(
    image: "assets/images/moneysaves.jpg",
    title: "Não perca seu sonho de vista",
    description:
        "Quando um sonho é criado é gerado um card que ao ser pressionado mostra detalhes para a realização do seu sonho ",
  ),
  Onboard(
    image: "assets/images/together.png",
    title: "Observe as dicas semanais para um melhor controle ficanceiro ",
    description:
        "Na área de Dicas financeiras é possível visualizar dicas financeiras, rápidas e fáceis e a partir daí poupar onde for possível",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: Image.asset(
            image,
            height: 350,
            width: 350,
          ),
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color.fromARGB(255, 52, 51, 51)),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
