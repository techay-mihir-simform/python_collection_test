#! /bin/bash
file_name=`git whatchanged --diff-filter=A  --pretty=""  --name-only`
echo $file_name
string_array=($file_name)
cd_name=""
# echo ${string_array[1]}
for i in ${string_array[@]}
do
    if [[ $i == *.py ]]
    then
        echo "hello"+$i
        # mkdir $i+"tets"
        file_name=$i
        familly_name=`basename $file_name .py`
        echo $familly_name
        cd=`cat container_defination.json`
        echo $cd
        new_cd=$(echo $cd | jq --arg cm "${file_name}" '.containerDefinitions[0].command[1]= $cm')
        echo $new_cd
        only_container=$(echo $new_cd | jq -r '.containerDefinitions')
        aws ecs register-task-definition  --region "us-east-1" --family "${familly_name}" --container-definitions "${only_container}" --network-mode "awsvpc"   --requires-compatibilities "FARGATE" --cpu "512" --memory "1024"  
    fi
done

