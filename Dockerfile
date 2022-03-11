FROM kalilinux/kali-rolling

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN apt update -y
RUN apt install jq -y
RUN apt install curl -y
RUN apt install unrar -y
RUN apt install wget -y
RUN apt install jupyter -y
RUN apt install unzip -y
# Install Ubuntu dependencies
# libopencv-dev = opencv dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        libopencv-dev \ 
        build-essential \
        libssl-dev \
        libpq-dev \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        gettext \
        unzip \
        supervisor \
        python3-setuptools \
        python3-pip \
        python3-dev \
        python3-venv \
        python3-urllib3 \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade PIP
RUN pip install pip pipenv --upgrade

# sklearn opencv, numpy, and pandas
#RUN pip install scikit-learn opencv-contrib-python numpy pandas

# tensorflow (including Keras)
RUN pip install flask
RUN pip install tensorflow keras
RUN useradd -m charan && adduser charan sudo && echo 'charan:charan' | chpasswd
# pytorch (cpu)
RUN apt-get update && apt-get -y install gcc mono-mcs && rm -rf /var/lib/apt/lists/*
#RUN pip install torch==1.5.0+cpu torchvision==0.6.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextensions install --system
RUN pip install jupyterthemes
RUN jt -t chesterish
# fastai
#RUN pip install fastai

# Project installs
#RUN pipenv install --skip-lock --system --dev
RUN ["chmod", "+x", "./scripts/entrypoint.sh"]
CMD ["./scripts/entrypoint.sh"]
