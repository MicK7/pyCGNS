# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'CGNS/NAV/T/Q7AnimationWindow.ui'
#
# Created: Thu Jun 23 13:57:47 2016
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

class Ui_Q7AnimationWindow(object):
    def setupUi(self, Q7AnimationWindow):
        Q7AnimationWindow.setObjectName(_fromUtf8("Q7AnimationWindow"))
        Q7AnimationWindow.resize(715, 350)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(Q7AnimationWindow.sizePolicy().hasHeightForWidth())
        Q7AnimationWindow.setSizePolicy(sizePolicy)
        Q7AnimationWindow.setMinimumSize(QtCore.QSize(715, 350))
        Q7AnimationWindow.setMaximumSize(QtCore.QSize(1200, 350))
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/cgSpy.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        Q7AnimationWindow.setWindowIcon(icon)
        self.gridLayout = QtGui.QGridLayout(Q7AnimationWindow)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.horizontalLayout_2 = QtGui.QHBoxLayout()
        self.horizontalLayout_2.setObjectName(_fromUtf8("horizontalLayout_2"))
        self.bBackControl = QtGui.QPushButton(Q7AnimationWindow)
        self.bBackControl.setMinimumSize(QtCore.QSize(25, 25))
        self.bBackControl.setMaximumSize(QtCore.QSize(25, 25))
        self.bBackControl.setText(_fromUtf8(""))
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/top.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bBackControl.setIcon(icon1)
        self.bBackControl.setObjectName(_fromUtf8("bBackControl"))
        self.horizontalLayout_2.addWidget(self.bBackControl)
        self.bInfo = QtGui.QPushButton(Q7AnimationWindow)
        self.bInfo.setMinimumSize(QtCore.QSize(25, 25))
        self.bInfo.setMaximumSize(QtCore.QSize(25, 25))
        self.bInfo.setText(_fromUtf8(""))
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/help-view.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bInfo.setIcon(icon2)
        self.bInfo.setObjectName(_fromUtf8("bInfo"))
        self.horizontalLayout_2.addWidget(self.bInfo)
        spacerItem = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout_2.addItem(spacerItem)
        self.bClose = QtGui.QPushButton(Q7AnimationWindow)
        self.bClose.setObjectName(_fromUtf8("bClose"))
        self.horizontalLayout_2.addWidget(self.bClose)
        self.gridLayout.addLayout(self.horizontalLayout_2, 6, 0, 1, 1)
        self.verticalLayout = QtGui.QVBoxLayout()
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.diagTable = QtGui.QTreeWidget(Q7AnimationWindow)
        self.diagTable.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOn)
        self.diagTable.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOn)
        self.diagTable.setEditTriggers(QtGui.QAbstractItemView.NoEditTriggers)
        self.diagTable.setSelectionMode(QtGui.QAbstractItemView.SingleSelection)
        self.diagTable.setSelectionBehavior(QtGui.QAbstractItemView.SelectRows)
        self.diagTable.setObjectName(_fromUtf8("diagTable"))
        self.diagTable.headerItem().setText(0, _fromUtf8("1"))
        self.verticalLayout.addWidget(self.diagTable)
        self.gridLayout.addLayout(self.verticalLayout, 5, 0, 1, 1)
        self.horizontalLayout = QtGui.QHBoxLayout()
        self.horizontalLayout.setObjectName(_fromUtf8("horizontalLayout"))
        self.bExpandAll = QtGui.QPushButton(Q7AnimationWindow)
        self.bExpandAll.setMinimumSize(QtCore.QSize(25, 25))
        self.bExpandAll.setMaximumSize(QtCore.QSize(25, 25))
        self.bExpandAll.setText(_fromUtf8(""))
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/level-in.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bExpandAll.setIcon(icon3)
        self.bExpandAll.setObjectName(_fromUtf8("bExpandAll"))
        self.horizontalLayout.addWidget(self.bExpandAll)
        self.bCollapseAll = QtGui.QPushButton(Q7AnimationWindow)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(25)
        sizePolicy.setVerticalStretch(25)
        sizePolicy.setHeightForWidth(self.bCollapseAll.sizePolicy().hasHeightForWidth())
        self.bCollapseAll.setSizePolicy(sizePolicy)
        self.bCollapseAll.setMinimumSize(QtCore.QSize(25, 25))
        self.bCollapseAll.setMaximumSize(QtCore.QSize(25, 25))
        self.bCollapseAll.setText(_fromUtf8(""))
        icon4 = QtGui.QIcon()
        icon4.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/level-out.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bCollapseAll.setIcon(icon4)
        self.bCollapseAll.setObjectName(_fromUtf8("bCollapseAll"))
        self.horizontalLayout.addWidget(self.bCollapseAll)
        spacerItem1 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem1)
        self.bFrameAdd = QtGui.QPushButton(Q7AnimationWindow)
        self.bFrameAdd.setMinimumSize(QtCore.QSize(25, 25))
        self.bFrameAdd.setMaximumSize(QtCore.QSize(25, 25))
        self.bFrameAdd.setText(_fromUtf8(""))
        icon5 = QtGui.QIcon()
        icon5.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-add.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bFrameAdd.setIcon(icon5)
        self.bFrameAdd.setObjectName(_fromUtf8("bFrameAdd"))
        self.horizontalLayout.addWidget(self.bFrameAdd)
        self.bFrameDel = QtGui.QPushButton(Q7AnimationWindow)
        self.bFrameDel.setMinimumSize(QtCore.QSize(25, 25))
        self.bFrameDel.setMaximumSize(QtCore.QSize(25, 25))
        self.bFrameDel.setText(_fromUtf8(""))
        icon6 = QtGui.QIcon()
        icon6.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-del.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bFrameDel.setIcon(icon6)
        self.bFrameDel.setObjectName(_fromUtf8("bFrameDel"))
        self.horizontalLayout.addWidget(self.bFrameDel)
        spacerItem2 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem2)
        self.pushButton_7 = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton_7.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton_7.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton_7.setText(_fromUtf8(""))
        icon7 = QtGui.QIcon()
        icon7.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-auto-sids.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_7.setIcon(icon7)
        self.pushButton_7.setObjectName(_fromUtf8("pushButton_7"))
        self.horizontalLayout.addWidget(self.pushButton_7)
        spacerItem3 = QtGui.QSpacerItem(40, 20, QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem3)
        self.bSave = QtGui.QPushButton(Q7AnimationWindow)
        self.bSave.setMinimumSize(QtCore.QSize(25, 25))
        self.bSave.setMaximumSize(QtCore.QSize(25, 25))
        self.bSave.setText(_fromUtf8(""))
        icon8 = QtGui.QIcon()
        icon8.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-save.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.bSave.setIcon(icon8)
        self.bSave.setObjectName(_fromUtf8("bSave"))
        self.horizontalLayout.addWidget(self.bSave)
        self.gridLayout.addLayout(self.horizontalLayout, 3, 0, 1, 1)
        self.horizontalLayout_3 = QtGui.QHBoxLayout()
        self.horizontalLayout_3.setObjectName(_fromUtf8("horizontalLayout_3"))
        self.pushButton = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton.setText(_fromUtf8(""))
        icon9 = QtGui.QIcon()
        icon9.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-item-first.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton.setIcon(icon9)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.horizontalLayout_3.addWidget(self.pushButton)
        self.pushButton_2 = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton_2.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton_2.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton_2.setText(_fromUtf8(""))
        icon10 = QtGui.QIcon()
        icon10.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-item-prev.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_2.setIcon(icon10)
        self.pushButton_2.setObjectName(_fromUtf8("pushButton_2"))
        self.horizontalLayout_3.addWidget(self.pushButton_2)
        self.pushButton_5 = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton_5.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton_5.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton_5.setText(_fromUtf8(""))
        icon11 = QtGui.QIcon()
        icon11.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-item-next.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_5.setIcon(icon11)
        self.pushButton_5.setObjectName(_fromUtf8("pushButton_5"))
        self.horizontalLayout_3.addWidget(self.pushButton_5)
        self.pushButton_6 = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton_6.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton_6.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton_6.setText(_fromUtf8(""))
        icon12 = QtGui.QIcon()
        icon12.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-item-last.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_6.setIcon(icon12)
        self.pushButton_6.setObjectName(_fromUtf8("pushButton_6"))
        self.horizontalLayout_3.addWidget(self.pushButton_6)
        self.cActors = QtGui.QComboBox(Q7AnimationWindow)
        self.cActors.setObjectName(_fromUtf8("cActors"))
        self.horizontalLayout_3.addWidget(self.cActors)
        self.pushButton_3 = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton_3.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton_3.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton_3.setText(_fromUtf8(""))
        icon13 = QtGui.QIcon()
        icon13.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-item-add.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_3.setIcon(icon13)
        self.pushButton_3.setObjectName(_fromUtf8("pushButton_3"))
        self.horizontalLayout_3.addWidget(self.pushButton_3)
        self.pushButton_4 = QtGui.QPushButton(Q7AnimationWindow)
        self.pushButton_4.setMinimumSize(QtCore.QSize(25, 25))
        self.pushButton_4.setMaximumSize(QtCore.QSize(25, 25))
        self.pushButton_4.setText(_fromUtf8(""))
        icon14 = QtGui.QIcon()
        icon14.addPixmap(QtGui.QPixmap(_fromUtf8(":/images/icons/anim-item-del.png")), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_4.setIcon(icon14)
        self.pushButton_4.setObjectName(_fromUtf8("pushButton_4"))
        self.horizontalLayout_3.addWidget(self.pushButton_4)
        self.gridLayout.addLayout(self.horizontalLayout_3, 4, 0, 1, 1)

        self.retranslateUi(Q7AnimationWindow)
        QtCore.QMetaObject.connectSlotsByName(Q7AnimationWindow)

    def retranslateUi(self, Q7AnimationWindow):
        Q7AnimationWindow.setWindowTitle(_translate("Q7AnimationWindow", "Form", None))
        self.bClose.setText(_translate("Q7AnimationWindow", "Close", None))

import Res_rc
