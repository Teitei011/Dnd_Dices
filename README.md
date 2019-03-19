# Dnd_Dices
  Ja fiz um program semelhante em python.
      Este programa tem como intuito saber a probabiliade estatistica
     de sair vivo quando vc morre no dnd


    								Death Saving Rules

    Vc possui dois scores, o life_score e o death_score.
    É jogado o d20, se cair acima de 10 vc ganha um life_score, se cair abaixo vc ganha um
   death_score

    O que completar primeiro ganha, se vc consegue 3 life_score vc volta a vida, se vc consegue
    3 death_score vc morre para sempre.

    Há duas excessão:

    1) Quando vc consegue 20 vc volta direto a vida
    2) Quando vc consegue 1 vc ganha 2 death_score

    Tenho a intencao de saber qual a probabiliade de sair vivo desta encrenca


    							Numeros aleatorios:

    Para conseguir uma distribuicao normal discreta precisa ser usado a relacao abaixo:

   j = n + FLOOR((m+1-n)*u)

    Onde n é o numero que é usado para começar e m o que termina, sendo u o valor entre 0 e 1

   random =  1 + floor((20)*random)          ! Desta forma consigo numeros aleatorios de 1 a 20


                                      TODO


    1) Fazer ele fazer o mesmo percurso algumas vezes afim de descobrir o erro padrao associado


                               LOGICA DO PROGRAMA

    1) Há duas funcoes em funcionamento(por enquanto só tem uma),
    2) Uma funcao que vai jogar  os dados até ver se morre/vive.
    3) Outra que vai ficar chamando a primeira funcao para conseguir a estatistica de vidas/mortes
