FROM python:3.7-alpine


# pycdc in this directory is a statically linked executable based on version
# 2e76e56420493bfc0807da06a87dfdda5217a5aa
COPY pycdc /usr/bin

# unpyc37 in this directory is copied from https://github.com/andrew-tavera/unpyc37/blob/d7dc609e8c63086dc58fc749835f7aed2482543f/unpyc3.py
# I have added #!/usr/bin/env python3 to the top and renamed it so we can use
# it like a regular command
COPY unpyc3 /usr/bin

# According to uncompyle6 docs, we should generally use decompyle3 for
# python versions 3.7 or 3.8
RUN true && \
    pip3 install uncompyle6 && \
    pip3 install decompyle3 && \
    true

COPY entrypoint /entrypoint

ENTRYPOINT [ "/entrypoint" ]
CMD []
WORKDIR /work
