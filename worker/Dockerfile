################### Build Mallob
FROM satcomp-base:worker AS builder
USER root
#  Install required softwares
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt install -y cmake build-essential zlib1g-dev libopenmpi-dev wget unzip build-essential zlib1g-dev cmake python3 build-essential gfortran wget curl

# Build Mallob (from conp_solutions)
RUN git clone -b recent-solvers --depth=2 https://github.com/conp-solutions/mallob
WORKDIR mallob
RUN ./build_mallob.sh


################### Extract Mallob in run stage
FROM satcomp-base:worker AS mallob_liaison
WORKDIR /
# Copy mallob
COPY --from=builder /mallob/build/mallob mallob
COPY --from=builder /mallob/build/mallob_sat_process mallob_sat_process
COPY --chown=ecs-user /worker /competition

RUN chmod +x /competition/worker
