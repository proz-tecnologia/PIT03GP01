import 'package:flutter/material.dart';
import 'package:srminhaeiro/ui/pages/menu_page/pages/ajudapage/faq_card_config.dart';

class AjudaPage extends StatelessWidget {
  static String route = "ajuda";
  const AjudaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 100, 96, 96),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff120c0c),
          label: const Text(
            "Fale conosco",
            style: TextStyle(
                color: Color(0xfffbf1f1), fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: const Center(child: Text("Precisa de ajuda?")),
              toolbarTextStyle: const TextStyle(fontSize: 60),
              backgroundColor: const Color.fromARGB(255, 61, 61, 63),
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: const Color(0xff120c0c),
                ),
                title: const Text(
                  "F A Q",
                ),
              ),
            ),
            const FaqCardConfig(
              pergunta: "como funciona esse salário extra?",
              resposta:
                  "Um grupo é criado com pessoas de sua confiança onde elas escolhem um valor padrão que cada integrante pagará, e um sorteio será feito para existir uma ordem de recebimento, e assim as pessoas pagam o valor padrão até que a ultima pessoa da ordem sorteada receba seu Salário extra. ",
            ),
            const FaqCardConfig(
              pergunta: "Por quê fazer o Cartão minhaeiro?",
              resposta:
                  "Com o cartão minhaeiro suas transações reais para o salario extra podem ser feitas diretamente pelo APP e muitos mais benefícios que só o Cartão minhaeiro tem ",
            ),
            const FaqCardConfig(
              pergunta:
                  "É verdade que existem benefícios ao convidar amigos para o app?",
              resposta:
                  "Sim senhor!! a cada 5 amigo que você indica o Sr.Minhaeiro e seu amigo cria uma conta, você pode obter muitos benefícios, por exemplo, se 10 amigos que você convidou criaram conta, você pode ter um mês grátis para utilizar o App em sua totalidade e muito mais... ",
            ),
            const FaqCardConfig(
              pergunta: "Por quê fazer o Cartão minhaeiro?",
              resposta:
                  "Com o cartão minhaeiro suas transações reais para o salario extra podem ser feitas diretamente pelo APP e muitos mais benefícios que só o Cartão minhaeiro tem ",
            ),
            const FaqCardConfig(
              pergunta: "Por quê fazer o Cartão minhaeiro?",
              resposta:
                  "Com o cartão minhaeiro suas transações reais para o salario extra podem ser feitas diretamente pelo APP e muitos mais benefícios que só o Cartão minhaeiro tem ",
            ),
            const FaqCardConfig(
              pergunta: "Por quê fazer o Cartão minhaeiro?",
              resposta:
                  "Com o cartão minhaeiro suas transações reais para o salario extra podem ser feitas diretamente pelo APP e muitos mais benefícios que só o Cartão minhaeiro tem ",
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
