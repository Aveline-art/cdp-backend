FROM python:3.11
WORKDIR /code
# RUN useradd -m docker
# RUN apt-get update && apt-get install sudo
# RUN wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
# RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr bullseye" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
RUN apt-get update && apt-get install -y \
    graphviz \
    ffmpeg \
    git
# RUN sudo apt update && sudo apt install -y just
# RUN curl https://sh.rustup.rs -sSf -y | sh
COPY . .
RUN python -m pip install --upgrade pip && pip install --no-cache-dir -e '.[pipeline,functions,lint,test,docs,dev]'
# just install
