# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'CGNS/NAV/T/Q7ToolsWindow.ui'
#
# Created: Fri Jan 15 11:27:36 2016
#      by: pyside-uic 0.2.15 running on PySide 1.2.1
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_Q7ToolsWindow(object):
    def setupUi(self, Q7ToolsWindow):
        Q7ToolsWindow.setObjectName("Q7ToolsWindow")
        Q7ToolsWindow.setWindowModality(QtCore.Qt.NonModal)
        Q7ToolsWindow.resize(580, 364)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Fixed, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(Q7ToolsWindow.sizePolicy().hasHeightForWidth())
        Q7ToolsWindow.setSizePolicy(sizePolicy)
        Q7ToolsWindow.setMinimumSize(QtCore.QSize(580, 364))
        Q7ToolsWindow.setMaximumSize(QtCore.QSize(580, 364))
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/images/icons/cgSpy.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        Q7ToolsWindow.setWindowIcon(icon)
        self.verticalLayout = QtGui.QVBoxLayout(Q7ToolsWindow)
        self.verticalLayout.setObjectName("verticalLayout")
        self.horizontalLayout_2 = QtGui.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.tabWidget = QtGui.QTabWidget(Q7ToolsWindow)
        self.tabWidget.setEnabled(True)
        self.tabWidget.setObjectName("tabWidget")
        self.search = QtGui.QWidget()
        self.search.setObjectName("search")
        self.verticalLayoutWidget = QtGui.QWidget(self.search)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(5, 5, 541, 271))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout_2 = QtGui.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.groupBox = QtGui.QGroupBox(self.verticalLayoutWidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Minimum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.groupBox.sizePolicy().hasHeightForWidth())
        self.groupBox.setSizePolicy(sizePolicy)
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.bSaveAsQuery = QtGui.QPushButton(self.groupBox)
        self.bSaveAsQuery.setGeometry(QtCore.QRect(350, 235, 24, 24))
        self.bSaveAsQuery.setMinimumSize(QtCore.QSize(24, 24))
        self.bSaveAsQuery.setMaximumSize(QtCore.QSize(24, 24))
        self.bSaveAsQuery.setText("")
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(":/images/icons/operate-save.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bSaveAsQuery.setIcon(icon1)
        self.bSaveAsQuery.setObjectName("bSaveAsQuery")
        self.eSaveAsQuery = QtGui.QLineEdit(self.groupBox)
        self.eSaveAsQuery.setGeometry(QtCore.QRect(80, 235, 261, 21))
        self.eSaveAsQuery.setObjectName("eSaveAsQuery")
        self.sLevel = QtGui.QSlider(self.groupBox)
        self.sLevel.setGeometry(QtCore.QRect(420, 100, 16, 56))
        self.sLevel.setMaximum(2)
        self.sLevel.setSliderPosition(1)
        self.sLevel.setOrientation(QtCore.Qt.Vertical)
        self.sLevel.setInvertedAppearance(True)
        self.sLevel.setInvertedControls(True)
        self.sLevel.setTickPosition(QtGui.QSlider.TicksAbove)
        self.sLevel.setObjectName("sLevel")
        self.label_7 = QtGui.QLabel(self.groupBox)
        self.label_7.setGeometry(QtCore.QRect(360, 95, 53, 15))
        self.label_7.setObjectName("label_7")
        self.label_8 = QtGui.QLabel(self.groupBox)
        self.label_8.setGeometry(QtCore.QRect(360, 120, 53, 15))
        font = QtGui.QFont()
        font.setWeight(75)
        font.setBold(True)
        self.label_8.setFont(font)
        self.label_8.setObjectName("label_8")
        self.label_14 = QtGui.QLabel(self.groupBox)
        self.label_14.setGeometry(QtCore.QRect(360, 145, 53, 15))
        self.label_14.setObjectName("label_14")
        self.gCriteria = QtGui.QGroupBox(self.groupBox)
        self.gCriteria.setGeometry(QtCore.QRect(10, 10, 336, 196))
        self.gCriteria.setObjectName("gCriteria")
        self.label_9 = QtGui.QLabel(self.gCriteria)
        self.label_9.setGeometry(QtCore.QRect(15, 30, 76, 16))
        self.label_9.setObjectName("label_9")
        self.eName = QtGui.QLineEdit(self.gCriteria)
        self.eName.setGeometry(QtCore.QRect(75, 25, 181, 21))
        self.eName.setObjectName("eName")
        self.cDataCheck = QtGui.QGroupBox(self.gCriteria)
        self.cDataCheck.setEnabled(True)
        self.cDataCheck.setGeometry(QtCore.QRect(10, 85, 316, 106))
        self.cDataCheck.setCheckable(True)
        self.cDataCheck.setChecked(False)
        self.cDataCheck.setObjectName("cDataCheck")
        self.cDataType = QtGui.QComboBox(self.cDataCheck)
        self.cDataType.setGeometry(QtCore.QRect(65, 40, 41, 22))
        self.cDataType.setObjectName("cDataType")
        self.label_11 = QtGui.QLabel(self.cDataCheck)
        self.label_11.setGeometry(QtCore.QRect(10, 45, 76, 16))
        self.label_11.setObjectName("label_11")
        self.label_12 = QtGui.QLabel(self.cDataCheck)
        self.label_12.setGeometry(QtCore.QRect(10, 75, 76, 16))
        self.label_12.setObjectName("label_12")
        self.eValue = QtGui.QLineEdit(self.cDataCheck)
        self.eValue.setGeometry(QtCore.QRect(65, 15, 181, 21))
        self.eValue.setObjectName("eValue")
        self.label_13 = QtGui.QLabel(self.cDataCheck)
        self.label_13.setGeometry(QtCore.QRect(10, 20, 76, 16))
        self.label_13.setObjectName("label_13")
        self.eMaxSize = QtGui.QSpinBox(self.cDataCheck)
        self.eMaxSize.setGeometry(QtCore.QRect(65, 70, 81, 22))
        self.eMaxSize.setAlignment(QtCore.Qt.AlignRight|QtCore.Qt.AlignTrailing|QtCore.Qt.AlignVCenter)
        self.eMaxSize.setProperty("value", 65)
        self.eMaxSize.setObjectName("eMaxSize")
        self.cRegexpValue = QtGui.QPushButton(self.cDataCheck)
        self.cRegexpValue.setGeometry(QtCore.QRect(250, 15, 24, 24))
        self.cRegexpValue.setMinimumSize(QtCore.QSize(24, 24))
        self.cRegexpValue.setMaximumSize(QtCore.QSize(24, 24))
        self.cRegexpValue.setText("")
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(":/images/icons/regexp.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.cRegexpValue.setIcon(icon2)
        self.cRegexpValue.setCheckable(True)
        self.cRegexpValue.setObjectName("cRegexpValue")
        self.cNotValue = QtGui.QPushButton(self.cDataCheck)
        self.cNotValue.setGeometry(QtCore.QRect(280, 15, 24, 24))
        self.cNotValue.setMinimumSize(QtCore.QSize(24, 24))
        self.cNotValue.setMaximumSize(QtCore.QSize(24, 24))
        self.cNotValue.setText("")
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(":/images/icons/delete.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.cNotValue.setIcon(icon3)
        self.cNotValue.setCheckable(True)
        self.cNotValue.setObjectName("cNotValue")
        self.cNotDataType = QtGui.QPushButton(self.cDataCheck)
        self.cNotDataType.setGeometry(QtCore.QRect(280, 45, 24, 24))
        self.cNotDataType.setMinimumSize(QtCore.QSize(24, 24))
        self.cNotDataType.setMaximumSize(QtCore.QSize(24, 24))
        self.cNotDataType.setText("")
        self.cNotDataType.setIcon(icon3)
        self.cNotDataType.setCheckable(True)
        self.cNotDataType.setObjectName("cNotDataType")
        self.label_10 = QtGui.QLabel(self.gCriteria)
        self.label_10.setGeometry(QtCore.QRect(15, 60, 76, 16))
        self.label_10.setObjectName("label_10")
        self.cSIDStype = QtGui.QComboBox(self.gCriteria)
        self.cSIDStype.setGeometry(QtCore.QRect(75, 55, 181, 22))
        self.cSIDStype.setEditable(True)
        self.cSIDStype.setObjectName("cSIDStype")
        self.cRegexpName = QtGui.QPushButton(self.gCriteria)
        self.cRegexpName.setGeometry(QtCore.QRect(260, 25, 24, 24))
        self.cRegexpName.setMinimumSize(QtCore.QSize(24, 24))
        self.cRegexpName.setMaximumSize(QtCore.QSize(24, 24))
        self.cRegexpName.setText("")
        self.cRegexpName.setIcon(icon2)
        self.cRegexpName.setCheckable(True)
        self.cRegexpName.setObjectName("cRegexpName")
        self.cNotName = QtGui.QPushButton(self.gCriteria)
        self.cNotName.setGeometry(QtCore.QRect(290, 25, 24, 24))
        self.cNotName.setMinimumSize(QtCore.QSize(24, 24))
        self.cNotName.setMaximumSize(QtCore.QSize(24, 24))
        self.cNotName.setText("")
        self.cNotName.setIcon(icon3)
        self.cNotName.setCheckable(True)
        self.cNotName.setObjectName("cNotName")
        self.cRegexpSIDStype = QtGui.QPushButton(self.gCriteria)
        self.cRegexpSIDStype.setGeometry(QtCore.QRect(260, 55, 24, 24))
        self.cRegexpSIDStype.setMinimumSize(QtCore.QSize(24, 24))
        self.cRegexpSIDStype.setMaximumSize(QtCore.QSize(24, 24))
        self.cRegexpSIDStype.setText("")
        self.cRegexpSIDStype.setIcon(icon2)
        self.cRegexpSIDStype.setCheckable(True)
        self.cRegexpSIDStype.setObjectName("cRegexpSIDStype")
        self.cNotSIDStype = QtGui.QPushButton(self.gCriteria)
        self.cNotSIDStype.setGeometry(QtCore.QRect(290, 55, 24, 24))
        self.cNotSIDStype.setMinimumSize(QtCore.QSize(24, 24))
        self.cNotSIDStype.setMaximumSize(QtCore.QSize(24, 24))
        self.cNotSIDStype.setText("")
        self.cNotSIDStype.setIcon(icon3)
        self.cNotSIDStype.setCheckable(True)
        self.cNotSIDStype.setObjectName("cNotSIDStype")
        self.rAddToCurrent = QtGui.QRadioButton(self.groupBox)
        self.rAddToCurrent.setGeometry(QtCore.QRect(355, 15, 176, 20))
        self.rAddToCurrent.setChecked(True)
        self.rAddToCurrent.setObjectName("rAddToCurrent")
        self.rClearCurrent = QtGui.QRadioButton(self.groupBox)
        self.rClearCurrent.setGeometry(QtCore.QRect(355, 55, 171, 20))
        self.rClearCurrent.setObjectName("rClearCurrent")
        self.rWithinCurrent = QtGui.QRadioButton(self.groupBox)
        self.rWithinCurrent.setGeometry(QtCore.QRect(355, 35, 156, 20))
        self.rWithinCurrent.setObjectName("rWithinCurrent")
        self.bRunSearch = QtGui.QPushButton(self.groupBox)
        self.bRunSearch.setGeometry(QtCore.QRect(350, 175, 24, 24))
        self.bRunSearch.setMinimumSize(QtCore.QSize(24, 24))
        self.bRunSearch.setMaximumSize(QtCore.QSize(24, 24))
        self.bRunSearch.setText("")
        icon4 = QtGui.QIcon()
        icon4.addPixmap(QtGui.QPixmap(":/images/icons/operate-execute.gif"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bRunSearch.setIcon(icon4)
        self.bRunSearch.setObjectName("bRunSearch")
        self.line = QtGui.QFrame(self.groupBox)
        self.line.setGeometry(QtCore.QRect(10, 215, 516, 16))
        self.line.setFrameShape(QtGui.QFrame.HLine)
        self.line.setFrameShadow(QtGui.QFrame.Sunken)
        self.line.setObjectName("line")
        self.label_19 = QtGui.QLabel(self.groupBox)
        self.label_19.setGeometry(QtCore.QRect(40, 240, 53, 15))
        self.label_19.setObjectName("label_19")
        self.bFindQuery = QtGui.QPushButton(self.groupBox)
        self.bFindQuery.setGeometry(QtCore.QRect(10, 235, 24, 24))
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(24)
        sizePolicy.setVerticalStretch(24)
        sizePolicy.setHeightForWidth(self.bFindQuery.sizePolicy().hasHeightForWidth())
        self.bFindQuery.setSizePolicy(sizePolicy)
        self.bFindQuery.setMinimumSize(QtCore.QSize(24, 24))
        self.bFindQuery.setMaximumSize(QtCore.QSize(24, 24))
        self.bFindQuery.setText("")
        icon5 = QtGui.QIcon()
        icon5.addPixmap(QtGui.QPixmap(":/images/icons/zoompoint.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bFindQuery.setIcon(icon5)
        self.bFindQuery.setObjectName("bFindQuery")
        self.eWithLinks = QtGui.QCheckBox(self.groupBox)
        self.eWithLinks.setGeometry(QtCore.QRect(385, 180, 111, 20))
        self.eWithLinks.setChecked(True)
        self.eWithLinks.setObjectName("eWithLinks")
        self.verticalLayout_2.addWidget(self.groupBox)
        self.tabWidget.addTab(self.search, "")
        self.diff = QtGui.QWidget()
        self.diff.setObjectName("diff")
        self.gdiff = QtGui.QGroupBox(self.diff)
        self.gdiff.setGeometry(QtCore.QRect(5, 5, 541, 266))
        self.gdiff.setObjectName("gdiff")
        self.label = QtGui.QLabel(self.gdiff)
        self.label.setGeometry(QtCore.QRect(25, 25, 58, 16))
        self.label.setObjectName("label")
        self.cAncestor = QtGui.QComboBox(self.gdiff)
        self.cAncestor.setGeometry(QtCore.QRect(15, 45, 81, 22))
        self.cAncestor.setObjectName("cAncestor")
        self.cVersionA = QtGui.QComboBox(self.gdiff)
        self.cVersionA.setGeometry(QtCore.QRect(140, 45, 81, 22))
        self.cVersionA.setObjectName("cVersionA")
        self.label_2 = QtGui.QLabel(self.gdiff)
        self.label_2.setGeometry(QtCore.QRect(150, 25, 58, 16))
        self.label_2.setObjectName("label_2")
        self.cShowA = QtGui.QCheckBox(self.gdiff)
        self.cShowA.setEnabled(False)
        self.cShowA.setGeometry(QtCore.QRect(235, 45, 176, 21))
        self.cShowA.setCheckable(True)
        self.cShowA.setChecked(False)
        self.cShowA.setObjectName("cShowA")
        self.bDiff = QtGui.QPushButton(self.gdiff)
        self.bDiff.setGeometry(QtCore.QRect(395, 45, 25, 25))
        self.bDiff.setMinimumSize(QtCore.QSize(25, 25))
        self.bDiff.setMaximumSize(QtCore.QSize(25, 25))
        self.bDiff.setText("")
        icon6 = QtGui.QIcon()
        icon6.addPixmap(QtGui.QPixmap(":/images/icons/operate-execute.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bDiff.setIcon(icon6)
        self.bDiff.setObjectName("bDiff")
        self.tabWidget.addTab(self.diff, "")
        self.merge = QtGui.QWidget()
        self.merge.setObjectName("merge")
        self.gdiff_2 = QtGui.QGroupBox(self.merge)
        self.gdiff_2.setEnabled(False)
        self.gdiff_2.setGeometry(QtCore.QRect(5, 5, 541, 266))
        self.gdiff_2.setObjectName("gdiff_2")
        self.bMerge = QtGui.QPushButton(self.gdiff_2)
        self.bMerge.setGeometry(QtCore.QRect(415, 130, 25, 25))
        self.bMerge.setMinimumSize(QtCore.QSize(25, 25))
        self.bMerge.setMaximumSize(QtCore.QSize(25, 25))
        self.bMerge.setText("")
        self.bMerge.setIcon(icon6)
        self.bMerge.setObjectName("bMerge")
        self.groupBox_5 = QtGui.QGroupBox(self.gdiff_2)
        self.groupBox_5.setGeometry(QtCore.QRect(150, 20, 386, 81))
        self.groupBox_5.setObjectName("groupBox_5")
        self.cTreeA = QtGui.QComboBox(self.groupBox_5)
        self.cTreeA.setGeometry(QtCore.QRect(10, 20, 81, 22))
        self.cTreeA.setObjectName("cTreeA")
        self.rForceA = QtGui.QRadioButton(self.groupBox_5)
        self.rForceA.setGeometry(QtCore.QRect(160, 15, 201, 21))
        self.rForceA.setObjectName("rForceA")
        self.rAncestorA = QtGui.QRadioButton(self.groupBox_5)
        self.rAncestorA.setGeometry(QtCore.QRect(160, 35, 226, 21))
        self.rAncestorA.setObjectName("rAncestorA")
        self.ePrefixA = QtGui.QLineEdit(self.groupBox_5)
        self.ePrefixA.setGeometry(QtCore.QRect(10, 50, 76, 22))
        self.ePrefixA.setObjectName("ePrefixA")
        self.label_5 = QtGui.QLabel(self.groupBox_5)
        self.label_5.setGeometry(QtCore.QRect(90, 50, 58, 16))
        self.label_5.setObjectName("label_5")
        self.groupBox_6 = QtGui.QGroupBox(self.gdiff_2)
        self.groupBox_6.setGeometry(QtCore.QRect(150, 180, 386, 81))
        self.groupBox_6.setObjectName("groupBox_6")
        self.cTreeB = QtGui.QComboBox(self.groupBox_6)
        self.cTreeB.setGeometry(QtCore.QRect(10, 20, 81, 22))
        self.cTreeB.setObjectName("cTreeB")
        self.rForceB = QtGui.QRadioButton(self.groupBox_6)
        self.rForceB.setGeometry(QtCore.QRect(155, 15, 201, 21))
        self.rForceB.setObjectName("rForceB")
        self.rAncestorB = QtGui.QRadioButton(self.groupBox_6)
        self.rAncestorB.setGeometry(QtCore.QRect(155, 35, 226, 21))
        self.rAncestorB.setObjectName("rAncestorB")
        self.ePrefixB = QtGui.QLineEdit(self.groupBox_6)
        self.ePrefixB.setGeometry(QtCore.QRect(10, 50, 76, 22))
        self.ePrefixB.setObjectName("ePrefixB")
        self.label_6 = QtGui.QLabel(self.groupBox_6)
        self.label_6.setGeometry(QtCore.QRect(90, 55, 58, 16))
        self.label_6.setObjectName("label_6")
        self.groupBox_7 = QtGui.QGroupBox(self.gdiff_2)
        self.groupBox_7.setGeometry(QtCore.QRect(5, 100, 381, 76))
        self.groupBox_7.setObjectName("groupBox_7")
        self.cTreeAncestor = QtGui.QComboBox(self.groupBox_7)
        self.cTreeAncestor.setEnabled(False)
        self.cTreeAncestor.setGeometry(QtCore.QRect(10, 30, 81, 22))
        self.cTreeAncestor.setObjectName("cTreeAncestor")
        self.rForceNone = QtGui.QRadioButton(self.groupBox_7)
        self.rForceNone.setGeometry(QtCore.QRect(115, 10, 216, 21))
        self.rForceNone.setObjectName("rForceNone")
        self.rAncestor = QtGui.QRadioButton(self.groupBox_7)
        self.rAncestor.setGeometry(QtCore.QRect(115, 30, 211, 21))
        self.rAncestor.setObjectName("rAncestor")
        self.cAutoMerge = QtGui.QCheckBox(self.gdiff_2)
        self.cAutoMerge.setGeometry(QtCore.QRect(450, 130, 86, 21))
        self.cAutoMerge.setObjectName("cAutoMerge")
        self.tabWidget.addTab(self.merge, "")
        self.Queries = QtGui.QWidget()
        self.Queries.setObjectName("Queries")
        self.label_15 = QtGui.QLabel(self.Queries)
        self.label_15.setGeometry(QtCore.QRect(25, 25, 37, 25))
        self.label_15.setObjectName("label_15")
        self.cGroup = QtGui.QComboBox(self.Queries)
        self.cGroup.setEnabled(True)
        self.cGroup.setGeometry(QtCore.QRect(80, 25, 74, 21))
        self.cGroup.setObjectName("cGroup")
        self.label_16 = QtGui.QLabel(self.Queries)
        self.label_16.setGeometry(QtCore.QRect(25, 55, 36, 25))
        self.label_16.setObjectName("label_16")
        self.cQuery = QtGui.QComboBox(self.Queries)
        self.cQuery.setGeometry(QtCore.QRect(80, 55, 378, 21))
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.cQuery.sizePolicy().hasHeightForWidth())
        self.cQuery.setSizePolicy(sizePolicy)
        self.cQuery.setObjectName("cQuery")
        self.bOperateDoc = QtGui.QPushButton(self.Queries)
        self.bOperateDoc.setGeometry(QtCore.QRect(465, 55, 25, 25))
        self.bOperateDoc.setMinimumSize(QtCore.QSize(25, 25))
        self.bOperateDoc.setMaximumSize(QtCore.QSize(25, 25))
        self.bOperateDoc.setText("")
        icon7 = QtGui.QIcon()
        icon7.addPixmap(QtGui.QPixmap(":/images/icons/operate-doc.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bOperateDoc.setIcon(icon7)
        self.bOperateDoc.setObjectName("bOperateDoc")
        self.label_17 = QtGui.QLabel(self.Queries)
        self.label_17.setGeometry(QtCore.QRect(30, 85, 28, 25))
        self.label_17.setObjectName("label_17")
        self.eUserVariable = QtGui.QLineEdit(self.Queries)
        self.eUserVariable.setGeometry(QtCore.QRect(80, 85, 306, 21))
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.eUserVariable.sizePolicy().hasHeightForWidth())
        self.eUserVariable.setSizePolicy(sizePolicy)
        self.eUserVariable.setObjectName("eUserVariable")
        self.bApply = QtGui.QPushButton(self.Queries)
        self.bApply.setGeometry(QtCore.QRect(505, 245, 25, 25))
        self.bApply.setMinimumSize(QtCore.QSize(25, 25))
        self.bApply.setMaximumSize(QtCore.QSize(25, 25))
        self.bApply.setText("")
        self.bApply.setIcon(icon6)
        self.bApply.setObjectName("bApply")
        self.tabWidget.addTab(self.Queries, "")
        self.horizontalLayout_2.addWidget(self.tabWidget)
        self.verticalLayout.addLayout(self.horizontalLayout_2)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.bInfo = QtGui.QPushButton(Q7ToolsWindow)
        self.bInfo.setMinimumSize(QtCore.QSize(25, 25))
        self.bInfo.setMaximumSize(QtCore.QSize(25, 25))
        self.bInfo.setText("")
        icon8 = QtGui.QIcon()
        icon8.addPixmap(QtGui.QPixmap(":/images/icons/help-view.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bInfo.setIcon(icon8)
        self.bInfo.setObjectName("bInfo")
        self.horizontalLayout.addWidget(self.bInfo)
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.bClose = QtGui.QPushButton(Q7ToolsWindow)
        self.bClose.setObjectName("bClose")
        self.horizontalLayout.addWidget(self.bClose)
        self.verticalLayout.addLayout(self.horizontalLayout)

        self.retranslateUi(Q7ToolsWindow)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(Q7ToolsWindow)

    def retranslateUi(self, Q7ToolsWindow):
        Q7ToolsWindow.setWindowTitle(QtGui.QApplication.translate("Q7ToolsWindow", "Form", None, QtGui.QApplication.UnicodeUTF8))
        self.bSaveAsQuery.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Save as a query", None, QtGui.QApplication.UnicodeUTF8))
        self.label_7.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Ancestor", None, QtGui.QApplication.UnicodeUTF8))
        self.label_8.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Current", None, QtGui.QApplication.UnicodeUTF8))
        self.label_14.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Children", None, QtGui.QApplication.UnicodeUTF8))
        self.gCriteria.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "###", None, QtGui.QApplication.UnicodeUTF8))
        self.label_9.setText(QtGui.QApplication.translate("Q7ToolsWindow", "name:", None, QtGui.QApplication.UnicodeUTF8))
        self.cDataCheck.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "Data", None, QtGui.QApplication.UnicodeUTF8))
        self.label_11.setText(QtGui.QApplication.translate("Q7ToolsWindow", "type:", None, QtGui.QApplication.UnicodeUTF8))
        self.label_12.setText(QtGui.QApplication.translate("Q7ToolsWindow", "max size:", None, QtGui.QApplication.UnicodeUTF8))
        self.label_13.setText(QtGui.QApplication.translate("Q7ToolsWindow", "value:", None, QtGui.QApplication.UnicodeUTF8))
        self.cRegexpValue.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "String is a regular expression", None, QtGui.QApplication.UnicodeUTF8))
        self.cNotValue.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Use all strings but this one", None, QtGui.QApplication.UnicodeUTF8))
        self.cNotDataType.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Use all strings but this one", None, QtGui.QApplication.UnicodeUTF8))
        self.label_10.setText(QtGui.QApplication.translate("Q7ToolsWindow", "SIDS type:", None, QtGui.QApplication.UnicodeUTF8))
        self.cRegexpName.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "String is a regular expression", None, QtGui.QApplication.UnicodeUTF8))
        self.cNotName.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Use all strings but this one", None, QtGui.QApplication.UnicodeUTF8))
        self.cRegexpSIDStype.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "String is a regular expression", None, QtGui.QApplication.UnicodeUTF8))
        self.cNotSIDStype.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Use all strings but this one", None, QtGui.QApplication.UnicodeUTF8))
        self.rAddToCurrent.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Add to current selection", None, QtGui.QApplication.UnicodeUTF8))
        self.rClearCurrent.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Clear current selection first", None, QtGui.QApplication.UnicodeUTF8))
        self.rWithinCurrent.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Within current selection", None, QtGui.QApplication.UnicodeUTF8))
        self.bRunSearch.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Run current selection criteria", None, QtGui.QApplication.UnicodeUTF8))
        self.label_19.setText(QtGui.QApplication.translate("Q7ToolsWindow", "name:", None, QtGui.QApplication.UnicodeUTF8))
        self.bFindQuery.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Load search query with this name", None, QtGui.QApplication.UnicodeUTF8))
        self.eWithLinks.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Include links", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.search), QtGui.QApplication.translate("Q7ToolsWindow", "Search", None, QtGui.QApplication.UnicodeUTF8))
        self.gdiff.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "All tree identifications use view number", None, QtGui.QApplication.UnicodeUTF8))
        self.label.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Version A", None, QtGui.QApplication.UnicodeUTF8))
        self.cAncestor.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Select first tree to diff", None, QtGui.QApplication.UnicodeUTF8))
        self.label_2.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Version B", None, QtGui.QApplication.UnicodeUTF8))
        self.cShowA.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Show result on B view", None, QtGui.QApplication.UnicodeUTF8))
        self.bDiff.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Process the diff", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.diff), QtGui.QApplication.translate("Q7ToolsWindow", "Diff", None, QtGui.QApplication.UnicodeUTF8))
        self.gdiff_2.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "All tree identifications use view number", None, QtGui.QApplication.UnicodeUTF8))
        self.groupBox_5.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "Version A", None, QtGui.QApplication.UnicodeUTF8))
        self.rForceA.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Force A values when different", None, QtGui.QApplication.UnicodeUTF8))
        self.rAncestorA.setText(QtGui.QApplication.translate("Q7ToolsWindow", "A replaces the common ancestor", None, QtGui.QApplication.UnicodeUTF8))
        self.label_5.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Prefix", None, QtGui.QApplication.UnicodeUTF8))
        self.groupBox_6.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "Version B", None, QtGui.QApplication.UnicodeUTF8))
        self.rForceB.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Force B values when different", None, QtGui.QApplication.UnicodeUTF8))
        self.rAncestorB.setText(QtGui.QApplication.translate("Q7ToolsWindow", "B replaces the common ancestor", None, QtGui.QApplication.UnicodeUTF8))
        self.label_6.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Prefix", None, QtGui.QApplication.UnicodeUTF8))
        self.groupBox_7.setTitle(QtGui.QApplication.translate("Q7ToolsWindow", "Ancestor", None, QtGui.QApplication.UnicodeUTF8))
        self.rForceNone.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Keep both values when different", None, QtGui.QApplication.UnicodeUTF8))
        self.rAncestor.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Use common ancestor", None, QtGui.QApplication.UnicodeUTF8))
        self.cAutoMerge.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Auto", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.merge), QtGui.QApplication.translate("Q7ToolsWindow", "Merge", None, QtGui.QApplication.UnicodeUTF8))
        self.label_15.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Group:", None, QtGui.QApplication.UnicodeUTF8))
        self.label_16.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Query:", None, QtGui.QApplication.UnicodeUTF8))
        self.bOperateDoc.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Show Query doc", None, QtGui.QApplication.UnicodeUTF8))
        self.label_17.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Args:", None, QtGui.QApplication.UnicodeUTF8))
        self.bApply.setToolTip(QtGui.QApplication.translate("Q7ToolsWindow", "Run Query", None, QtGui.QApplication.UnicodeUTF8))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.Queries), QtGui.QApplication.translate("Q7ToolsWindow", "Queries", None, QtGui.QApplication.UnicodeUTF8))
        self.bClose.setText(QtGui.QApplication.translate("Q7ToolsWindow", "Close", None, QtGui.QApplication.UnicodeUTF8))

import Res_rc
