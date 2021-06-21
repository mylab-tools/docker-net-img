echo off

IF [%1]==[] goto noparam

echo "Build project ..."
dotnet publish ..\src\MyAuth.OAuthPoint\MyAuth.OAuthPoint.csproj -c Release -o .\out\app

echo "Build image '%1' and 'latest'..."
docker build -t mylabtools/docker-net:%1 -t mylabtools/docker-net:latest .

echo "Publish image '%1' ..."
docker push mylabtools/docker-net:%1

echo "Publish image 'latest' ..."
docker push mylabtools/docker-net:latest

goto done

:noparam
echo "Please specify image version"
goto done

:done
echo "Done!"