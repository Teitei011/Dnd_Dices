program estatistica_dos_dados
    implicit none

    ! 1) Há duas funcoes em funcionamento,
    ! 2) Uma funcao que vai jogar  os dados até ver se morre/vive.
    ! 3) Outra que vai ficar chamando a primeira funcao para conseguir a estatistica de vidas/mortes

    !---------------------------------------------------------------------------------------------!



    ! Declaracao de variaveis

    integer :: i, j ! O que vai percorrer as listas
    integer :: number_of_times, dices_result

    integer :: death_score = 0, life_score = 0 ! O contador de vidas
    real(8) :: porcentagem

    real(8) :: data

    integer :: dice_number               ! Seed do programa
    real(8) :: random


    ! Pedindo para colocar um valor para o number_of_times
    print *, "Put the amount of itinerations to run the code: "
    read(*, *) number_of_times

    ! Percorrendo varias vezes
    do i = 0, number_of_times, 1
      data = dices_result()
      if ( data .eq. 1 ) then         ! Caso ele nao morreu
        life_score = life_score + 1
      else                                ! Caso ele esta vivo
        death_score = death_score + 1
      endif
    enddo


    porcentagem = (dfloat(life_score) / dfloat(number_of_times)) * 100
    ! Fazendo a porcentagem
    print *, "Porcentagem de sair vivo: "
    print *, porcentagem

end program estatistica_dos_dados

     ! O programa tem que ter um while, pq ele só pode parar quando atingir o life_score/death_score
     ! igual a 3

     ! Esta funcao joga os dados até ver se saiu ou nao com vida

integer function dices_result()
      dices_result = 0
      life_score = 0
      death_score = 0
	    do while (life_score  < 3 .OR. death_score < 3)
	        ! Jogando o dado
        call RANDOM_NUMBER(random)    ! Problema no gerador de numeros aleatorios,
        dice_number = 1 + FLOOR(20*random)

        if (dice_number == 20) then  ! Ja alcansou o objetivo, não é mais necessário itinerar
          dices_result = 1
        else if (dice_number > 10) then
          life_score = life_score + 1
        else if (dice_number == 1) then
            death_score = death_score + 1
        else                             ! dice_number < 10
          death_score = death_score + 1
        endif

            ! Ouput part
        if (life_score == 3) then
            dices_result = 1
        else if (death_score == 3) then
            dices_result = -1
        else
          continue
        endif

	  	 enddo

	END FUNCTION dices_result
