FROM mdstudio/mdstudio_docker3:0.0.1

COPY . /home/mdstudio/lie_haddock

RUN chown mdstudio:mdstudio /home/mdstudio/lie_haddock

WORKDIR /home/mdstudio/lie_haddock

RUN pip install .

USER mdstudio

CMD ["bash", "entry_point_lie_haddock.sh"]
