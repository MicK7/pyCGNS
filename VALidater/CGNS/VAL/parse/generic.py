#  -------------------------------------------------------------------------
#  pyCGNS.NAV - Python package for CFD General Notation System - NAVigater
#  See license.txt file in the root directory of this Python module source  
#  -------------------------------------------------------------------------
#
#  -------------------------------------------------------------------------
#  pyCGNS.NAV - Python package for CFD General Notation System - NAVigater
#  See license.txt file in the root directory of this Python module source  
#  -------------------------------------------------------------------------
#
import CGNS.PAT.cgnsutils    as CGU
import CGNS.PAT.cgnstypes    as CGT
import CGNS.PAT.cgnskeywords as CGK
import CGNS.VAL.parse.messages as CGM

import inspect

INVALID_NAME='G001'
DUPLICATED_NAME='G002'
INVALID_SIDSTYPE_P='G003'
INVALID_SIDSTYPE='G004'
INVALID_DATATYPE='G005'

genericmessages={
INVALID_NAME:'Name [%s] is not valid',
DUPLICATED_NAME:'Name [%s] is a duplicated child name',
INVALID_SIDSTYPE_P:'SIDS Type [%s] not allowed as child of [%s]',
INVALID_SIDSTYPE:'SIDS Type [%s] not allowed for this node',
INVALID_DATATYPE:'Datatype [%s] not allowed for this node',
}

class GenericContext(dict):
  pass

class GenericParser(object):
  def __init__(self,log=None):
    self.keywordlist=CGK.cgnsnames
    if (log is None):
      self.log=CGM.DiagnosticLog()
    self.log.addMessages(genericmessages)
    self.context=GenericContext()
  def checkLeaf(self,T,path,node):
    if (not hasattr(self,'methods')):
      self.methods=[]
      for m in inspect.getmembers(self):
        if ((m[0][-2:]=='_t') or (m[0][-7:]=='_n')): self.methods+=[m[0]]
    parent=CGU.getParentFromNode(T,node)
    status1=self.checkSingleNode(T,path,node,parent)
    status2=status1
    if ((len(node)==4) and (node[3] in self.methods)):
      status2=apply(getattr(self,node[3]),[path,node,parent,T,self.log])
    status1=CGM.getWorst(status1,status2)
    return status1
  # --------------------------------------------------------------------
  def checkSingleNode(self,T,path,node,parent):
    stt=CGM.CHECK_GOOD
    if (not CGU.checkNodeName(node)):
      stt=CGM.CHECK_FAIL
      self.log.push(path,stt,CGM.INVALID_NAME,node[0])
    lchildren=CGU.childNames(parent)
    if (lchildren):
      lchildren.remove(node[0])
      if (node[0] in lchildren):
        stt=CGM.CHECK_FAIL
        self.log.push(path,stt,CGM.DUPLICATED_NAME,node[0])
    tlist=CGU.getNodeAllowedChildrenTypes(parent,node)
    if (node[3] not in tlist):
      stt=CGM.CHECK_FAIL
      if (parent is not None):
        self.log.push(path,stt,CGM.INVALID_SIDSTYPE_P,node[3],parent[3])
      else:
        self.log.push(path,stt,CGM.INVALID_SIDSTYPE,node[3])
    dlist=CGU.getNodeAllowedDataTypes(node)
    dt=CGU.getValueDataType(node)
    if (dt not in dlist):
      stt=CGM.CHECK_FAIL
      self.log.push(path,stt,CGM.INVALID_DATATYPE,dt)
    return stt
  # --------------------------------------------------------------------
  def checkTree(self,T,trace=False):
    status=CGM.CHECK_GOOD
    if (trace): print '### Parsing node paths...'
    paths=CGU.getPathFullTree(T)
    sz=len(paths)
    ct=1
    for path in paths:
      if (trace): print '### Check node [%.6d/%.6d]\r'%(ct,sz),
      node=CGU.getNodeByPath(T,path)
      if (node is None): print 'FAIL [%s]'%p
      status=self.checkLeaf(T,path,node)
      ct+=1
    return status
  # --------------------------------------------------------------------
  def isMandatory(self,pth,node,parent,tree):
    try:
      if (node[3]==''): return 0 # link
      if (CGT.types[node[3]].cardinality in [CGT.C_11,CGT.C_1N]): return 1
      return 0
    except TypeError: print node[0],node[1],node[3]
  # --------------------------------------------------------------------
  def getStatusForThisNode(self,pth,node,parent,tree):
    stat=self.isMandatory(pth,node,parent,tree)
    lpth=pth.split('/')
    if (lpth[0]==''):
      absolute=1
      if (len(lpth)>1): lpth=lpth[1:]
      else:             lpth=[]
    else:
      absolute=0
    if (node[0] in self.keywordlist): return (1,stat,absolute)
    return (0,stat,absolute)
      
# --- last line
