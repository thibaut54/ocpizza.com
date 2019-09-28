FROM store/oracle/serverjre:8
ADD ocpizza-back.jar ocpizza-back.jar
ENTRYPOINT ["java", "-jar", "ocpizza-back.jar"]
