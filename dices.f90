program estatistica_dos_dados
    implicit none

    ! Ja fiz um program semelhante em python.
    ! Este programa tem como intuito saber a probabiliade estatistica 
    !de sair vivo quando vc morre no dnd 


    ! 								Death Saving Rules

    ! Vc possui dois scores, o life_score e o death_score.
    ! É jogado o d20, se cair acima de 10 vc ganha um life_score, se cair abaixo vc ganha um 
    !death_score

    ! O que completar primeiro ganha, se vc consegue 3 life_score vc volta a vida, se vc consegue
    ! 3 death_score vc morre para sempre.

    ! Há duas excessão:

    ! 1) Quando vc consegue 20 vc volta direto a vida
    ! 2) Quando vc consegue 1 vc ganha 2 death_score
    
    ! Tenho a intencao de saber qual a probabiliade de sair vivo desta encrenca


    ! 							Numeros aleatorios:

    ! Para conseguir uma distribuicao normal discreta precisa ser usado a relacao abaixo:

    !j = n + FLOOR((m+1-n)*u)
    
    ! Onde n é o numero que é usado para começar e m o que termina, sendo u o valor entre 0 e 1

    !random =  1 + floor((20)*random)         ! Desta forma consigo numeros aleatorios de 1 a 20


    ! 									    Esclarecimentos

    ! 1) number_of_deaths é diferente de death_score. Toda vez que o death_score chega a 3, ele
    ! reseta e adiciona 1 ao number of deaths.  O mesmo ocorre com number_of_lifes e life_score

    ! 2) Mesma coisa com o percent_life e percent_death. Eles representam a porcentagem da simulacao 


    !                                   TODO

    
    ! 1) Fazer ele fazer o mesmo percurso algumas vezes afim de descobrir o erro padrao associado


    !                            LOGICA DO PROGRAMA

    ! 1) Há duas funcoes em funcionamento(por enquanto só tem uma), 
    ! 2) Uma funcao que vai jogar  os dados até ver se morre/vive. 
    ! 3) Outra que vai ficar chamando a primeira funcao para conseguir a estatistica de vidas/mortes

    !---------------------------------------------------------------------------------------------!



    ! Declaracao de variaveis

    integer :: i, j ! O que vai percorrer as listas
    integer :: number_of_times = 100000  
    
    integer :: death_score = 0, life_score = 0 ! O contador de vidas
    real*8 :: percent_life = 0, percent_death = 0

    integer :: Did_I_die = 0 ! Vivo = 1, Morto = -1


    integer :: seed = 1               ! Seed do programa
    real*8 :: random



    real*8, external    :: rkiss05  ! O que vai ser usado para gerar os numeros aleatorios
    call kissinit(seed)  


end program estatistica_dos_dados

     ! O programa tem que ter um while, pq ele só pode parar quando atingir o life_score/death_score
     ! igual a 3

     ! Esta funcao joga os dados até ver se saiu ou nao com vida

integer function dices(Did_I_die)
	    do while (life_score .EQ. 3 .OR. death_score .EQ. 3)      
	        ! Jogando o dado
	      random = rkiss05()
	      random =  1 + floor((20)*random)         ! Desta forma consigo numeros aleatorios de 1 a 20

	      ! Fazendo a contagem da resposta do dado
		  if (random .GE. 10) then   ! .GE. Maior ou igual
	          life_score = life_score + 1
		  else if (random .EQ. 20) then
	          life_score = life_score + 3
		  else if(random .EQ. 1)  then
	          death_score = death_score + 1
	  	  else ! random < 10
	          death_score = death_score + 1
		  endif
	    
	     ! Vendo se ja morreu ou voltou a vida  

	     if(death_score .EQ. 3) then 
	        Did_I_die = -1
	        return
	     else if(life_score .EQ. 3) then
	        Did_I_die = 1
	        return
	     endif
	  	 
	  	 enddo
	
	END FUNCTION dices


