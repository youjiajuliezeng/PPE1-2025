#！/bin/bash
echo "2016: $(cat 2016*.ann | grep Location | wc -l)" > Locations_comptes.txt
echo "2017: $(cat 2017*.ann | grep Location | wc -l)" >> Locations_comptes.txt
echo "2018: $(cat 2018*.ann | grep Location | wc -l)" >> Locations_comptes.txt
