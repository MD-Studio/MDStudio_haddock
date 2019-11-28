FROM mdstudio/mdstudio_docker3:0.0.3

COPY . /home/mdstudio/mdstudio_haddock

RUN chown -R mdstudio:mdstudio /home/mdstudio/mdstudio_haddock
RUN chmod -R 755 /home/mdstudio

WORKDIR /home/mdstudio/mdstudio_haddock

RUN pip install -e .

USER mdstudio

CMD ["bash", "entry_point_mdstudio_haddock.sh"]
