FROM mdstudio/mdstudio_docker3:0.0.3

COPY . /home/mdstudio/mdstudio_haddock

RUN chown mdstudio:mdstudio /home/mdstudio/mdstudio_haddock

WORKDIR /home/mdstudio/mdstudio_haddock

RUN pip install https://github.com/MD-Studio/mdstudio_graph/tarball/master#egg=mdstudio_graph

RUN pip install -e .

USER mdstudio

CMD ["bash", "entry_point_mdstudio_haddock.sh"]
