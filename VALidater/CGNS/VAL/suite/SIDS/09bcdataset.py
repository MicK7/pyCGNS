#  -------------------------------------------------------------------------
#  pyCGNS.VAL - Python package for CFD General Notation System - VALidater
#  See license.txt file in the root directory of this Python module source  
#  -------------------------------------------------------------------------
#
import CGNS.PAT.cgnslib as CGL
import CGNS.PAT.cgnsutils as CGU
import CGNS.PAT.cgnskeywords as CGK
import numpy as NPY

TESTS=[]

#  -------------------------------------------------------------------------
tag='bc'
diag=True
def makeCorrectTree(vertexsize,cellsize,ntris):
  T=CGL.newCGNSTree()
  b=CGL.newBase(T,'Base',3,3)
  s=NPY.array([[vertexsize,cellsize,0]],dtype='i',order='F')
  z=CGL.newZone(b,'Zone',s,CGK.Unstructured_s)
  g=CGL.newGridCoordinates(z,'GridCoordinates')
  d=CGL.newDataArray(g,CGK.CoordinateX_s,NPY.ones((vertexsize),dtype='d',order='F'))
  d=CGL.newDataArray(g,CGK.CoordinateY_s,NPY.ones((vertexsize),dtype='d',order='F'))
  d=CGL.newDataArray(g,CGK.CoordinateZ_s,NPY.ones((vertexsize),dtype='d',order='F'))
  tetras=CGL.newElements(z,'TETRAS',CGK.TETRA_4_s,NPY.ones((cellsize*4),dtype='i'),NPY.array([[1,cellsize]],'i',order='F'))
  zbc=CGL.newZoneBC(z)
  tris=CGL.newElements(z,'TRIS',CGK.TRI_3_s,NPY.ones((ntris*3),dtype='i'),NPY.array([[cellsize+1,cellsize+ntris]],'i',order='F'))
  n=CGL.newBoundary(zbc,'BC',[range(cellsize+1,cellsize+ntris+1)],btype=CGK.Null_s,family=None,pttype=CGK.PointList_s)
  g=CGL.newGridLocation(n,value=CGK.CellCenter_s)
  return (T,b,z,zbc,n)
vertexsize = 20
cellsize   = 7
ntris      = 11
(T,b,z,zbc,n)=makeCorrectTree(vertexsize,cellsize,ntris)
CGL.newBCDataSet(n,'Data',valueType=CGK.Null_s)
TESTS.append((tag,T,diag))

#  -------------------------------------------------------------------------
tag='bc both PointList and PointRange'
diag=False
(T,b,z,zbc,n)=makeCorrectTree(vertexsize,cellsize,ntris)
bcd=CGL.newBCDataSet(n,'Data',valueType=CGK.Null_s)
CGL.newPointRange(bcd,value=NPY.array([[cellsize+1,cellsize+ntris]],'i'))
CGL.newPointList(bcd,value=NPY.array([range(cellsize+1,cellsize+ntris+1)],'i'))
TESTS.append((tag,T,diag))