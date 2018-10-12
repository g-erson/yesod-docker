FROM haskell:8.4.3

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "libpq-dev", "curl"]

# initialise cabal and install yesod 
RUN cabal update 
RUN sh -c 'curl -sS https://www.stackage.org/lts-12.12/cabal.config?global=true >> /root/.cabal/config'
RUN cabal update 
RUN ["cabal", "install", "yesod-bin", "-j4"]

ENV PATH /root/.cabal/bin:$PATH

WORKDIR /root
