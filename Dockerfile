FROM andresvidal/rpi3-mongodb3:latest

COPY startup.sh /startup.sh
RUN ["chmod", "+x", "/startup.sh"]

CMD ["/startup.sh"]