#  ---------------------------------------------------------------------------
#  pyCGNS - Python package for CFD General Notation System -
#  See license.txt file in the root directory of this Python module source  
#  ---------------------------------------------------------------------------
#
from __future__ import unicode_literals
import CGNS.PAT.cgnslib      as C
import CGNS.PAT.cgnserrors   as E
import CGNS.PAT.cgnskeywords as K
import numpy             as N

#
data = C.newEMConductivityModel(None)
C.newDataArray(data, '{DataArray}')
C.newDataClass(data)
C.newDimensionalUnits(data)
C.newUserDefinedData(data, '{UserDefinedData}')
C.newDescriptor(data, '{Descriptor}')
#
status = '10.9.3'
comment = 'Full SIDS with all optionals'
pattern = [data, status, comment]
#
