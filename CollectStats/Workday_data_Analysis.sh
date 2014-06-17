clear
echo "WD-Connectors Analysis:"
echo "-----------------------"
Staff=`grep MillSec mule_ee.log*|grep "WD-Connector"|grep "WD-staffing-operations_Flow"|wc -l`
Comp=`grep MillSec mule_ee.log*|grep "WD-Connector"|grep "WD-compensation-operations_Flow"|wc -l`
Total=`grep MillSec mule_ee.log*|grep "WD-Connector"|wc -l`

Staff_slt=`grep MillSec mule_ee.log*|grep "WD-XSLT"|grep "WD-staffing-operations_Flow"|wc -l`
Comp_slt=`grep MillSec mule_ee.log*|grep "WD-XSLT"|grep "WD-compensation-operations_Flow"|wc -l`
Total_slt=`grep MillSec mule_ee.log*|grep "WD-XSLT"|wc -l`

Staff_emp=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|grep "WD-staffing-operations_Flow"|wc -l`
Comp_emp=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|grep "WD-compensation-operations_Flow"|wc -l`
Total_emp=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|wc -l`

DispatcherCall=`grep MillSec mule_ee.log*|grep "Work Dispatcher call finished in MillSec"|wc -l`
WDTartgetCall=`grep MillSec mule_ee.log*|grep "Workday-Employee-TartgetAdapter call finished in MillSec"|wc -l`
updateGFGStatus=`grep MillSec mule_ee.log*|grep "updateGFGStatusField call finished in MillSec"|wc -l`
echo "Below is the Work day in detail Invocation during the performance testing"

red='\e[0;31m'
NC='\e[0m' # No Color
echo -e "${red}"
echo "|----------------------------------------------------|"
echo "|                   |            Invocations         |"
echo "|  Connector Name   | ---------|---------|-----------|"
echo "|                   | Connector|   SLT   |Employee-TA|"
echo "|-------------------|----------|---------|-----------|"
echo "|staffing-operations| $Staff      | $Staff_slt     |$Staff_emp        |"
echo "| compensation-opera| $Comp      | $Comp_slt     |$Comp_emp        |"
echo "| Total Operation   | $Total     | $Total_slt    |$Total_emp       |"
echo "|----------------------------------------------------|"
echo "|DispatcherCall End |       $DispatcherCall                |"
echo "|WD-TartgetCall End |       $WDTartgetCall                 |"
echo "|updateGFGStatus    |       $updateGFGStatus               |"
echo "|----------------------------------------------------|"

echo -e "${NC}"
staff1=`grep MillSec mule_ee.log*|grep "WD-Connector"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-staffing-operations_Flow"|awk -F"," '{ sum+=$3} END {print sum/60000}'`

Comp1=`grep MillSec mule_ee.log*|grep "WD-Connector"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-compensation-operations_Flow"|awk -F"," '{ sum+=$3} END {print sum/60000}'`


Total1=`grep MillSec mule_ee.log*|grep "WD-Connector"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|awk -F"," '{ sum+=$3} END {print sum/60000}'`

Staff_slt1=`grep MillSec mule_ee.log*|grep "WD-XSLT"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-staffing-operations_Flow"|awk -F"," '{ sum+=$3} END {print sum/60000}'`

Comp_slt1=`grep MillSec mule_ee.log*|grep "WD-XSLT"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-compensation-operations_Flow"|awk -F"," '{ sum+=$3} END {print sum/60000}'`


Total_slt1=`grep MillSec mule_ee.log*|grep "WD-XSLT"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|awk -F"," '{ sum+=$3} END {print sum/60000}'`

Staff_emp1=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-staffing-operations_Flow"|awk -F"," '{ sum+=$3} END {print sum/60000}'`

Comp_emp1=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-compensation-operations_Flow"|awk -F"," '{ sum+=$3} END {print sum/60000}'`
Total_emp1=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|awk -F"," '{ sum+=$3} END {print sum/60000}'`

updateGFGStatus1=`grep MillSec mule_ee.log*|grep "WD-Employee-TA"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|awk -F"," '{ sum+=$3} END {print sum/60000}'`

DispatcherCall_t=`grep MillSec mule_ee.log*|grep "Work Dispatcher call finished in MillSec"|awk '{print $3,$12 }'|sed 's/ MillSec:-/,/g'|awk -F"," '{ sum+=$3} END {print sum/60000}'`
updateGFGStatus_t=`grep MillSec mule_ee.log*|grep "updateGFGStatusField call finished in MillSec"|awk '{print $3,$12 }'|sed 's/:/,/g'|sed 's/ /,/g'|sed 's/-//g'|awk -F"," '{print $1":"$2":"$3":"$4","$5}'|awk -F"," '{ sum+=$2} END {print sum/60000}'`

WDTartgetCall_t=`grep MillSec mule_ee.log*|grep "Workday-Employee-TartgetAdapter call finished in MillSec"|awk '{print $3,$11 }'|sed 's/ MillSec:-/,/g'|awk -F"," '{ sum+=$3} END {print sum/60000}'`
echo ""
echo "Below is the Work day in detail records processing time during the performance testing"
echo -e "${red}"
echo "|-------------------|--------------------------------------------------|"
echo "|                   |               Processing time                    |"
echo "|  Connector Name   | ----------------|--------------|-----------------|"
echo "|                   | Connector[min]  |   SLT [min]  |Employee-TA [min]|"
echo "|-------------------|-----------------|--------------|-----------------|"
echo "|staffing-operations| $staff1         | $Staff_slt1       |$Staff_emp1          |"
echo "| compensation-opera| $Comp1         | $Comp_slt1    |$Comp_emp1          |" 
echo "| Total Operation   | $Total1         | $Total_slt1    |$Total_emp1          |"
echo "-----------------------------------------------------------------------|"
echo "|DispatcherCall End |       $DispatcherCall_t                      |"
echo "|WD-TartgetCall End |       $WDTartgetCall_t                       |"
echo "|updateGFGStatus    |       $updateGFGStatus_t                     |"
echo "|-------------------|--------------------------------------------------|"
echo -e "${NC}"
echo ""

echo "Below is the Work day in detail records Average,minimum and maximum time during the performance testing"
echo -e "${red}"
echo "|--------------------------------------------------------------|"
echo "|ConnectorName           | Average [sec]| Min [sec] | Max [Sec]|"
echo "|------------------------|--------------|-----------|----------|"
grep MillSec mule_ee.log*|grep "WD-Connector"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-staffing-operations_Flow" >> staff.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""WD-staffing-flow""       |" "  "(sum/(cnt-1))*1/1000 "     |""  " min/1000 "    |" "  " max/1000"  |"}
        ' staff.txt
grep MillSec mule_ee.log*|grep "WD-Connector"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-compensation-operations" >> comp.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""WD-Compens--flow""       |" "  "(sum/(cnt-1))*1/1000 "     |" "  "min/1000 "    |"  "  "max/1000"  |"}
        ' comp.txt


echo "|--------------------------------------------------------------|"
grep MillSec mule_ee.log*|grep "WD-XSLT"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-staffing-operations_Flow" >>staff_slt.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""Staffings--flow-XSLT""   |" "  "(sum/(cnt-1))"     |" "  "min "        |"  "  "max"     |"  "in milliSec"}
        ' staff_slt.txt


grep MillSec mule_ee.log*|grep "WD-XSLT"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-compensation-operations_Flow" >>comp_slt.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""Compens--flow-XSLT""     |" "  "(sum/(cnt-1))"     |" "  "min"        |"  "  "max"     |"  "in milliSec"}
        ' comp_slt.txt


echo "|--------------------------------------------------------------|"
grep MillSec mule_ee.log*|grep "WD-Employee-TA"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-staffing-operations_Flow" >>staff_ta.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""Staffings-Employee-TA""  |" "  "(sum/(cnt-1))*1/1000"     |" "  "min/1000 "    |"  "  "max/1000"   |"}
        ' staff_ta.txt


grep MillSec mule_ee.log*|grep "WD-Employee-TA"|awk '{print $3,substr($5, 40,41) $11 }'|sed 's/:/,/g'|sed 's/ /,/g'|awk -F"," '{print $1":"$2":"$3":"$4","$5","$7}'|grep "WD-compensation-operations_Flow">> comp_ta.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""Compen-Employee-TA""     |" "  "(sum/(cnt-1))*1/1000"     |" "  "min/1000 "   |"  "  "max/1000"  |"}
        ' comp_ta.txt
echo "|--------------------------------------------------------------|"

grep MillSec mule_ee.log*|grep "Work Dispatcher call finished in MillSec"|awk '{print $3,$12 }'|sed 's/ MillSec:-/,/g' >>DispatcherCall.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""DispatcherCall End""  |" "  "(sum/(cnt-1))*1/1000"     |" "  "min/1000 "    |"  "  "max/1000"   |"}
        ' DispatcherCall.txt

grep MillSec mule_ee.log*|grep "Workday-Employee-TartgetAdapter call finished in MillSec"|awk '{print $3,$11 }'|sed 's/ MillSec:-/,/g'>>WD-TartgetCall.txt

awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$3
                 if (min>$3) min=$3
                 if (max<$3) max=$3
                 cnt = NR
                }
         END    {print "| ""WD-TartgetCall End""  |" "  "(sum/(cnt-1))*1/1000"     |" "  "min/1000 "    |"  "  "max/1000"   |"}
        ' WD-TartgetCall.txt



grep MillSec mule_ee.log*|grep "updateGFGStatusField call finished in MillSec"|awk '{print $3,$12 }'|sed 's/:/,/g'|sed 's/ /,/g'|sed 's/-//g'|awk -F"," '{print $1":"$2":"$3":"$4","$5}' >>updateGFGStatus.txt
awk -F","    'NR==1 {max=0;min=1000000} 
         NR>1   {sum+=$2
                 if (min>$2) min=$2
                 if (max<$2) max=$2
                 cnt = NR
                }
         END    {print "| ""updateGFGStatus End""  |" "  "(sum/(cnt-1))*1/1000"     |" "  "min/1000 "    |"  "  "max/1000"   |"}
        ' updateGFGStatus.txt


echo "|--------------------------------------------------------------|"
echo -e "${NC}"


rm -rf total.txt comp.txt staff.txt staff_slt.txt comp_slt.txt staff_ta.txt comp_ta.txt updateGFGStatus.txt DispatcherCall.txt WD-TartgetCall.txt

