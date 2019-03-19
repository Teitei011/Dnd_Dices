program estatistica_dos_dados
    implicit none

    ! 1) Há duas funcoes em funcionamento(por enquanto só tem uma),
    ! 2) Uma funcao que vai jogar  os dados até ver se morre/vive.
    ! 3) Outra que vai ficar chamando a primeira funcao para conseguir a estatistica de vidas/mortes

    !---------------------------------------------------------------------------------------------!



    ! Declaracao de variaveis

    integer :: i, j ! O que vai percorrer as listas
    integer :: number_of_times = 10, dices

    integer :: death_score = 0, life_score = 0 ! O contador de vidas
    real(8) :: percent_life = 0, percent_death = 0

    real(8) :: data

    integer :: seed = 1               ! Seed do programa
    real*8 :: random


    real*8, external    :: rkiss05  ! O que vai ser usado para gerar os numeros aleatorios
    call kissinit(seed)

    ! Percorrendo varias vezes
    do i = 0, number_of_times, 1
      data = dices()   ! TODO: Problem while calling function
    !  print *, data

      if ( data .eq. 1 ) then         ! Caso ele nao morreu
        life_score = life_score + 1
      else                                ! Caso ele esta vivo
        death_score = death_score + 1
      end if
    enddo


    ! Fazendo a porcentagem
!    print *, death_score

end program estatistica_dos_dados

     ! O programa tem que ter um while, pq ele só pode parar quando atingir o life_score/death_score
     ! igual a 3

     ! Esta funcao joga os dados até ver se saiu ou nao com vida

integer function dices()
      dices = 0
      life_score = 0
      death_score = 0
	    do while (life_score  < 3 .OR. death_score < 3)
	        ! Jogando o dado
	      random = rkiss05()
	      random =  1 + floor((20)*random)         ! Problema no gerador de numeros aleatorios

	      ! Fazendo a contagem da resposta do dado
		  if (random > 10) then   ! .GE. Maior ou igual
	          death_score = death_score + 1
		  else if (random .eq. 20) then
	          life_score = life_score + 3
		  else if(random .eq. 1)  then
	          death_score = death_score + 1
	  	  else ! random < 10
	          life_score = life_score + 1
		  endif

        print *, "Life: ", life_score
        print *, "Death: ", death_score
	     ! Vendo se ja morreu ou voltou a vida
       if(life_score > 2) then
          dices = 1
          return
       endif

	     if(death_score > 2) then
	        dices = -1
	        return
        endif


	  	 enddo

	END FUNCTION dices
