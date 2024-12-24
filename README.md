# Banking_App_Docker
Converted basic python &amp; django app to a docker file for easy to run !


# Build Docker Image 
```
sudo docker build -t banking_app .
```

# Run Docker Container
```
sudo docker run -d -p 8000:8000 --name banking_app_container banking_app
```

# Stop container and delete image
```
sudo docker container stop banking_app_container
sudo docker container rm banking_app_container
sudo docker image rm banking_app --force


```
