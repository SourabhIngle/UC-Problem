#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateInMonth=100
empRatePerHr=20
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkHours()
{
        randomCheck=$((RANDOM%3))
        case $randomCheck in
                                $isPartTime )
                                        empHrs=4
                                ;;
                                $isFullTime )
                                        empHrs=8
                                ;;
                                *)
                                        empHrs=0
                                ;;
esac
}

while [[ $totalEmpHr -lt $maxRateInMonth &&
        $totalWorkingDays -lt $numOfWorkingDays ]]
do
        ((totalWorkingDays++))
        getWorkHours
        totalEmpHr=$(($totalEmpHr+$empHrs))
        #aray line that provides you daily wage
        dailyWages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

totalSalary=$(($totalEmpHr*$empRatePerHr))
echo $totalSalary  	#monthly salary
echo ${dailyWages[@]}	#per day wage

