#  -------------------------------------------------------------------------
#  pyCGNS.VAL - Python package for CFD General Notation System - VALidater
#  See license.txt file in the root directory of this Python module source  
#  -------------------------------------------------------------------------
#  $Release$
#  -------------------------------------------------------------------------
#
from  distutils.core import setup, Extension
from  distutils.util import get_platform
import glob
import os

# --- pyCGNSconfig search
import sys
sys.path+=['../lib']
import setuputils
(pyCGNSconfig,installprocess)=setuputils.search('VAL')
# ---

setup (
name         = "CGNS.VAL",
version      = pyCGNSconfig.VAL_VERSION,
description  = "pyCGNS VALidater - SIDS verification tools",
author       = "marc Poinot",
author_email = "marc.poinot@onera.fr",
license      = "LGPL 2",
packages     = ['CGNS.VAL',
                'CGNS.VAL.grammars',
                'CGNS.VAL.parse'],
cmdclass={'clean':setuputils.clean}
) # close setup
