if curl -s -X PUT http://aai-elasticsearch:9200/searchhealth/stats/testwrite -d @/consul/scripts/aai-search-storage-write-doc.txt | grep '\"created\":true'; then
   if curl -s -X DELETE http://aai-elasticsearch:9200/searchhealth/stats/testwrite | grep '\"failed\":0'; then
      if curl -s -X GET http://aai-elasticsearch:9200/searchhealth/stats/testwrite | grep '\"found\":false'; then
         echo Successful PUT, DELETE, GET from Search Document Storage 2>&1
         exit 0
      else
         echo Failed GET from Search Document Storage 2>&1
         exit 1
      fi
   else
      echo Failed DELETE from Search Document Storage 2>&1
      exit 1
   fi
else
   echo Failed PUT from Search Document Storage 2>&1
   exit 1
fi
