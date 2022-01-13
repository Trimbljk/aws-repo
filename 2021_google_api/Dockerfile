FROM jupyter/datascience-notebook:2ce7c06a61a1

USER root

USER $NB_USER

RUN pip install --ignore-installed pyathena==2.1.2 \
    && pip install --ignore-installed awscli==1.19.27 \
    && pip install --upgrade google-auth \
	&& pip install google-api-python-client \
  && pip install faker

