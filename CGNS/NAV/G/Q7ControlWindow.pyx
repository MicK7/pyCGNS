# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'CGNS/NAV/T/Q7ControlWindow.ui'
#
# Created: Thu Jun 23 13:57:33 2016
#      by: PyQt4 UI code generator 4.11.1
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_Q7ControlWindow(object):
    def setupUi(self, Q7ControlWindow):
        Q7ControlWindow.setObjectName(_fromUtf8("Q7ControlWindow"))
        Q7ControlWindow.resize(799, 232)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(Q7ControlWindow.sizePolicy().hasHeightForWidth())
        Q7ControlWindow.setSizePolicy(sizePolicy)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/cgSpy.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        Q7ControlWindow.setWindowIcon(icon)
        self.verticalLayout_2 = QtGui.QVBoxLayout(Q7ControlWindow)
        self.verticalLayout_2.setObjectName(_fromUtf8("verticalLayout_2"))
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.bTreeLoadLast = QtGui.QToolButton(Q7ControlWindow)
        self.bTreeLoadLast.setMinimumSize(QtCore.QSize(25, 25))
        self.bTreeLoadLast.setMaximumSize(QtCore.QSize(25, 25))
        self.bTreeLoadLast.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/tree-load-g.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bTreeLoadLast.setIcon(icon1)
        self.bTreeLoadLast.setObjectName(_fromUtf8("bTreeLoadLast"))
        self.horizontalLayout.addWidget(self.bTreeLoadLast)
        self.bTreeLoad = QtGui.QToolButton(Q7ControlWindow)
        self.bTreeLoad.setMinimumSize(QtCore.QSize(25, 25))
        self.bTreeLoad.setMaximumSize(QtCore.QSize(25, 25))
        self.bTreeLoad.setText(_fromUtf8(""))
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/tree-load.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bTreeLoad.setIcon(icon2)
        self.bTreeLoad.setObjectName(_fromUtf8("bTreeLoad"))
        self.horizontalLayout.addWidget(self.bTreeLoad)
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.bEditTree = QtGui.QToolButton(Q7ControlWindow)
        self.bEditTree.setMinimumSize(QtCore.QSize(25, 25))
        self.bEditTree.setMaximumSize(QtCore.QSize(25, 25))
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/tree-new.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bEditTree.setIcon(icon3)
        self.bEditTree.setObjectName(_fromUtf8("bEditTree"))
        self.horizontalLayout.addWidget(self.bEditTree)
        self.bPatternView = QtGui.QToolButton(Q7ControlWindow)
        self.bPatternView.setMinimumSize(QtCore.QSize(25, 25))
        self.bPatternView.setMaximumSize(QtCore.QSize(25, 25))
        icon4 = QtGui.QIcon()
        icon4.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/pattern.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bPatternView.setIcon(icon4)
        self.bPatternView.setObjectName(_fromUtf8("bPatternView"))
        self.horizontalLayout.addWidget(self.bPatternView)
        spacerItem1 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem1)
        self.bLog = QtGui.QPushButton(Q7ControlWindow)
        self.bLog.setMinimumSize(QtCore.QSize(25, 25))
        self.bLog.setMaximumSize(QtCore.QSize(25, 25))
        self.bLog.setText(_fromUtf8(""))
        icon5 = QtGui.QIcon()
        icon5.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/subtree-sids-warning.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bLog.setIcon(icon5)
        self.bLog.setObjectName(_fromUtf8("bLog"))
        self.horizontalLayout.addWidget(self.bLog)
        spacerItem2 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem2)
        self.bOptionView = QtGui.QToolButton(Q7ControlWindow)
        self.bOptionView.setMinimumSize(QtCore.QSize(25, 25))
        self.bOptionView.setMaximumSize(QtCore.QSize(25, 25))
        icon6 = QtGui.QIcon()
        icon6.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/options-view.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bOptionView.setIcon(icon6)
        self.bOptionView.setObjectName(_fromUtf8("bOptionView"))
        self.horizontalLayout.addWidget(self.bOptionView)
        self.bInfo = QtGui.QPushButton(Q7ControlWindow)
        self.bInfo.setMinimumSize(QtCore.QSize(25, 25))
        self.bInfo.setMaximumSize(QtCore.QSize(25, 25))
        self.bInfo.setText(_fromUtf8(""))
        icon7 = QtGui.QIcon()
        icon7.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/help-view.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bInfo.setIcon(icon7)
        self.bInfo.setObjectName(_fromUtf8("bInfo"))
        self.horizontalLayout.addWidget(self.bInfo)
        self.bAbout = QtGui.QToolButton(Q7ControlWindow)
        self.bAbout.setMinimumSize(QtCore.QSize(25, 25))
        self.bAbout.setMaximumSize(QtCore.QSize(25, 25))
        icon8 = QtGui.QIcon()
        icon8.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/view-help.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bAbout.setIcon(icon8)
        self.bAbout.setObjectName(_fromUtf8("bAbout"))
        self.horizontalLayout.addWidget(self.bAbout)
        spacerItem3 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem3)
        self.bClose = QtGui.QPushButton(Q7ControlWindow)
        self.bClose.setMinimumSize(QtCore.QSize(25, 25))
        self.bClose.setMaximumSize(QtCore.QSize(25, 25))
        self.bClose.setText(_fromUtf8(""))
        icon9 = QtGui.QIcon()
        icon9.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/close-view.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bClose.setIcon(icon9)
        self.bClose.setObjectName(_fromUtf8("bClose"))
        self.horizontalLayout.addWidget(self.bClose)
        self.verticalLayout_2.addLayout(self.horizontalLayout)
        self.controlTable = Q7ControlTableWidget(Q7ControlWindow)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.controlTable.sizePolicy().hasHeightForWidth())
        self.controlTable.setSizePolicy(sizePolicy)
        self.controlTable.setMinimumSize(QtCore.QSize(781, 181))
        self.controlTable.setEditTriggers(QtGui.QAbstractItemView.NoEditTriggers)
        self.controlTable.setTabKeyNavigation(False)
        self.controlTable.setProperty("showDropIndicator", False)
        self.controlTable.setDragDropOverwriteMode(False)
        self.controlTable.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.controlTable.setSelectionBehavior(QtGui.QAbstractItemView.SelectRows)
        self.controlTable.setCornerButtonEnabled(False)
        self.controlTable.setRowCount(0)
        self.controlTable.setColumnCount(6)
        self.controlTable.setObjectName(_fromUtf8("controlTable"))
        self.controlTable.horizontalHeader().setCascadingSectionResizes(True)
        self.controlTable.horizontalHeader().setStretchLastSection(True)
        self.verticalLayout_2.addWidget(self.controlTable)

        self.retranslateUi(Q7ControlWindow)
        QtCore.QMetaObject.connectSlotsByName(Q7ControlWindow)

    def retranslateUi(self, Q7ControlWindow):
        Q7ControlWindow.setWindowTitle(_translate("Q7ControlWindow", "Form", None))
        self.bTreeLoadLast.setToolTip(_translate("Q7ControlWindow", "Load the last used CGNS file", None))
        self.bTreeLoad.setToolTip(_translate("Q7ControlWindow", "Load an existing CGNS file", None))
        self.bEditTree.setToolTip(_translate("Q7ControlWindow", "Create a new CGNS tree from scratch", None))
        self.bEditTree.setText(_translate("Q7ControlWindow", "...", None))
        self.bPatternView.setToolTip(_translate("Q7ControlWindow", "Open CGNS/SIDS sub-trees database", None))
        self.bPatternView.setText(_translate("Q7ControlWindow", "...", None))
        self.bLog.setToolTip(_translate("Q7ControlWindow", "Log window", None))
        self.bOptionView.setToolTip(_translate("Q7ControlWindow", "Set user defined options", None))
        self.bOptionView.setText(_translate("Q7ControlWindow", "...", None))
        self.bInfo.setToolTip(_translate("Q7ControlWindow", "Help window", None))
        self.bAbout.setToolTip(_translate("Q7ControlWindow", "About....", None))
        self.bAbout.setText(_translate("Q7ControlWindow", "...", None))
        self.bClose.setToolTip(_translate("Q7ControlWindow", "Close all CGNS.NAV windows", None))
        self.controlTable.setSortingEnabled(True)

from CGNS.NAV.mcontrol import Q7ControlTableWidget
import Res_rc
