#  -------------------------------------------------------------------------
#  pyCGNS.NAV - Python package for CFD General Notation System - NAVigater
#  See license.txt file in the root directory of this Python module source  
#  -------------------------------------------------------------------------
#  $Release$
#  -------------------------------------------------------------------------
import Tkinter
Tkinter.wantobjects=0 #necessary for tk-8.5 and some buggy tkinter installs
from Tkinter import *
import numpy
import string

import s7globals
G___=s7globals.s7G
import s7windoz

sliding_fmts={
  'd':["%12.4e",12],
  'f':["%12.4e",12],
  'S':["%s",1],
  'c':["%1s",1],  
  'i':["%4d",12],
  'l':["%4d",12],
}

class SlidingWindowView(Frame):
  def __init__(self, master, data,
               format=None, dtype=None, selectcolor=None, targetcolor=None,
               dimsorientation=None,lsize=None):
    # --- options
    if (dtype):
      self.dtype=dtype
    else:
      self.dtype=data.dtype.char
    if (format):
      self.dfmt=format
    else:
      self.dfmt=sliding_fmts[self.dtype][0]
    if (selectcolor):
      self.selectcolor=selectcolor
    else:
      self.selectcolor='#e2f4db'
    if (targetcolor):
      self.targetcolor=targetcolor
    else:
      self.targetcolor='#ffb6a2'
    if (lsize):
      self.lsize=lsize
    else:
      self.lsize=sliding_fmts[self.dtype][1]
    
    # --- variables
    self.lists   = []
    self.hlabels = []
    self.vlabels = []

    self.zerostart=0
    self.resolution=1

    self.hpos=0
    self.vpos=0
    self.ppos=0
    self.hposprev=0
    self.vposprev=0
    self.pposprev=0

    self.lastselected=None
    self.selectedhpos=None
    self.selectedvpos=None      
    self.selectedcol =0
    self.selectedrow =0

    self.vdata=1
    self.hdata=1
    self.pdata=1

    self.data=data
    self.dims=len(self.data.shape)
    
    self.hdata=self.data.shape[0]
    if (self.dims>1): self.vdata=self.data.shape[1]
    if (self.dims>2): self.pdata=self.data.shape[2]      

    # --- fonts, colors, formats
    self.lfont=G___.font['E']
    self.dfont=G___.font['E']
    self.ifmt=" "*(len(self.dfmt%1.2)-4)+"%4d"
    self.jfmt="%4d"
    self.kfmt="%4d"

    self.vsize=min(self.vdata,10)
    self.hsize=min(self.hdata,10)
    if (self.dtype=='c'):
      self.hsize=min(self.hdata,32)
      self.ifmt="%"+"%d"%(len(str(self.hdata)))+"d"
    self.psize=min(self.pdata,10)

    # --- window
    Frame.__init__(self, master)
    if (self.dims>2):
      bk=Label(self,text=self.kfmt%self.ppos,font=self.lfont,
               borderwidth=1,relief=SUNKEN,)
      bk.grid(row=1,column=1,sticky=NW,columnspan=1)
      bk.bind('<Button-1>', self.upK)
      bk.bind('<Button-3>', self.downK)
      self.pbutton=bk
    if (self.dims>1):
      lv=Listbox(self,width=4,selectborderwidth=0,height=self.vsize,
                 selectbackground='#e5e5e5',selectforeground='black',
                 relief=SUNKEN,borderwidth=1,exportselection=FALSE,
                 bg='#e5e5e5',font=self.lfont)
      lv.grid(row=2,column=1,sticky=NW+E,columnspan=1)
      for idxv in range(self.vsize):
        lv.insert(END,self.jfmt%idxv)
      self.vlabels=lv

    il=Label(self,text="i",font=self.lfont)
    il.grid(row=1,column=0,sticky=NW,columnspan=1)
    jl=Label(self,text="j",font=self.lfont)
    jl.grid(row=0,column=1,sticky=NW,columnspan=1)
    kl=Label(self,text="k",font=self.lfont)
    kl.grid(row=0,column=0,sticky=NW,columnspan=1)

    cols=[]
    for idxh in range(self.hsize):
      cols+=[(idxh,self.lsize)]
      
    tcol=1
    for l,w in cols[0:self.hsize]:
      lb=Label(self,text=self.ifmt%l,
               borderwidth=1,relief=SUNKEN,
               padx=0,pady=0,font=self.lfont)
      lb.grid(row=1,column=tcol+1,columnspan=1)
      self.hlabels.append(lb)
      ls=Listbox(self,width=w,borderwidth=0,selectborderwidth=0,
                 relief=FLAT,exportselection=FALSE,bg='white',
                 selectbackground=self.selectcolor,height=self.vsize,
                 selectforeground='black',font=self.dfont,takefocus=1)
      ls.grid(row=2,column=tcol+1,sticky=NW+E,rowspan=self.vsize)
      tcol+=1
      self.lists.append(ls)
      ls.bind('<Button-1>', lambda e, s=self: s._select(e, e.y))
      ls.bind('<B1-Motion>',lambda e: 'break')
      ls.bind('<Enter>',    lambda e: 'break')
      ls.bind('<Leave>',    lambda e: 'break')

    # bind_all breaks treectrl keys, fix it later
    self.bind_all('<Shift-KeyPress-Up>',       self.upI)
    self.bind_all('<Shift-KeyPress-Down>',     self.downI)
    self.bind_all('<Shift-KeyPress-Right>',    self.upJ)
    self.bind_all('<Shift-KeyPress-Left>',     self.downJ)
    self.bind_all('<Shift-KeyPress-Next>',     self.upK)
    self.bind_all('<Shift-KeyPress-Prior>',    self.downK)

#    self.bind_all('<Shift-KeyPress-KP_Up>',    self.upI)
#    self.bind_all('<Shift-KeyPress-KP_Down>',  self.downI)
#    self.bind_all('<Shift-KeyPress-KP_Right>', self.upJ)
#    self.bind_all('<Shift-KeyPress-KP_Left>',  self.downJ)
#    self.bind_all('<Shift-KeyPress-KP_Next>',  self.upK)
#    self.bind_all('<Shift-KeyPress-KP_Prior>', self.downK)

    self.bind_all('<KeyPress-Up>',       self.upTargetI)
    self.bind_all('<KeyPress-Down>',     self.downTargetI)
    self.bind_all('<KeyPress-Right>',    self.upTargetJ)
    self.bind_all('<KeyPress-Left>',     self.downTargetJ)

#     self.bind('<KeyPress-KP_Up>',    self.upTargetI)
#     self.bind('<KeyPress-KP_Down>',  self.downTargetI)
#     self.bind('<KeyPress-KP_Right>', self.upTargetJ)
#     self.bind('<KeyPress-KP_Left>',  self.downTargetJ)

    self.lists[0].update_idletasks()
    hls=self.lists[0].winfo_width()*(self.hsize)
    vls=self.lists[0].winfo_height()
    self.scx=Scale(self,from_=self.zerostart,length=hls,showvalue=0,
                   to=self.hdata-self.hsize+1,borderwidth=1,relief=SUNKEN,
                   resolution=self.resolution,orient=HORIZONTAL,
                   command=self.setHcursor)
    self.scx.grid(row=0,column=2,columnspan=self.hsize,sticky=W+E)
    if (self.dims>1):
      self.scy=Scale(self,length=vls,from_=self.zerostart,showvalue=0,
                     to=self.vdata-self.vsize,borderwidth=1,relief=SUNKEN,
                     resolution=self.resolution,orient=VERTICAL,
                     command=self.setVcursor)
      self.scy.grid(row=2,rowspan=self.vsize,sticky=N+S)

    # --- contents
    for l in self.getArrayWindow():
      self.insert(END,l)

  def upI(self,e):
    self.vposprev=self.vpos
    self.vpos=min(self.vpos+1,self.vdata-1)
    self.scy.set(self.vpos)
    self.updateWindow()
    print 'up I:',self.vpos, self.hpos

  def downI(self,e):
    self.vposprev=self.vpos
    self.vpos=max(self.vpos-1,0)
    self.scy.set(self.vpos)
    self.updateWindow()
    print 'down I:',self.vpos, self.hpos

  def upJ(self,e):
    self.hposprev=self.hpos
    self.hpos=min(self.hpos+1,self.hdata-1)
    self.updateWindow()
    self.scx.set(self.hpos)
    print 'up J:',self.vpos,self.hpos    

  def downJ(self,e):
    print 'down J:',self.vpos,self.hpos
    self.hposprev=self.hpos
    self.hpos=max(self.hpos-1,0)
    self.updateWindow()
    self.scx.set(self.hpos)    

  def upK(self,e):
    self.pposprev=self.ppos
    self.ppos=min(self.ppos+1,self.pdata-1)
    self.pbutton.configure(text=self.kfmt%self.ppos)
    self.updateWindow()
    print 'up K:',self.ppos

  def downK(self,e):
    self.pposprev=self.ppos
    self.ppos=max(self.ppos-1,0)
    self.pbutton.configure(text=self.kfmt%self.ppos)
    self.updateWindow()
    print 'down K:',self.ppos
    
  def upTargetI(self,e):
    self.selectedrow=max(self.selectedrow-1,0)
    self.updateWindow()
    print 'up t I:',self.selectedcol,self.selectedrow

  def downTargetI(self,e):
    self.selectedrow=min(self.selectedrow+1,self.vdata-1)
    self.updateWindow()
    print 'down t I:',self.selectedcol,self.selectedrow

  def upTargetJ(self,e):
    if (self.selectedcol!=None):
      self.selectedcol=min(self.selectedcol+1,self.hdata-1)
      self.updateWindow()
    print 'up t J:',self.selectedcol,self.selectedrow,self.hdata-1

  def downTargetJ(self,e):
    if (self.selectedcol and self.selectedcol<self.hdata):
      self.selectedcol=max(self.selectedcol-1,0)
      self.updateWindow()
    print 'down t J:',self.selectedcol,self.selectedrow

  def upTargetK(self,e):
    pass

  def downTargetK(self,e):
    pass
    
  def getArrayWindow(self):
    vmin=min(self.vpos,self.vdata-self.vsize)
    vmax=min(self.vpos+self.vsize,self.vdata)
    hmin=min(self.hpos,self.hdata-self.hsize)
    hmax=min(self.hpos+self.hsize,self.hdata)
    w=[]
    self.selectedcol=0
    self.selectedrow=0
    srow=0
    if (self.dims>1): self.vlabels.delete(0,END)
    for vdx in range(vmin,vmax):
      l=[]
      scol=0 
      if (self.dims>1): self.vlabels.insert(END,self.jfmt%vdx)
      for hdx in range(hmin,hmax):
        if (not srow):
          self.hlabels[scol].configure(text=self.ifmt%hdx)
        if (self.dims==1): l+=[self.dfmt%self.data[hdx]]
        if (self.dims==2): l+=[self.dfmt%self.data[hdx][vdx]]
        if (self.dims==3): l+=[self.dfmt%self.data[hdx][vdx][self.ppos]]      
        if (hdx==self.selectedhpos): self.selectedcol=scol
        if (vdx==self.selectedvpos): self.selectedrow=srow
        scol+=1
      w.append(l)
      srow+=1
    return w

  def updateWindow(self):
    if (self.pposprev!=self.ppos):
      self.delete(0,END)
      for l in self.getArrayWindow():
        self.insert(END,l)
    elif ((self.hposprev==self.hpos)
          and (self.vposprev!=self.vpos)):
      self.delete(0,END)
      for l in self.getArrayWindow():
        self.insert(END,l)
    elif ((self.vposprev==self.vpos)
          and (self.hposprev!=self.hpos)):
      self.delete(0,END)
      for l in self.getArrayWindow():
        self.insert(END,l)
    self.reselect()

  def reselect(self):
    if (self.lastselected):
        self.lastselected.configure(bg='white',
                                    selectbackground=self.selectcolor)
    self.selection_clear(0, END)
    col=self.selectedcol
    row=self.selectedrow
    if (row!=None):
      self.selection_set(row)
    if (col!=None):
      self.lists[col].configure(bg=self.selectcolor,
                                selectbackground=self.targetcolor)
      self.lastselected=self.lists[col]
      
  def _select(self,e,y):
      row = self.lists[0].nearest(y)
      for col in range(len(self.lists)):
        if (self.lists[col]==e.widget): break
      self.selectedhpos=min(self.hpos+col,self.hdata-self.hsize+col)
      self.selectedvpos=min(self.vpos+row,self.vdata-self.vsize+row)
      if (self.lastselected):
          self.lastselected.configure(bg='white',
                                      selectbackground=self.selectcolor)
      e.widget.configure(bg=self.selectcolor)
      e.widget.configure(selectbackground=self.targetcolor)
      self.lastselected=e.widget
      self.selection_clear(0,END)
      self.selection_set(row)
      return 'break'

  def setHcursor(self,h):
     self.hpos=int(h)
     self.updateWindow()
     self.hposprev=self.hpos

  def setVcursor(self,v):
      self.vpos=int(v)
      self.updateWindow()
      self.vposprev=self.vpos

  def delete(self, first, last=None):
      for l in self.lists:
          l.delete(first, last)

  def insert(self, index, *elements):
    for e in elements:
      i=0
      for l in self.lists:
        l.insert(index, e[i])
        i+=1

  def selection_clear(self, first, last=None):
    for l in self.lists:
      l.selection_clear(first, last)

  def selection_set(self, first, last=None):
      for l in self.lists:
          l.selection_set(first, last)

class wSlidingWindowView(s7windoz.wWindoz,SlidingWindowView):
  def __init__(self,wcontrol,treefingerprint,node,path,parentnode=None):

    s7windoz.wWindoz.__init__(self,wcontrol)
    self._showindex=G___.showIndex
    self._viewtree=treefingerprint
    self._viewid=treefingerprint.nviews

    SlidingWindowView.__init__(self,self._wtop,node[1])
    self._viewid=treefingerprint.addView(self,path,'D')
    self._wtop.title('CGNS.NAV: [%s] View [%.2d]'%(treefingerprint.filename,
                                               self._viewid))
    self.grid(row=1,sticky=N+E+W+S)
    t=self.winfo_toplevel() 
    t.rowconfigure(2,weight=1)
    t.columnconfigure(2,weight=1)

  def updateViewAfterCheck(self,clist):
    pass

  def updateViewAfterRenameOrChangeValue(self,nlist):
    pass

  def updateViewAfterCutOrAdd(self):
    pass
  
  def onexit(self):
    self._control.delTreeView(self._viewid,
                              self._viewtree.filedir,
                              self._viewtree.filename)
    self.closeWindow()

# --------------------------------------------------------------------