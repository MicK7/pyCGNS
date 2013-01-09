#  -------------------------------------------------------------------------
#  pyCGNS.NAV - Python package for CFD General Notation System - NAVigater
#  See license.txt file in the root directory of this Python module source  
#  -------------------------------------------------------------------------
#  $Release$
#  -------------------------------------------------------------------------
import shutil
import os
import os.path as OP
import sys
import imp
from time import time,gmtime,strftime

from CGNS.pyCGNSconfig import version as __vid__

import CGNS.PAT.cgnskeywords as CGK

# -----------------------------------------------------------------
Q_VAR_NODE='NODE'
Q_VAR_PARENT='PARENT'
Q_VAR_NAME='NAME'
Q_VAR_VALUE='VALUE'
Q_VAR_CGNSTYPE='SIDSTYPE'
Q_VAR_CHILDREN='CHILDREN'
Q_VAR_TREE='TREE'
Q_VAR_PATH='PATH'
Q_VAR_RESULT='RESULT'
Q_VAR_USER='ARGS'
Q_VAR_RESULT_LIST='__Q7_QUERY_RESULT__'

Q_SCRIPT_PRE="""
import CGNS.PAT.cgnskeywords as CGK
import CGNS.PAT.cgnsutils as CGU
import numpy
"""

Q_FILE_PRE="""
import CGNS.PAT.cgnskeywords as CGK
import CGNS.PAT.cgnsutils as CGU
import CGNS.NAV.moption as CGO
import numpy
"""

Q_SCRIPT_POST="""
%s[0]=%s
"""%(Q_VAR_RESULT_LIST,Q_VAR_RESULT)

# -----------------------------------------------------------------
class Q7OptionContext(object):
    _depends={
        'MaxDisplayDataSize':['DoNotDisplayLargeData'],
        'MaxLoadDataSize':['DoNotLoadLargeArrays'],
        'MaxRecursionLevel':['RecursiveTreeDisplay'],
    }
    _HasProPackage=True
    CHLoneTrace=False
    NAVTrace=False
    AutoExpand=False
    RecursiveTreeDisplay=False
    OneViewPerTreeNode=False
    ShowTableIndex=True
    ShowColumnIndex=True
    RecursiveSIDSPatternsLoad=True
    DoNotDisplayLargeData=False
    CheckOnTheFly=False
    FollowLinksAtLoad=True
    DoNotFollowLinksAtSave=True
    AddCurrentDirInSearch=True
    AddRootDirInSearch=True
    DoNotLoadLargeArrays=True
    ShowSIDSStatusColumn=True
    ForceSIDSLegacyMapping=False
    ForceFortranFlag=True
    FilterCGNSFiles=True
    FilterHDFFiles=True
    TransposeArrayForView=True
    Show1DAsPlain=True
    SelectionListDirectory='~/.CGNS.NAV/selections'
    QueriesDirectory='~/.CGNS.NAV/queries'
    SnapShotDirectory='~/.CGNS.NAV/snapshots'
    _HistoryFileName='~/.CGNS.NAV/historyfile.py'
    _OptionsFileName='~/.CGNS.NAV/optionsfile.py'
    _QueriesDefaultFile='defaultqueries.py'
    LinkSearchPathList=[]
    ProfileSearchPathList=[]
    GrammarSearchPathList=[]
    ValKeyList=['sample']
    CGNSFileExtension=['.cgns','.adf']
    HDFFileExtension=['.hdf','.hdf5']
    MaxLoadDataSize=1000
    MaxDisplayDataSize=5000
    MaxRecursionLevel=7
    ADFConversionCom='cgnsconvert'
    TemporaryDirectory='/tmp'
    _ConvertADFFiles=True
    _ToolName='CGNS.NAV'
    _ToolVersion='%s'%__vid__
    
    _CopyrightNotice="""
Copyright (c) Marc Poinot <br>
Copyright (c) Onera - The French Aerospace Labs<br>

<br>
All rights reserved in accordance with GPL v2 <br><br>
<b>NO WARRANTY :</b><br>
Check GPL v2 sections 15 and 16<br>
about loss of data or corrupted data<br>
"""
    Label_Family='arial'
    Label_Size=10
    Label_Bold=False
    Label_Italic=False
    Edit_Family='courier'
    Edit_Size=10
    Edit_Bold=False
    Edit_Italic=False
    Table_Family='courier'
    Table_Size=10
    Table_Bold=False
    Table_Italic=False
    Button_Family='arial'
    Button_Size=10
    Button_Bold=False
    Button_Italic=False
    RName_Family='arial'
    RName_Size=10
    RName_Bold=False
    RName_Italic=False
    NName_Family='arial'
    NName_Size=10
    NName_Bold=False
    NName_Italic=False

    _Label_Font=None
    _Table_Font=None
    _Edit_Font=None
    _Button_Font=None
    _RName_Font=None
    _NName_Font=None
    
    UserColors=[
        'gray',
        'red',
        'green',
        'blue',
        'orange',
        None,
        None,
        None,
        None,
        None,
        ]
    
    _ColorList={\
    'cold_grey':                   (0.5000, 0.5400, 0.5300),
    'dim_grey':                    (0.4118, 0.4118, 0.4118),
    'grey':                        (0.7529, 0.7529, 0.7529),
    'light_grey':                  (0.8275, 0.8275, 0.8275),
    'slate_grey':                  (0.4392, 0.5020, 0.5647),
    'slate_grey_dark':             (0.1843, 0.3098, 0.3098),
    'slate_grey_light':            (0.4667, 0.5333, 0.6000),
    'warm_grey':                   (0.5000, 0.5000, 0.4100),
    'black':                       (0.0000, 0.0000, 0.0000),
    'ivory_black':                 (0.1600, 0.1400, 0.1300),
    'lamp_black':                  (0.1800, 0.2800, 0.2300),
    'alizarin_crimson':            (0.8900, 0.1500, 0.2100),
    'brick':                       (0.6100, 0.4000, 0.1200),
    'coral':                       (1.0000, 0.4980, 0.3137),
    'coral_light':                 (0.9412, 0.5020, 0.5020),
    'deep_pink':                   (1.0000, 0.0784, 0.5765),
    'firebrick':                   (0.6980, 0.1333, 0.1333),
    'geranium_lake':               (0.8900, 0.0700, 0.1900),
    'hot_pink':                    (1.0000, 0.4118, 0.7059),
    'light_salmon':                (1.0000, 0.6275, 0.4784),
    'madder_lake_deep':            (0.8900, 0.1800, 0.1900),
    'maroon':                      (0.6902, 0.1882, 0.3765),
    'pink':                        (1.0000, 0.7529, 0.7961),
    'pink_light':                  (1.0000, 0.7137, 0.7569),
    'raspberry':                   (0.5300, 0.1500, 0.3400),
    'rose_madder':                 (0.8900, 0.2100, 0.2200),
    'salmon':                      (0.9804, 0.5020, 0.4471),
    'tomato':                      (1.0000, 0.3882, 0.2784),
    'beige':                       (0.6400, 0.5800, 0.5000),
    'brown':                       (0.5000, 0.1647, 0.1647),
    'brown_madder':                (0.8600, 0.1600, 0.1600),
    'brown_ochre':                 (0.5300, 0.2600, 0.1200),
    'burlywood':                   (0.8706, 0.7216, 0.5294),
    'burnt_sienna':                (0.5400, 0.2100, 0.0600),
    'burnt_umber':                 (0.5400, 0.2000, 0.1400),
    'chocolate':                   (0.8235, 0.4118, 0.1176),
    'deep_ochre':                  (0.4500, 0.2400, 0.1000),
    'flesh':                       (1.0000, 0.4900, 0.2500),
    'flesh_ochre':                 (1.0000, 0.3400, 0.1300),
    'gold_ochre':                  (0.7800, 0.4700, 0.1500),
    'greenish_umber':              (1.0000, 0.2400, 0.0500),
    'khaki':                       (0.9412, 0.9020, 0.5490),
    'khaki_dark':                  (0.7412, 0.7176, 0.4196),
    'light_beige':                 (0.9608, 0.9608, 0.8627),
    'peru':                        (0.8039, 0.5216, 0.2471),
    'rosy_brown':                  (0.7373, 0.5608, 0.5608),
    'raw_sienna':                  (0.7800, 0.3800, 0.0800),
    'raw_umber':                   (0.4500, 0.2900, 0.0700),
    'sepia':                       (0.3700, 0.1500, 0.0700),
    'sienna':                      (0.6275, 0.3216, 0.1765),
    'saddle_brown':                (0.5451, 0.2706, 0.0745),
    'sandy_brown':                 (0.9569, 0.6431, 0.3765),
    'tan':                         (0.8235, 0.7059, 0.5490),
    'van_dyke_brown':              (0.3700, 0.1500, 0.0200),
    'cadmium_orange':              (1.0000, 0.3800, 0.0100),
    'carrot':                      (0.9300, 0.5700, 0.1300),
    'dark_orange':                 (1.0000, 0.5490, 0.0000),
    'mars_orange':                 (0.5900, 0.2700, 0.0800),
    'mars_yellow':                 (0.8900, 0.4400, 0.1000),
    'orange':                      (1.0000, 0.5000, 0.0000),
    'orange_red':                  (1.0000, 0.2706, 0.0000),
    'yellow_ochre':                (0.8900, 0.5100, 0.0900),
    'aureoline_yellow':            (1.0000, 0.6600, 0.1400),
    'banana':                      (0.8900, 0.8100, 0.3400),
    'cadmium_lemon':               (1.0000, 0.8900, 0.0100),
    'cadmium_yellow':              (1.0000, 0.6000, 0.0700),
    'cadmium_yellow_light':        (1.0000, 0.6900, 0.0600),
    'gold':                        (1.0000, 0.8431, 0.0000),
    'goldenrod':                   (0.8549, 0.6471, 0.1255),
    'goldenrod_dark':              (0.7216, 0.5255, 0.0431),
    'goldenrod_light':             (0.9804, 0.9804, 0.8235),
    'goldenrod_pale':              (0.9333, 0.9098, 0.6667),
    'light_goldenrod':             (0.9333, 0.8667, 0.5098),
    'melon':                       (0.8900, 0.6600, 0.4100),
    'naples_yellow_deep':          (1.0000, 0.6600, 0.0700),
    'yellow':                      (1.0000, 1.0000, 0.0000),
    'yellow_light':                (1.0000, 1.0000, 0.8784),
    'chartreuse':                  (0.4980, 1.0000, 0.0000),
    'chrome_oxide_green':          (0.4000, 0.5000, 0.0800),
    'cinnabar_green':              (0.3800, 0.7000, 0.1600),
    'cobalt_green':                (0.2400, 0.5700, 0.2500),
    'emerald_green':               (0.0000, 0.7900, 0.3400),
    'forest_green':                (0.1333, 0.5451, 0.1333),
    'green':                       (0.0000, 1.0000, 0.0000),
    'green_dark':                  (0.0000, 0.3922, 0.0000),
    'green_pale':                  (0.5961, 0.9843, 0.5961),
    'green_yellow':                (0.6784, 1.0000, 0.1843),
    'lawn_green':                  (0.4863, 0.9882, 0.0000),
    'lime_green':                  (0.1961, 0.8039, 0.1961),
    'mint':                        (0.7400, 0.9900, 0.7900),
    'olive':                       (0.2300, 0.3700, 0.1700),
    'olive_drab':                  (0.4196, 0.5569, 0.1373),
    'olive_green_dark':            (0.3333, 0.4196, 0.1843),
    'permanent_green':             (0.0400, 0.7900, 0.1700),
    'sap_green':                   (0.1900, 0.5000, 0.0800),
    'sea_green':                   (0.1804, 0.5451, 0.3412),
    'sea_green_dark':              (0.5608, 0.7373, 0.5608),
    'sea_green_medium':            (0.2353, 0.7020, 0.4431),
    'sea_green_light':             (0.1255, 0.6980, 0.6667),
    'spring_green':                (0.0000, 1.0000, 0.4980),
    'spring_green_medium':         (0.0000, 0.9804, 0.6039),
    'terre_verte':                 (0.2200, 0.3700, 0.0600),
    'viridian_light':              (0.4300, 1.0000, 0.4400),
    'yellow_green':                (0.6039, 0.8039, 0.1961),
    'aquamarine':                  (0.4980, 1.0000, 0.8314),
    'aquamarine_medium':           (0.4000, 0.8039, 0.6667),
    'cyan':                        (0.0000, 1.0000, 1.0000),
    'cyan_white':                  (0.8784, 1.0000, 1.0000),
    'turquoise':                   (0.2510, 0.8784, 0.8157),
    'turquoise_dark':              (0.0000, 0.8078, 0.8196),
    'turquoise_medium':            (0.2824, 0.8196, 0.8000),
    'turquoise_pale':              (0.6863, 0.9333, 0.9333),
    'alice_blue':                  (0.9412, 0.9725, 1.0000),
    'blue':                        (0.0000, 0.0000, 1.0000),
    'blue_light':                  (0.6784, 0.8471, 0.9020),
    'blue_medium':                 (0.0000, 0.0000, 0.8039),
    'cadet':                       (0.3725, 0.6196, 0.6275),
    'cobalt':                      (0.2400, 0.3500, 0.6700),
    'cornflower':                  (0.3922, 0.5843, 0.9294),
    'cerulean':                    (0.0200, 0.7200, 0.8000),
    'dodger_blue':                 (0.1176, 0.5647, 1.0000),
    'indigo':                      (0.0300, 0.1800, 0.3300),
    'manganese_blue':              (0.0100, 0.6600, 0.6200),
    'midnight_blue':               (0.0980, 0.0980, 0.4392),
    'navy':                        (0.0000, 0.0000, 0.5020),
    'peacock':                     (0.2000, 0.6300, 0.7900),
    'powder_blue':                 (0.6902, 0.8784, 0.9020),
    'royal_blue':                  (0.2549, 0.4118, 0.8824),
    'slate_blue':                  (0.4157, 0.3529, 0.8039),
    'slate_blue_dark':             (0.2824, 0.2392, 0.5451),
    'slate_blue_light':            (0.5176, 0.4392, 1.0000),
    'slate_blue_medium':           (0.4824, 0.4078, 0.9333),
    'sky_blue':                    (0.5294, 0.8078, 0.9216),
    'sky_blue_deep':               (0.0000, 0.7490, 1.0000),
    'sky_blue_light':              (0.5294, 0.8078, 0.9804),
    'steel_blue':                  (0.2745, 0.5098, 0.7059),
    'steel_blue_light':            (0.6902, 0.7686, 0.8706),
    'turquoise_blue':              (0.0000, 0.7800, 0.5500),
    'ultramarine':                 (0.0700, 0.0400, 0.5600),
    'blue_violet':                 (0.5412, 0.1686, 0.8863),
    'cobalt_violet_deep':          (0.5700, 0.1300, 0.6200),
    'magenta':                     (1.0000, 0.0000, 1.0000),
    'orchid':                      (0.8549, 0.4392, 0.8392),
    'orchid_dark':                 (0.6000, 0.1961, 0.8000),
    'orchid_medium':               (0.7294, 0.3333, 0.8275),
    'permanent_red_violet':        (0.8600, 0.1500, 0.2700),
    'plum':                        (0.8667, 0.6275, 0.8667),
    'purple':                      (0.6275, 0.1255, 0.9412),
    'purple_medium':               (0.5765, 0.4392, 0.8588),
    'ultramarine_violet':          (0.3600, 0.1400, 0.4300),
    'violet':                      (0.5600, 0.3700, 0.6000),
    'violet_dark':                 (0.5804, 0.0000, 0.8275),
    'violet_red':                  (0.8157, 0.1255, 0.5647),
    'violet_red_medium':           (0.7804, 0.0824, 0.5216),
    'violet_red_pale':             (0.8588, 0.4392, 0.5765),
    } 

    _ReservedNames=CGK.cgnsnames
    _ReservedTypes=CGK.cgnstypes

    _SortedTypeList=[\
    CGK.CGNSTree_ts,
    CGK.Family_ts,
    CGK.FamilyName_ts,
    CGK.CGNSBase_ts,
    CGK.Zone_ts,
    CGK.ZoneType_ts,
    CGK.GridCoordinates_ts,
    CGK.Elements_ts,
    CGK.ZoneBC_ts,
    CGK.AdditionalExponents_ts,
    CGK.AdditionalUnits_ts,
    CGK.ArbitraryGridMotionType_ts,
    CGK.ArbitraryGridMotion_ts,
    CGK.AreaType_ts,
    CGK.Area_ts,
    CGK.AverageInterfaceType_ts,
    CGK.AverageInterface_ts,
    CGK.Axisymmetry_ts,
    CGK.BCDataSet_ts,
    CGK.BCData_ts,
    CGK.BCProperty_ts,
    CGK.BCTypeSimple_ts,
    CGK.BCType_ts,
    CGK.BC_ts,
    CGK.BaseIterativeData_ts,
    CGK.ChemicalKineticsModelType_ts,
    CGK.ChemicalKineticsModel_ts,
    CGK.ConvergenceHistory_ts,
    CGK.DataArray_ts,
    CGK.DataClass_ts,
    CGK.DataConversion_ts,
    CGK.DataType_ts,
    CGK.Descriptor_ts,
    CGK.DiffusionModel_ts,
    CGK.DimensionalExponents_ts,
    CGK.DimensionalUnits_ts,
    CGK.DiscreteData_ts,
    CGK.EMConductivityModelType_ts,
    CGK.EMConductivityModel_ts,
    CGK.EMElectricFieldModelType_ts,
    CGK.EMElectricFieldModel_ts,
    CGK.EMMagneticFieldModelType_ts,
    CGK.EMMagneticFieldModel_ts,
    CGK.ElementType_ts,
    CGK.EquationDimension_ts,
    CGK.FamilyBC_ts,
    CGK.FlowEquationSet_ts,
    CGK.FlowSolution_ts,
    CGK.GasModelType_ts,
    CGK.GasModel_ts,
    CGK.GeometryEntity_ts,
    CGK.GeometryFile_ts,
    CGK.GeometryFormat_ts,
    CGK.GeometryReference_ts,
    CGK.GoverningEquationsType_ts,
    CGK.GoverningEquations_ts,
    CGK.Gravity_ts,
    CGK.GridConnectivity1to1_ts,
    CGK.GridConnectivityProperty_ts,
    CGK.GridConnectivityType_ts,
    CGK.GridConnectivity_ts,
    CGK.GridLocation_ts,
    CGK.IndexArray_ts,
    CGK.IndexRange_ts,
    CGK.IntegralData_ts,
    CGK.InwardNormalIndex_ts,
    CGK.InwardNormalList_ts,
    CGK.Ordinal_ts,
    CGK.OversetHoles_ts,
    CGK.Periodic_ts,
    CGK.ReferenceState_ts,
    CGK.RigidGridMotionType_ts,
    CGK.RigidGridMotion_ts,
    CGK.Rind_ts,
    CGK.RotatingCoordinates_ts,
    CGK.SimulationType_ts,
    CGK.ThermalConductivityModelType_ts,
    CGK.ThermalConductivityModel_ts,
    CGK.ThermalRelaxationModelType_ts,
    CGK.ThermalRelaxationModel_ts,
    CGK.Transform_ts,
    CGK.TurbulenceClosureType_ts,
    CGK.TurbulenceClosure_ts,
    CGK.TurbulenceModelType_ts,
    CGK.TurbulenceModel_ts,
    CGK.UserDefinedData_ts,
    CGK.ViscosityModelType_ts,
    CGK.ViscosityModel_ts,
    CGK.WallFunctionType_ts,
    CGK.WallFunction_ts,
    CGK.ZoneGridConnectivity_ts,
    CGK.ZoneIterativeData_ts,
    CGK.CGNSLibraryVersion_ts,
    ]

    _UsualQueries=[

# --- Search -----------------------------------------------------------
('Node name',
 'Search by',
 'RESULT=(NAME==ARGS[0])',
 """
Search by
Node name

Search all nodes with the exact NAME as argument.

The argument name need not to be a tuple or to have quotes,
all the following values are ok and would match the NAME <i>ZoneType</i>:

ZoneType
'ZoneType'
('ZoneType',)
"""),

('Wildcard node name',
 'Search by',
"""import fnmatch
RESULT=fnmatch.fnmatchcase(NAME,ARGS[0])
""",
"""
Search by
Wildcard node name

Search all nodes with the wildcard NAME as argument.

Warning: the <b>argument name</b> should be quoted:

'BC*' is ok

BC* would fail
"""),
        
('Node type',
 'Search by',
 'RESULT=(SIDSTYPE==ARGS[0])',
 """search all nodes with argument SIDS type."""),

('Wildcard node type',
 'Search by',
"""
import fnmatch
RESULT=fnmatch.fnmatchcase(SIDSTYPE,ARGS[0])
""",
"""
Search by
Wildcard node type

Search all nodes with wildcard argument SIDS type.
Warning: the <b>argument type</b> should be quoted:

'Turb*' is ok

Turb* would fail
"""),

('Non-MT UserDefinedData',
 'Search by',
"""
if (    (SIDSTYPE==CGK.UserDefinedData_ts)
    and (CGU.getValueDataType(NODE)!=CGK.MT)):
  RESULT=True
""",
"""
Search by
Valued UserDefinedData

Search all <b>UserDefinedData_t</b> nodes with a non-<b>MT</b> data type.

No argument.
"""),

# --- Replace

('Valued UserDefinedData',
 'Replace',"""
if (     (SIDSTYPE==CGK.UserDefinedData_ts)
     and (CGU.getValueDataType(NODE)!=CGK.MT)):
  NODE[3]=CGK.DataArray_ts
  RESULT=True
""",
"""
Replace
Valued UserDefinedData

Search all <b>UserDefinedData_t</b> nodes with a non-<b>MT</b> data type
 and replace them as <b>DataArray_t</b>."""),

('Substitute Zone name',
 'Replace',"""
l1=len(ARGS[0])
if ((SIDSTYPE==CGK.Zone_ts) and (NAME[:l1]==ARGS[0])):
  NODE[0]=ARGS[1]+NODE[0][l1:]
  RESULT=True

if (CGU.getValueDataType(NODE)==CGK.C1):
  v=VALUE.tostring()
  if (v[:l1]==ARGS[0]):
    v=ARGS[1]+v[l1:]
    NODE[1]=CGU.setStringAsArray(v)
    RESULT=True
""",
"""
<h1>Replace</h1>
<h2>Substitute Zone name</h2>
<p>
Search all <b>Zone_t</b> nodes with a name pattern, then rename the
zone with the substitution pattern. Any other reference in the tree,
as a connectivity value for example, is subsitued as well.
<p>
Argument is a tuple with the first pattern to find and
the second as the subsitution pattern. For example:
<pre>
('domain.','zone#')
</pre>
"""),

# --- Find Elements_t
('QUADs',
 'Find Elements_t',
 """if (SIDSTYPE==CGK.Elements_ts):
   RESULT=VALUE[0] in (CGK.QUAD_4, CGK.QUAD_8, CGK.QUAD_9)
 """,
 """Find all <b>Elements_t</b> nodes of type <b>QUAD</b>"""),

('TRIs',
 'Find Elements_t',
 """if (SIDSTYPE==CGK.Elements_ts):
   RESULT=VALUE[0] in (CGK.TRI_3, CGK.TRI_6)
 """,
 """Find all <b>Elements_t</b> nodes of type <b>TRI</b>"""),

('NGONs',
 'Find Elements_t',
 """if (SIDSTYPE==CGK.Elements_ts):
   RESULT=VALUE[0] in (CGK.NGON_n,)
 """,
 """Find all <b>Elements_t</b> nodes of type <b>NGON_n</b>"""),

    ]

    # -----------------------------------------------------------------
    @classmethod
    def _setOption(cls,name,value):
        setattr(cls,name,value)
    @classmethod
    def _writeFile(cls,tag,name,udata,filename,prefix=""):
      #print '### CGNS.NAV update',filename
      gdate=strftime("%Y-%m-%d %H:%M:%S", gmtime())
      s="""# %s - %s file - Generated %s\n%s\n%s="""%\
         (cls._ToolName,tag,gdate,prefix,name)
      if (type(udata)==dict):
        s+="""{\n"""
        for k in udata:
          if (k[0]!='_'):
            val=str(udata[k])
            if (type(udata[k]) in [unicode, str]): val="'%s'"%str(udata[k])
            s+="""'%s':%s,\n"""%(k,val)
        s+="""}\n\n# --- last line\n"""
      elif (type(udata)==list):
        s+="""[\n"""
        for k in udata:
          s+="""%s,\n"""%(k)
        s+="""]\n\n# --- last line\n"""
      cls._crpath(filename)
      f=open(filename,'w+')
      f.write(s)
      f.close()
    @classmethod
    def _readFile(cls,name,filename):
      #print '### CGNS.NAV read  ',filename
      dpath='/tmp/pyCGNS.tmp:%d.%s'%(os.getpid(),time())
      try:
        os.mkdir(dpath)
      except OSError:
        pass
      try:
        shutil.copyfile(filename,dpath+'/%s.py'%name)
      except IOError:
        shutil.rmtree(dpath)    
        return None
      sprev=sys.path
      sys.path=[dpath]+sys.path
      #try:
      #  return sys.modules[name]
      #except KeyError:
      #  pass
      fp, pathname, description = imp.find_module(name)
      try:
        mod=imp.load_module(name, fp, pathname, description)
      finally:
        if fp:
           fp.close()
      shutil.rmtree(dpath)
      sys.path=sprev
      return mod
    @classmethod
    def _crpath(cls,path):
      p=os.path.dirname(path)
      if (OP.exists(p)): return True
      os.makedirs(p)
    @classmethod
    def _trpath(cls,path):
      return OP.normpath(OP.expanduser(OP.expandvars(path)))
    @classmethod
    def _writeHistory(cls,control):
      filename=cls._trpath(cls._HistoryFileName)
      cls._writeFile('History','history',control._history,filename)
    @classmethod
    def _readHistory(cls,control):
      filename=cls._trpath(cls._HistoryFileName)
      m=cls._readFile('history',filename)
      if (m is None): return None
      return m.history
    @classmethod
    def _writeOptions(cls,control):
      filename=cls._trpath(cls._OptionsFileName)
      cls._writeFile('User options','options',control._options,filename)
    @classmethod
    def _readOptions(cls,control):
      filename=cls._trpath(cls._OptionsFileName)
      m=cls._readFile('options',filename)
      if (m is None): return None
      return m.options
    @classmethod
    def _writeQueries(cls,control,q):
      filename=cls._trpath(cls.QueriesDirectory+'/'+cls._QueriesDefaultFile)
      cls._writeFile('User queries','queries',q,filename,Q_FILE_PRE)
    @classmethod
    def _readQueries(cls,control):
      filename=cls._trpath(cls.QueriesDirectory+'/'+cls._QueriesDefaultFile)
      m=cls._readFile('queries',filename)
      if (m is None): return None
      return m.queries
    def __init__(self):
      pass
    def __getitem__(self,name):
      if (name[0]!='_'): return Q7OptionContext.__dict__[name]
      return None
    def __setitem__(self,name,value):
      if (name[0]!='_'): setattr(Q7OptionContext,name,value)
      return None
    def __iter__(self):
      for o in dir(self):
        if (o[0]!='_'): yield o
    def _nextName(self):
      for o in dir(self):
        if (o[0]!='_'): yield o
      
# -----------------------------------------------------------------
