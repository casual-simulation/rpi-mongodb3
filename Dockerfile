FROM andresvidal/rpi3-mongodb3:latest

COPY startup.sh /startup.sh

CMD ["/startup.sh"]