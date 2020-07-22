# FROM gcr.io/jenkinsxio-labs/jxl-base:0.1.41
FROM 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/jxl-base-image:0.1.56
EXPOSE 8080
COPY ./build/linux/jxl /usr/local/bin/jxl
