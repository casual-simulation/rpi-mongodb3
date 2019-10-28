FROM andresvidal/rpi3-mongodb3:latest

COPY startup.sh /startup.s

CMD ["/startup.sh"]