#!/bin/bash

read -p "1st number is: " num1
read -p "2nd number is: " num2

sum () {
    echo "sum of the two numbers is $(($num1 + $num2))"
}

sub () {
    echo "Subtraction of two number is $(($num1 - $num2))"
}

mul () {
    echo "Multiplication of two number is $(($num1 * $num2))"
}

div () {
    echo "division of two number is $(($num1 / $num2))"
}


echo "Choose an option: "
echo "1) Addition"
echo "2) Substraction"
echo "3) Multiplication"
echo "4) Division"

read choice
case $choice in
    1) sum;;
    2) Sub;;
    3) mul;;
    4) div;;
    *) echo "Not a valid input"
esac