#!/bin/bash
#jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
jupyter notebook --ip=0.0.0.0 --port=$PORT --config=./conf/jupyter.py