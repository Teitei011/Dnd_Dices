program estatistica_dos_dados
    implicit none

    integer :: i, j
    integer :: number_of_times, dices_result
    integer :: number_of_deviations = 5

    integer :: life_score = 0
    real(8) :: porcentagem

    real(8) :: data, random
    integer :: dice_number

    ! Standart deviation variables declaration

    real(8), dimension(5) :: deviation_array
    real(8) :: sum = 0, mean, deviation

    ! Pedindo para colocar um valor para o number_of_times
    print *, "Put the amount of itinerations to run the code: "
    read(*, *) number_of_times

    do i = 1, number_of_deviations + 1, 1
      life_score = 0
      do j = 0, number_of_times, 1
        data = dices_result()        ! Using the function
        if ( data .eq. 1 ) then         ! Alive
          life_score = life_score + 1
        endif
      enddo

      ! Calculating the results
      porcentagem = (dfloat(life_score) / dfloat(number_of_times)) * 100
      ! Fazendo a porcentagem
      deviation_array(i) = porcentagem
    enddo

    ! Calculating the standart deviation

     ! First calculating the mean

     do i = 1, number_of_deviations, 1
       sum = sum + deviation_array(i)
     enddo
     mean = sum / number_of_deviations

     !
     sum = 0
     do i = 1, 5, 1
       sum = sum + (deviation_array(i) - mean)**2
     enddo
     deviation = SQRT(sum/number_of_deviations)


     print *, "The odds of getting back to the game are: "
     print *, mean, " +/- ", deviation

end program estatistica_dos_dados



integer function dices_result()
      dices_result = 0
      life_score = 0
      death_score = 0

	    do while (life_score  < 3 .OR. death_score < 3)
        call RANDOM_NUMBER(random)
        dice_number = 1 + FLOOR(20*random)         ! Dice random generator

        if (dice_number == 20) then  ! Already got to the end
          dices_result = 1
        else if (dice_number > 9) then
          life_score = life_score + 1
        else if (dice_number == 1) then
            death_score = death_score + 2
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
