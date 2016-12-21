FROM wgottschalk/soapbox-movies:latest

ENV PORT=8888
EXPOSE 8888
CMD ./app/bin/soapbox start
