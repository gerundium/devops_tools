# --
# Create a logfile with some example logs
# --

# Init
import logging
import socket
import os
import sys
import argparse

# Variables
hostname = socket.gethostbyaddr(socket.gethostname())[0]
name = "db"
x = 4
y = 0
basename = os.path.basename(__file__)
fullname = __file__

# Healthchecks
# To do

# Setup argument parser
parser = argparse.ArgumentParser(description='Log Generator')
parser.add_argument('-l','--logpath', help='Specify log path e.g. /tmp/my.log', required=True)
args = parser.parse_args()

# Setup logger
logger = logging.getLogger(fullname)
logger.setLevel(logging.INFO)

# configure the handler and formatter for logger
handler = logging.FileHandler(f"{args.logpath}", mode='a')
formatter = logging.Formatter("%(asctime)s logger:\"%(name)s\" level:\"%(levelname)s\" message:\"%(message)s\"")

# add formatter to the handler
handler.setFormatter(formatter)
# add handler to the logger
logger.addHandler(handler)

# Create some logs
logger.info(f"Starting Server 8.2.4 build 0274h1")
logger.debug(f"Testing the custom logger for module {__name__}...")
logger.warning(f"[W] flag not specified during Initiation")
logger.error(f"unexpected server error [x420]")
logger.critical(f"[CRIT]: Directory NOT FOUND")
logger.info(f"Stopping Server 8.2.4 build 0274h1")
